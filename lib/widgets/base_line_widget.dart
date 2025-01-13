import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class BaseLineWidget extends StatefulWidget {
  const BaseLineWidget({super.key});

  @override
  State<BaseLineWidget> createState() => _BaseLineWidgetState();
}

class _BaseLineWidgetState extends State<BaseLineWidget> {
  String url = 'https://youtu.be/8ZaFk0yvNlI';

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
          'BaseLine',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
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
              filePath: 'lib/widgets/base_line_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class BaseLineExample extends StatefulWidget {
              const BaseLineExample({super.key});
            
              @override
              State<BaseLineExample> createState() => _BaseLineExampleState();
            }
            
            class _BaseLineExampleState extends State<BaseLineExample> {
              @override
              Widget build(BuildContext context) {
                return const Column(
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Icon(
                        Icons.timer,
                        color: Colors.green,
                        size: 20,
                      ),
                      Text(
                        '12:0',
                        style: TextStyle(
                          fontSize: 28,
                          fontFamily: 'Quicksand',
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(width: 5),
                  Padding(
                    padding: EdgeInsets.only(bottom: 4),
                    child: Text(
                      'mm:ss',
                      style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Roboto',
                        color: Colors.white70,
                      ),
                    ),
                  ),
                  
                  // Example 2 Code
                  
                  const Divider(
                  thickness: 2,
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    'Example 2: ',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Baseline(
                          baseline: 1.0,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            'Baseline Text 1',
                            style: TextStyle(fontSize: 18.0),
                          ),
                        ),
                        SizedBox(width: 20.0),
                        Baseline(
                          baseline: 30.0,
                          baselineType: TextBaseline.alphabetic,
                          child: Text(
                            'Baseline Text 2',
                            style: TextStyle(fontSize: 24.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
               ],
              ),
            ],
                );
              }
            }''',
              child: BaseLineExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class BaseLineExample extends StatefulWidget {
  const BaseLineExample({super.key});

  @override
  State<BaseLineExample> createState() => _BaseLineExampleState();
}

class _BaseLineExampleState extends State<BaseLineExample> {
  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of Baseline Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.baseline\n'
              '2.baselineType\n'
              '3.child',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Icon(
                    Icons.timer,
                    color: Colors.green,
                    size: 20,
                  ),
                  Text(
                    '12:0',
                    style: TextStyle(
                      fontSize: 28,
                      fontFamily: 'Quicksand',
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(width: 5),
              Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  'mm:ss',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Roboto',
                    color: Colors.white70,
                  ),
                ),
              ),
            ],
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Baseline(
                    baseline: 1.0,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Baseline Text 1',
                      style: TextStyle(fontSize: 18.0),
                    ),
                  ),
                  SizedBox(width: 20.0),
                  Baseline(
                    baseline: 30.0,
                    baselineType: TextBaseline.alphabetic,
                    child: Text(
                      'Baseline Text 2',
                      style: TextStyle(fontSize: 24.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
