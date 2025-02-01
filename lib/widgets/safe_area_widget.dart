import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SafeAreaWidget extends StatefulWidget {
  const SafeAreaWidget({super.key});

  @override
  State<SafeAreaWidget> createState() => _SafeAreaWidgetState();
}

class _SafeAreaWidgetState extends State<SafeAreaWidget> {



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                color: Colors.red,
                width: double.infinity,
                height: 100,
                child: const SafeArea(
                  child: Center(
                    child: Text(
                      'SafeArea Widget',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: WidgetWithCodeView(
                filePath: 'lib/widgets/safe_area_widget.dart',
                iconForegroundColor: Colors.white,
                iconBackgroundColor: Colors.black,
                codeLinkPrefix: 'https://google.com?q=',
                codeContent: '''
                import 'package:flutter/material.dart';
                
               class SafeAreaExample extends StatefulWidget {
                const SafeAreaExample({super.key});

  @override
  State<SafeAreaExample> createState() => _SafeAreaExampleState();
 }

class _SafeAreaExampleState extends State<SafeAreaExample> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              width: double.infinity,
              height: 100,
              child: const SafeArea(
                child: Center(
                  child: Text(
                    'SafeArea Widget',
                  style: TextStyle(
                 fontSize: 18,
               color: Colors.white,
            fontWeight: FontWeight.bold),
          ),
        ),
      ),
    ),
  }
}''',
                child: SafeAreaExample(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SafeAreaExample extends StatefulWidget {
  const SafeAreaExample({super.key});

  @override
  State<SafeAreaExample> createState() => _SafeAreaExampleState();
}

class _SafeAreaExampleState extends State<SafeAreaExample> {

  String url = 'https://youtu.be/lkF0TQJO0bA';

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
              'Properties of SafeArea Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.bottom\n'
              '2.child\n'
              '3.left\n'
              '4.maintainBottomViewPadding\n'
              '5.minimum\n'
              '6.right\n'
              '7.top',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: Top of the Screen',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
