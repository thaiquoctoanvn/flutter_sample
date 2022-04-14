import 'package:flutter_sample/src/snapchat/inbox_model.dart';
import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class MyExpandableSection implements ExpandableListSection<InBoxModel> {
  late List<InBoxModel> items;
  late bool isExpandable;
  late String header;

  @override
  List<InBoxModel>? getItems() => items;

  @override
  bool isSectionExpanded() => isExpandable;

  @override
  void setSectionExpanded(bool expanded) {
    isExpandable = expanded;
  }
}