import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/mvvm/api.client.dart';
import 'package:flutter_sample/src/mvvm/response_data.dart';
import 'package:flutter_sample/src/mvvm/user.dart';

class MvvmComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MvvmState();
}

class MvvmState extends State<MvvmComponent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter - Retrofit Implementation"),
      ),
      body: _buildBody(context),
    );
  }

  FutureBuilder<ResponseData> _buildBody(BuildContext context) {
    var apiClient = ApiClients(
        Dio(BaseOptions(contentType: "application/json")));
    return FutureBuilder<ResponseData>(
        future: apiClient.getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            var data = snapshot.data;
            classifyData(data);
            return Text("Data: ${snapshot.data?.data}");
          } else {
            return Text("Api error: ${snapshot.error}");
          }
        }
    );
  }

  // Widget _buildUserListView(BuildContext context, ResponseData? data) {
  //
  // }

  void classifyData(ResponseData? data) {
    var usersInJson = data?.data;
    if (usersInJson != null) {
      var users = List<User>.empty(growable: true);
      for (var element in usersInJson) {
        var user = User.fromJson(element);
        users.add(user);
      }
      users.sort((a, b) => a.name.compareTo(b.name));
      Map<String, Iterable<User>> categories = {};
      var name = users.first.name;
      if (name.isNotEmpty) {
        var flag = 0;
        while (flag != users.length) {
          var orderCharacter = name[0];
          var targets = users.where((element) => element.name.startsWith(orderCharacter));
          categories[orderCharacter] = targets;
          flag += targets.length;
          users.removeRange(0, targets.length - 1);
        }
        print(flag);
      }
    }
  }
}