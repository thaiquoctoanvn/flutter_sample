import 'package:flutter/material.dart';
import 'package:flutter_sample/src/app.dart';
import 'package:flutter_sample/src/snapchat/common_widgets.dart';
import 'package:flutter_sample/src/snapchat/inbox_component.dart';
import 'package:flutter_sample/src/util.dart';

class ChatComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<ChatComponent> {
  var inboxes = Util.provideInboxItems();

  @override
  Widget build(BuildContext context) {
    //AppState.updateStatusBarBackground(Colors.blue);
    return Scaffold(
      appBar: MyAppBar(
        avatarUrl:
            "https://cellularnews.com/wp-content/uploads/2020/05/26-billie-eilish-wallpaper-portrait-in-dim-light-325x485.jpg",
        title: "Chatdgjdflgjldfjsjldjgritrtjdjglvm,cmv,cn,nxxxxxx",
        rightIcon: null,
        background: Colors.blue,
        titleTextColor: Colors.white,
      ),
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.blue,
        ),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
              color: Colors.white),
          child: ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                child: InboxComponent(model: inboxes[index]),
                onTap: () =>
                    {Util.showSnackBar(context, inboxes[index].senderName)},
                onDoubleTap: () => {Util.showSnackBar(context, "Double tap")},
                onLongPress: () => {Util.showSnackBar(context, "Long press")},
              );
            },
            itemCount: inboxes.length,
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            addAutomaticKeepAlives: false,
          ),
        ),
      ),
    );
  }
}
