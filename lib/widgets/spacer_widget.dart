import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SpacerWidget extends StatefulWidget {
  const SpacerWidget({super.key});

  @override
  State<SpacerWidget> createState() => _SpacerWidgetState();
}

class _SpacerWidgetState extends State<SpacerWidget> {

  String url = 'https://www.youtube.com/watch?v=7FJgd7QN1zI';

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
          'Spacer',
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
              filePath: 'lib/widgets/spacer_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class SpacerExample extends StatefulWidget {
              const SpacerExample({super.key});
            
              @override
              State<SpacerExample> createState() => _SpacerExampleState();
            }
            
            class _SpacerExampleState extends State<SpacerExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18, left: 15),
                  child: Row(
                    children: [
                      Container(color: Colors.red, height: 100, width: 100),
                      const Spacer(),
                      Container(color: Colors.yellow, height: 100, width: 100),
                      const Spacer(
                        flex: 2,
                      ),
                      Container(color: Colors.blue, height: 100, width: 100),
                    ],
                  ),
                ),
                // Example 2 Code
                
                Column(
            children: [
              Container(color: Colors.red, height: 100, width: 100),
              const Spacer(flex: 2,),
              Container(color: Colors.yellow, height: 100, width: 100),
              const Spacer(
                flex: 3,
              ),
              Container(color: Colors.blue, height: 100, width: 100),
            ],
                );
              ],
            ),
                );
              }
            }''',
              child: SpacerExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class SpacerExample extends StatefulWidget {
  const SpacerExample({super.key});

  @override
  State<SpacerExample> createState() => _SpacerExampleState();
}

class _SpacerExampleState extends State<SpacerExample> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of Spacer Widget:\n',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.flex',
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
              'Example 1: ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18, left: 15, bottom: 18),
            child: Row(
              children: [
                Container(color: Colors.red, height: 100, width: 100),
                const Spacer(),
                Container(color: Colors.yellow, height: 100, width: 100),
                const Spacer(
                  flex: 2,
                ),
                Container(color: Colors.blue, height: 100, width: 100),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 75,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Image.asset('assets/spacer.png'),
          ),
          const Divider(
            thickness: 2,
            height: 75,
          ),
        ],
      ),
    );
  }
}
