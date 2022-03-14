import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_sample/src/default_localizations.dart';

class ProfileComponent extends StatefulWidget {
  const ProfileComponent({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProfileState();
  }
}

class ProfileState extends State<ProfileComponent> {
  int counter = 0;
  var top = 0.0;
  var appBarTitle = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          elevation: 0.0,
          expandedHeight: MediaQuery.of(context).size.height * 0.4,
          backgroundColor: const Color(0xff1c0436),
          centerTitle: true,
          title: Text(DefaultLocalizations.of(context)
                  ?.getStringResource("user_displayed_name") ??
              ""),
          pinned: true,
          floating: true,
          leading: Container(
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.4),
                borderRadius: BorderRadius.circular(8)),
            child: IconButton(
                icon: const Icon(Icons.arrow_back), onPressed: () {}),
          ),
          actions: [
            IconButton(icon: const Icon(Icons.more_vert), onPressed: () {})
          ],
          flexibleSpace: //MyFlexibleSpaceBarComponent(appBarHeight: MediaQuery.of(context).size.height * 0.4)
              FlexibleSpaceBar(
                  title: new Text('A Synthwave Mix'),
                  centerTitle: true,
                  titlePadding: const EdgeInsets.only(left: 20.0, bottom: 20.0),
                  background: MyFlexibleSpaceBarComponent(
                      appBarHeight: MediaQuery.of(context).size.height * 0.4)
                  //   ClipRRect(
                  //   borderRadius: BorderRadius.vertical(bottom: Radius.circular(50)),
                  //   child: Image.network(
                  //     'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg',
                  //     height: MediaQuery.of(context).size.height * 0.43,
                  //     width: MediaQuery.of(context).size.width,
                  //     fit: BoxFit.cover,
                  //   ),
                  // ),
                  ),
        ),
        const SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
            child: Center(
              child: Text('Scroll to see the SliverAppBar in effect.'),
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Container(
                color: index.isOdd ? Colors.white : Colors.black12,
                height: 100.0,
                child: Center(
                  child: Text('$index', textScaleFactor: 5),
                ),
              );
            },
            childCount: 20,
          ),
        ),
      ],
    ));
  }
}

class MyFlexibleSpaceBarComponent extends StatefulWidget {
  double appBarHeight;

  MyFlexibleSpaceBarComponent({Key? key, required this.appBarHeight})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MyFlexibleSpaceBarState(appBarHeight: appBarHeight);
  }
}

class MyFlexibleSpaceBarState extends State<MyFlexibleSpaceBarComponent> {
  double appBarHeight;

  MyFlexibleSpaceBarState({required this.appBarHeight});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext buildContext, BoxConstraints constraints) {
      return Opacity(
          opacity: constraints.biggest.height !=
                  MediaQuery.of(context).padding.top + kToolbarHeight
              ? 1.0
              : 0.0,
          child: Container(
            height: appBarHeight,
            decoration: const BoxDecoration(color: Colors.brown),
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                // Positioned(
                //     left: 10,
                //     top: 10,
                //     width: MediaQuery.of(context).size.width,
                //     child: AspectRatio(
                //       aspectRatio: 3 / 2,
                //       child: Container(
                //         decoration: BoxDecoration(color: Colors.blue),
                //       ),
                //     )),
                // Positioned(
                //     left: 20,
                //     top: 30,
                //     width: MediaQuery.of(context).size.width,
                //     child: AspectRatio(
                //       aspectRatio: 3 / 2,
                //       child: Container(
                //         decoration: BoxDecoration(color: Colors.amber),
                //       ),
                //     )),
                Image.network(
                  'https://mir-s3-cdn-cf.behance.net/project_modules/max_1200/4bb82b72535211.5bead62fe26d5.jpg',
                  height: appBarHeight * 0.5,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  alignment: Alignment.topCenter,
                ),
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.black.withOpacity(0.8),
                            Colors.white.withOpacity(0.6)
                          ],
                          begin: const FractionalOffset(0.0, 1.0),
                          end: const FractionalOffset(0.0, 0.0),
                          stops: const [0.0, 1.0])
                  ),
                  alignment: Alignment.topCenter,
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.black),
                  alignment: Alignment.bottomCenter,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: FractionallySizedBox(
                        widthFactor: 0.2,
                        alignment: Alignment.topCenter,
                        child: AspectRatio(
                          aspectRatio: 1 / 1,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                border:
                                    Border.all(color: Colors.amber, width: 4)),
                            padding: const EdgeInsets.all(1),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(
                                "https://cellularnews.com/wp-content/uploads/2020/05/26-billie-eilish-wallpaper-portrait-in-dim-light-325x485.jpg",
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Text(
                        DefaultLocalizations.of(context)
                                ?.getStringResource("user_name") ??
                            "",
                        style: const TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ));
    });
  }
}
