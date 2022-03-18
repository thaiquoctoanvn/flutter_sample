import 'package:flutter/material.dart';
import 'package:flutter_sample/src/snapchat/inbox_model.dart';

class InboxComponent extends StatelessWidget {
  InBoxModel model;

  InboxComponent({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      padding: const EdgeInsets.all(8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
              flex: 2,
              child: AspectRatio(
                  aspectRatio: 1 / 1,
                  child: CircleAvatar(
                    backgroundImage: NetworkImage(model.smallAvatar ?? ""),
                    backgroundColor: Colors.amber,
                  ))),
          const SizedBox(
            width: 8,
          ),
          Expanded(
              flex: 8,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.senderName,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis,
                        fontSize: 20,
                        color: Colors.black),
                    maxLines: 1,
                  ),
                  Visibility(
                    visible: model.currentlyMessage != null ? true : false,
                    child: Text(
                      model.currentlyMessage ?? "Tap to view",
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          fontSize: 16,
                          color: Colors.grey),
                      maxLines: 1,
                    ),
                  )
                ],
              )),
        ],
      ),
    );
  }
}
