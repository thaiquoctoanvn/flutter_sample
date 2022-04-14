import 'package:sticky_and_expandable_list/sticky_and_expandable_list.dart';

class CommonExpandableSection<T> extends ExpandableListSection<T> {
  late List<T> items;
  late bool isExpandable;
  late String header;

  @override
  List<T>? getItems() => items;

  @override
  bool isSectionExpanded() => isExpandable;

  @override
  void setSectionExpanded(bool expanded) {
    isExpandable = expanded;
  }
}