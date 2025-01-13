import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class NotificationListnerWidget extends StatefulWidget {
  const NotificationListnerWidget({super.key});

  @override
  State<NotificationListnerWidget> createState() =>
      _NotificationListnerWidgetState();
}

class _NotificationListnerWidgetState extends State<NotificationListnerWidget> {

  String url = 'https://youtu.be/cAnFbFoGM50';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Notification Listener',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: controller!,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                backgroundColor: Colors.white,
                handleColor: Colors.black,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              filePath: 'lib/widgets/notification_listner.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
            import 'package:flutter/material.dart';
              
              class NotificationExample extends StatefulWidget {
              const NotificationExample({super.key});
            
              @override
              State<NotificationExample> createState() => _NotificationExampleState();
            }
            
            class _NotificationExampleState extends State<NotificationExample> {
              String message = 'New';
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      height: 60,
                      color: Colors.orangeAccent,
                      child: Center(
                        child: Text(
                          message,
                          style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                      child: NotificationListener<ScrollNotification>(
                        onNotification: (scrollNotification) {
                          // Logic of scrollNotification
                          if (scrollNotification is ScrollStartNotification) {
                            setState(() {
                              message = 'Scroll Started';
                            });
                          } else if (scrollNotification is ScrollUpdateNotification) {
                            setState(() {
                              message = 'Scroll Updated';
                            });
                          } else if (scrollNotification is ScrollEndNotification) {
                            setState(
                              () {
                                message = 'Scroll Ended';
                              },
                            );
                          }
                          return true;
                        },
                        child: ListView.builder(
                          itemCount: 15,    // put number according your usage
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text('Item: index'),  //put dollar symbol before index
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
                );
              }
            }''',
              child: NotificationExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class NotificationExample extends StatefulWidget {
  const NotificationExample({super.key});

  @override
  State<NotificationExample> createState() => _NotificationExampleState();
}

class _NotificationExampleState extends State<NotificationExample> {
  String message = 'New';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            'Properties of NotificationListner Widget:',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            '1.child\n'
            '2.onNotification:',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            'Example: ',
            style: TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        Container(
          height: 60,
          color: Colors.orangeAccent,
          child: Center(
            child: Text(
              message,
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        Expanded(
          child: NotificationListener<ScrollNotification>(
            onNotification: (scrollNotification) {
              if (scrollNotification is ScrollStartNotification) {
                setState(() {
                  message = 'Scroll Started';
                });
              } else if (scrollNotification is ScrollUpdateNotification) {
                setState(() {
                  message = 'Scroll Updated';
                });
              } else if (scrollNotification is ScrollEndNotification) {
                setState(
                  () {
                    message = 'Scroll Ended';
                  },
                );
              }
              return true;
            },
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Item: ${index + 1}'),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
