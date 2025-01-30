import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class RepaintBoundaryWidget extends StatefulWidget {
  const RepaintBoundaryWidget({super.key});

  @override
  State<RepaintBoundaryWidget> createState() => _RepaintBoundaryWidgetState();
}

class _RepaintBoundaryWidgetState extends State<RepaintBoundaryWidget> {

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
          'RePaint Boundary',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/repaint_boundary_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
            import 'package:flutter/material.dart';
          
          class RepaintBoundaryExample extends StatefulWidget {
          const RepaintBoundaryExample({super.key});
        
          @override
          State<RepaintBoundaryExample> createState() => _RepaintBoundaryExampleState();
        }
        
        class _RepaintBoundaryExampleState extends State<RepaintBoundaryExample> {
        
          @override
          Widget build(BuildContext context) {
          
          // Example 1 Code
          
            return RepaintBoundary(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.yellowAccent,
                  ),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    color: Colors.green,
                  ),
                  
                  // For using both Example wrap RepaintBoundary widget with column Widget
                  
                  // Example 2 Code
                  
                  RepaintBoundary(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    color: Colors.purple,
                  ),
                  Container(
                    height: 100,
                    color: Colors.blue,
                  ),
                  Container(
                    height: 100,
                    color: Colors.green,
                  ),
                  Container(
                    height: 100,
                    color: Colors.yellow,
                  ),
                  Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ],
              ),
            ),
                ],
              ),
            );
          }
        }''',
          child: RepaintBoundaryExample(),
        ),
      ),
    );
  }
}

class RepaintBoundaryExample extends StatefulWidget {
  const RepaintBoundaryExample({super.key});

  @override
  State<RepaintBoundaryExample> createState() => _RepaintBoundaryExampleState();
}

class _RepaintBoundaryExampleState extends State<RepaintBoundaryExample> {

  String url = 'https://youtu.be/cVAGLDuc2xE';

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
              'Property of RepaintBoundary Widget: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          RepaintBoundary(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.yellowAccent,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          RepaintBoundary(
            child: Column(
              children: [
                Container(
                  height: 100,
                  color: Colors.purple,
                ),
                Container(
                  height: 100,
                  color: Colors.blue,
                ),
                Container(
                  height: 100,
                  color: Colors.green,
                ),
                Container(
                  height: 100,
                  color: Colors.yellow,
                ),
                Container(
                  height: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
        ],
      ),
    );
  }
}
