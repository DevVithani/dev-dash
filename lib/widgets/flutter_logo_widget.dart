import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FlutterLogoWidget extends StatefulWidget {
  const FlutterLogoWidget({super.key});

  @override
  State<FlutterLogoWidget> createState() => _FlutterLogoWidgetState();
}

class _FlutterLogoWidgetState extends State<FlutterLogoWidget> {
  String url =
      'https://www.youtube.com/watch?v=aAmP-WcI6dg&pp=ygUOI2ZsdXRlcndpZGdldHM%3D';

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
          'Flutter Logo',
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
              filePath: 'lib/widgets/flutter_logo_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class FlutterLogoExample extends StatefulWidget {
              const FlutterLogoExample({super.key});
            
              @override
              State<FlutterLogoExample> createState() => _FlutterLogoExampleState();
            }
            
            class _FlutterLogoExampleState extends State<FlutterLogoExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 Code
              
              const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: FlutterLogo(
                      curve: Curves.elasticInOut,
                      size: 100,
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: FlutterLogo(
                      curve: Curves.elasticInOut,
                      style: FlutterLogoStyle.stacked,
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: FlutterLogoExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class FlutterLogoExample extends StatefulWidget {
  const FlutterLogoExample({super.key});

  @override
  State<FlutterLogoExample> createState() => _FlutterLogoExampleState();
}

class _FlutterLogoExampleState extends State<FlutterLogoExample> {
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
              'Properties of FlutterLogo Widget:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.curve\n'
              '2.duration\n'
              '3.size\n'
              '4.style\n'
              '5.textColor',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: size',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: FlutterLogo(
                curve: Curves.elasticInOut,
                size: 100,
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: style',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: FlutterLogo(
                curve: Curves.elasticInOut,
                style: FlutterLogoStyle.stacked,
              ),
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
        ],
      ),
    );
  }
}
