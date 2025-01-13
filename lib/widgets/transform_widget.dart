import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TransFormWidget extends StatefulWidget {
  const TransFormWidget({super.key});

  @override
  State<TransFormWidget> createState() => _TransFormWidgetState();
}

class _TransFormWidgetState extends State<TransFormWidget> {

  String url = 'https://www.youtube.com/watch?v=9z_YNlRlWfA';

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
          'Transform',
          style: TextStyle(color: Colors.white),
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
              filePath: 'lib/widgets/transform_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
            import 'package:flutter/material.dart';
              
              class TransformExample extends StatefulWidget {
              const TransformExample({super.key});
            
              @override
              State<TransformExample> createState() => _TransformExampleState();
            }
            
            class _TransformExampleState extends State<TransformExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 Code
                
                Center(
                  child: Transform.rotate(
                    angle: 23,
                    child: Container(
                      width: 100,
                      height: 100,
                      color: Colors.blue,
                      child: const Center(
                        child: Text(
                          'Rotation',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                Center(
                  child: Transform.translate(
                    offset: const Offset(50.0, 0.0),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.red,
                      child: const Center(
                        child: Text(
                          'Translation',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 3 Code
                
                Center(
                  child: Transform.scale(
                    scale: 1.5,
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.green,
                      child: const Center(
                        child: Text(
                          'Scaling',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 4 Code
                
                Center(
                  child: Transform(
                    transform: Matrix4.skew(0.3, 0.6),
                    child: Container(
                      height: 100,
                      width: 100,
                      color: Colors.orange,
                      child: const Center(
                        child: Text(
                          'Skewing',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: TransformExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class TransformExample extends StatefulWidget {
  const TransformExample({super.key});

  @override
  State<TransformExample> createState() => _TransformExampleState();
}

class _TransformExampleState extends State<TransformExample> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              'Properties of Transform Widget:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 10, left: 15),
            child: Text(
              '1.alignment,\n'
              '2.transform,\n'
              '3.filterQuality,\n'
              '4.origin,\n'
              '5.transformHitTests,\n'
              '6.Widget child',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: Transform.rotate',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Center(
            child: Transform.rotate(
              angle: 23,
              child: Container(
                width: 100,
                height: 100,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Rotation',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
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
              'Example 2: Transform.translate',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          Center(
            child: Transform.translate(
              offset: const Offset(50.0, 0.0),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.red,
                child: const Center(
                  child: Text(
                    'Translation',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
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
              'Example 3: Transform.scale',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 50),
          ),
          Center(
            child: Transform.scale(
              scale: 1.5,
              child: Container(
                height: 100,
                width: 100,
                color: Colors.green,
                child: const Center(
                  child: Text(
                    'Scaling',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 4: Transform.skew',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
          ),
          Center(
            child: Transform(
              transform: Matrix4.skew(0.3, 0.6),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.orange,
                child: const Center(
                  child: Text(
                    'Skewing',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 200,
          ),
        ],
      ),
    );
  }
}