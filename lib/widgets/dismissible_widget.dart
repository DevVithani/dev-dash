import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';

class DismissibleWidget extends StatefulWidget {
  const DismissibleWidget({super.key});

  @override
  State<DismissibleWidget> createState() => _DismissibleWidgetState();
}

class _DismissibleWidgetState extends State<DismissibleWidget> {

  String url = 'https://youtu.be/iEMgjrfuc58';

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
        title: const Text(
          'Dismissible',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: controller!,
              progressColors: const ProgressBarColors(
                backgroundColor: Colors.black,
                handleColor: Colors.white,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              filePath: 'lib/widgets/dismissible_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class DismissibleExample extends StatefulWidget {
              const DismissibleExample({super.key});
            
              @override
              State<DismissibleExample> createState() => _DismissibleExampleState();
            }
            
            class _DismissibleExampleState extends State<DismissibleExample> {
              List<String> fruits = [
                'Orange',
                'Mango',
                'Apple',
                'Watermelon',
                'Banana',
                'Tomato',
                'Lemon',
              ];
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            clipBehavior: Clip.none,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 2.2,
                  child: ListView.builder(
                    itemCount: fruits.length,
                    itemBuilder: (context, index) {
                      final item = fruits[index];
                      return Dismissible(
                        key: Key(item),
                        onDismissed: (direction) {
                          if (direction == DismissDirection.startToEnd) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: const Duration(seconds: 2),
                                backgroundColor: Colors.red,
                                content: Text(
                                  '{fruits[index]} Deleted!',   // put dollar symbol before {}
                                  style: const TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              duration: const Duration(seconds: 2),
                              content: Text(
                                '{fruits[index]} Saved!',  // put dollar symbol before {}
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              backgroundColor: Colors.green,
                            ));
                          }
                        },
                        background: Container(
                          color: Colors.red,
                          alignment: Alignment.centerRight,
                          padding: const EdgeInsets.only(right: 20),
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        secondaryBackground: Container(
                          color: Colors.green,
                          alignment: Alignment.centerLeft,
                          padding: const EdgeInsets.only(left: 20),
                          child: const Icon(
                            Icons.bookmark,
                            color: Colors.white,
                            size: 36,
                          ),
                        ),
                        child: Card(
                          child: ListTile(
                            title: Text(item),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: DismissibleExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class DismissibleExample extends StatefulWidget {
  const DismissibleExample({super.key});

  @override
  State<DismissibleExample> createState() => _DismissibleExampleState();
}

class _DismissibleExampleState extends State<DismissibleExample> {
  List<String> fruits = [
    'Orange',
    'Mango',
    'Apple',
    'Watermelon',
    'Banana',
    'Tomato',
    'Lemon',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of Dismissible Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.background\n'
              '2.behavior\n'
              '3.child\n'
              '4.confirmDismiss\n'
              '5.crossAxisEndOffset\n'
              '6.direction\n'
              '7.dismissThresholds\n'
              '8.dragStartBehavior\n'
              '9.movementDuration\n'
              '10.onDismissed\n'
              '11.onResize\n'
              '12.onUpdate\n'
              '13.resizeDuration\n'
              '14.secondaryBackground',
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
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ListView.builder(
              itemCount: fruits.length,
              itemBuilder: (context, index) {
                final item = fruits[index];
                return Dismissible(
                  key: Key(item),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          duration: const Duration(seconds: 2),
                          backgroundColor: Colors.red,
                          content: Text(
                            '${fruits[index]} Deleted!',
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 2),
                        content: Text(
                          '${fruits[index]} Saved!',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        backgroundColor: Colors.green,
                      ));
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  secondaryBackground: Container(
                    color: Colors.green,
                    alignment: Alignment.centerLeft,
                    padding: const EdgeInsets.only(left: 20),
                    child: const Icon(
                      Icons.bookmark,
                      color: Colors.white,
                      size: 36,
                    ),
                  ),
                  child: Card(
                    child: ListTile(
                      title: Text(item),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
