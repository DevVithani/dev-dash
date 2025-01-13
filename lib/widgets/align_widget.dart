import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AlignWidget extends StatefulWidget {
  const AlignWidget({super.key});

  @override
  State<AlignWidget> createState() => _AlignWidgetState();
}

class _AlignWidgetState extends State<AlignWidget> {
  String url = 'https://www.youtube.com/watch?v=g2E7yl3MwMk';

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
  void dispose() {
    controller?.dispose();
    super.dispose();
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
          'Align',
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
              filePath: 'lib/widgets/align_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class AlignExample extends StatefulWidget {
             const AlignExample({super.key});
            
              @override
              State<AlignExample> createState() => _AlignExampleState();
            }
            
            class _AlignExampleState extends State<AlignExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              // Example 1 code
              
                 Center(
                    child: Container(
                      height: 150.0,
                      width: 300.0,
                      color: Colors.yellow,
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                ),
                // Example 2 Code
                
                Center(
                    child: Container(
                      height: 100.0,
                      width: 200.0,
                      color: Colors.yellow,
                      child: Align(
                        heightFactor: 2,
                        widthFactor: 2,
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  
                  // Example 3 Code
                  
                  Center(
                    child: Container(
                      height: 150.0,
                      width: 300.0,
                      color: Colors.yellow,
                      child: Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  // Example 4 Code
                  
                  Center(
                    child: Container(
                      height: 150.0,
                      width: 300.0,
                      color: Colors.yellow,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                        ),
                      ),
                    ),
                  ),
                  
                  // Example 5 Code
                  
                  Center(
                    child: Container(
                      height: 150.0,
                      width: 300.0,
                      color: Colors.yellow,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          color: Colors.red,
                          height: 50,
                          width: 50,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}''',
              child: AlignExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AlignExample extends StatefulWidget {
  const AlignExample({super.key});

  @override
  State<AlignExample> createState() => _AlignExampleState();
}

class _AlignExampleState extends State<AlignExample> {
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
              'Properties of Align Widget: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.heightFactor\n'
              '3.widthFactor\n'
              '4.Widget child',
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
              'Example 1: alignment topRight',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: Container(
                height: 150.0,
                width: 300.0,
                color: Colors.yellow,
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
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
              'Example 2: alignment bottomCenter',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: Container(
                height: 100.0,
                width: 200.0,
                color: Colors.yellow,
                child: Align(
                  heightFactor: 2,
                  widthFactor: 2,
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
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
              'Example 3: alignment center',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: Container(
                height: 150.0,
                width: 300.0,
                color: Colors.yellow,
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
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
              'Example 4: centerRight',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: Container(
                height: 150.0,
                width: 300.0,
                color: Colors.yellow,
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
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
              'Example 5: topCenter',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
            ),
            child: Center(
              child: Container(
                height: 150.0,
                width: 300.0,
                color: Colors.yellow,
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Container(
                    color: Colors.red,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
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
