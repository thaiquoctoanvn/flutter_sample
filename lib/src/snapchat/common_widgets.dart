import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  String avatarUrl = "";
  String title = "";
  IconData? rightIcon;
  Color background = Colors.white.withOpacity(0.0);
  Color? titleTextColor = Colors.white;

  MyAppBar(
      {Key? key,
      required this.avatarUrl,
      required this.title,
      this.rightIcon,
      required this.background,
      this.titleTextColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).viewPadding.top;
    return Container(
      decoration: BoxDecoration(color: background),
      padding: EdgeInsets.only(top: statusBarHeight + statusBarHeight * 0.2, bottom: 8, left: 8, right: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(avatarUrl),
                  ))),
          const SizedBox(width: 8,),
          Expanded(
              flex: rightIcon != null ? 6 : 8,
              child: Text(
                title,
                textAlign: TextAlign.start,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis,
                    fontSize: 24,
                    color: titleTextColor),
                maxLines: 1,
              )),
          Expanded(
            flex: 0,
            child: AspectRatio(
                aspectRatio: 1 / 1,
                child: Icon(rightIcon ?? Icons.account_circle_outlined)),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
