import 'package:flutter/material.dart';
import 'package:flutter_sample/src/mvvm/mvvm_component.dart';
import 'package:flutter_sample/src/snapchat/common_widgets.dart';
import 'package:flutter_sample/src/snapchat/detail_inbox_component.dart';
import 'package:flutter_sample/src/snapchat/inbox_component.dart';
import 'package:flutter_sample/src/snapchat/inbox_model.dart';
import 'package:flutter_sample/src/snapchat/my_expandable_section.dart';
import 'package:flutter_sample/src/util.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class ChatComponent extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ChatState();
}

class ChatState extends State<ChatComponent> {
  var inboxes = Util.provideInboxItems();
  var sections = Util.provideExpandableItem();

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
            padding: const EdgeInsets.only(top: 1),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
                color: Colors.white),
            child: ExpandableListView(
              padding: const EdgeInsets.only(top: 8, bottom: 8),
              builder: SliverExpandableChildDelegate<InBoxModel,
                  MyExpandableSection>(
                  sectionList: sections,
                  // Allow list view recycler its children
                  addAutomaticKeepAlives: false,
                  separatorBuilder: (BuildContext context, bool _, int index) =>
                  const Divider(),
                  headerBuilder: (context, sectionIndex, index) =>
                      buildExpandableHeader(context, sectionIndex, index),
                  itemBuilder: (context, sectionIndex, itemIndex, index) =>
                      buildListViewChild(context, sectionIndex, itemIndex, index)
              ),
            )),
      ),
    );
  }

  Widget buildExpandableHeader(BuildContext context, int sectionIndex,
      int index) {
    var section = sections[sectionIndex];

    return InkWell(
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Text(
          section.header,
          textAlign: TextAlign.start,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
      ),
      onTap: () =>
      {
        setState(() => {section.setSectionExpanded(!section.isExpandable)})
      },
    );
  }

  Widget buildListViewChild(BuildContext context, int sectionIndex,
      int itemIndex, int index) {
    var inbox = sections[sectionIndex].items[itemIndex];
    return InkWell(
        child: InboxComponent(
          model: inbox,
        ),
        onTap: () => {
        Util.showSnackBar(context, inbox.senderName),
        Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => MvvmComponent()
        )
    )
  },
    onDoubleTap: () =>
    Util.showSnackBar(context, "Double tap"),
    onLongPress: () =>
    Util.showSnackBar(context, "Long press")
    ,
    );
  }
}
