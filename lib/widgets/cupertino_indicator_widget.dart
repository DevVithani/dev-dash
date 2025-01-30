import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';

class CupertinoIndicatorWidget extends StatefulWidget {
  const CupertinoIndicatorWidget({super.key});

  @override
  State<CupertinoIndicatorWidget> createState() => _CupertinoIndicatorWidgetState();
}

class _CupertinoIndicatorWidgetState extends State<CupertinoIndicatorWidget> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        middle: const Text(
          'Cupertino Indicators',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      child: const Scaffold(
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              filePath: 'lib/widgets/cupertino_action_sheet_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/cupertino.dart';
            
            class CupertinoIndicatorExample extends StatefulWidget {
                     const CupertinoIndicatorExample({super.key});
            
              @override
              State<CupertinoIndicatorExample> createState() =>
                  _CupertinoIndicatorExampleState();
            }
            
            class _CupertinoIndicatorExampleState extends State<CupertinoIndicatorExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CupertinoActivityIndicator(),
                      SizedBox(height: 10),
                      Text('Default'),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CupertinoActivityIndicator(
                          radius: 20.0, color: CupertinoColors.activeBlue),
                      SizedBox(height: 10),
                      Text(
                        'radius: 20.0\ncolor: CupertinoColors.activeBlue',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 2,
                    height: 50,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      // Cupertino activity indicator with custom radius and disabled
                      // animation.
                      CupertinoActivityIndicator(radius: 20.0, animating: false),
                      SizedBox(height: 10),
                      Text(
                        'radius: 20.0\nanimating: false',
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 2,
            ),
                    ],
                  ),
                );
              }
            }
            ''',
              child: CupertinoIndicatorExample(),
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoIndicatorExample extends StatefulWidget {
  const CupertinoIndicatorExample({super.key});

  @override
  State<CupertinoIndicatorExample> createState() =>
      _CupertinoIndicatorExampleState();
}

class _CupertinoIndicatorExampleState extends State<CupertinoIndicatorExample> {

  String url = 'https://youtu.be/AENVH-ZqKDQ';

  YoutubePlayerController? controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(url);

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        enableCaption: true,
        loop: true,
        forceHD: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          YoutubePlayer(
            controller: controller!,
            progressColors: const ProgressBarColors(
              backgroundColor: Colors.black,
              handleColor: Colors.white,
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of CupertinoIndicator Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.animating\n'
              '2.color\n'
              '3.progress\n'
              '4.radius\n',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Examples: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoActivityIndicator(),
                    SizedBox(height: 10),
                    Text('Default'),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CupertinoActivityIndicator(
                        radius: 20.0, color: CupertinoColors.activeBlue),
                    SizedBox(height: 10),
                    Text(
                      'radius: 20.0\ncolor: CupertinoColors.activeBlue',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  height: 50,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Cupertino activity indicator with custom radius and disabled
                    // animation.
                    CupertinoActivityIndicator(radius: 20.0, animating: false),
                    SizedBox(height: 10),
                    Text(
                      'radius: 20.0\nanimating: false',
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
