import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FlexibleWidget extends StatefulWidget {
  const FlexibleWidget({super.key});

  @override
  State<FlexibleWidget> createState() => _FlexibleWidgetState();
}

class _FlexibleWidgetState extends State<FlexibleWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'Flexible',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/flexible_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FlexibleExample extends StatefulWidget {
          const FlexibleExample({super.key});
        
          @override
          State<FlexibleExample> createState() => _FlexibleExampleState();
        }
        
        class _FlexibleExampleState extends State<FlexibleExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                'Example:',
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
            ),
            Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                  ),
                ),
                Flexible(
                  flex: 3,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                  ),
                ),
              ],
            ),
            // Example 2 Code:
           Column(
            children: [
            Flexible(
              Container(
                color: Colors.red,
                height: 100,
                child: Center(child: Text('Flex 1', style: TextStyle(color: Colors.white))),
              ),
             ),
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.blue,
                  child: Center(child: Text('Flexible 2', style: TextStyle(color: Colors.white))),
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.green,
                  child: Center(child: Text('Flex 3', style: TextStyle(color: Colors.white))),
                ),
              ),
            ],
          ),
        ),
          ],
        ),
            );
          }
        }''',
          child: FlexibleExample(),
        ),
      ),
    );
  }
}

class FlexibleExample extends StatefulWidget {
  const FlexibleExample({super.key});

  @override
  State<FlexibleExample> createState() => _FlexibleExampleState();
}

class _FlexibleExampleState extends State<FlexibleExample> {

  String url = 'https://www.youtube.com/watch?v=CI7x0mAZiY0';

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
              'Properties of Flexible Widget:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.flex,\n'
              '2.fit,\n'
              '3.Widget child,',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Example 1: Flexible in Row',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15),
          ),
          Row(
            children: [
              Flexible(
                flex: 2,
                child: Container(
                  color: Colors.red,
                  height: 100,
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(
                  color: Colors.blue,
                  height: 100,
                ),
              ),
              Flexible(
                flex: 1,
                child: Container(
                  color: Colors.green,
                  height: 100,
                ),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Example 2: Flexible in Column',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Image.asset('assets/flexible.png'),
          ),
        ],
      ),
    );
  }
}
