
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/snapchat/inbox_model.dart';
import 'package:flutter_sample/src/snapchat/my_expandable_section.dart';

class Util {
  static List<InBoxModel> provideInboxItems() => [
    InBoxModel(id: 1, senderName: "Liam", isRead: true,),
    InBoxModel(id: 2, senderName: "Noah", isRead: false,),
    InBoxModel(id: 3, senderName: "Oliver", isRead: false, currentlyMessage: "Hey dude"),
    InBoxModel(id: 4, senderName: "William", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 5, senderName: "James", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 6, senderName: "Benjamin", isRead: true,),
    InBoxModel(id: 7, senderName: "Lucas", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 8, senderName: "Henry", isRead: false, currentlyMessage: "Hey dude"),
    InBoxModel(id: 9, senderName: "Mason", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 10, senderName: "Michael", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 11, senderName: "Ethan", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 12, senderName: "Daniel", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 13, senderName: "Jacob", isRead: true,),
    InBoxModel(id: 14, senderName: "Logan", isRead: true,),
    InBoxModel(id: 15, senderName: "Jackson", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 16, senderName: "Sebastian", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 17, senderName: "Mateo", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 18, senderName: "Jack", isRead: false,),
    InBoxModel(id: 19, senderName: "Owen", isRead: false, currentlyMessage: "Hey dude"),
    InBoxModel(id: 20, senderName: "Theodore", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 21, senderName: "Aiden", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 22, senderName: "Samuel", isRead: true,),
    InBoxModel(id: 23, senderName: "Joseph", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 24, senderName: "John", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 25, senderName: "David", isRead: true,),
    InBoxModel(id: 26, senderName: "Wyatt", isRead: false, currentlyMessage: "Hey dude"),
    InBoxModel(id: 27, senderName: "Mathew", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 28, senderName: "Luke", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 29, senderName: "Asher", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 30, senderName: "Carter", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 31, senderName: "Julian", isRead: true, currentlyMessage: "Hey dude"),
    InBoxModel(id: 32, senderName: "Grayson", isRead: true, currentlyMessage: "Hey dude"),
  ];

  static List<MyExpandableSection> provideExpandableItem([int numberOfSection = 7]) {
    var inboxes = provideInboxItems();
    var sections = List<MyExpandableSection>.empty(growable: true);
    for (int index = 0; index < numberOfSection; index++) {
      var ranges = inboxes.take(5).toList(growable: false);
      var section = MyExpandableSection()
      ..header = "Group $index"
      ..isExpandable = true
      ..items = ranges;
      sections.add(section);
      inboxes.removeRange(0, ranges.length);
    }
    return sections;
  }

  static showSnackBar(BuildContext context, String message) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(milliseconds: 500),),);
}