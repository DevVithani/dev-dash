import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AspectRatioWidget extends StatefulWidget {
  const AspectRatioWidget({super.key});

  @override
  State<AspectRatioWidget> createState() => _AspectRatioWidgetState();
}

class _AspectRatioWidgetState extends State<AspectRatioWidget> {


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
          'Aspect Ratio',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/aspect_ratio_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AspectRatioExample extends StatefulWidget {
          const AspectRatioExample({super.key});
        
          @override
          State<AspectRatioExample> createState() => _AspectRatioExampleState();
        }
        
        class _AspectRatioExampleState extends State<AspectRatioExample> {
        
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
                'Example 1: Using both Properties.',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Container(
                color: Colors.green,
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Container(
                    color: Colors.blue,
                  ),
                ),
              ),
            ),
            // aspectRatio in double Value
        
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Container(
                color: Colors.blue,
                alignment: Alignment.center,
                width: double.infinity,
                height: 200,
                child: AspectRatio(
                  aspectRatio: 6.2,
                  child: Container(
                    color: Colors.red,
            ),
          ),
        ),
      ),
              ],
            ),
          );
        }
      }''',
          child: AspectRatioExample(),
        ),
      ),
    );
  }
}

class AspectRatioExample extends StatefulWidget {
  const AspectRatioExample({super.key});

  @override
  State<AspectRatioExample> createState() => _AspectRatioExampleState();
}

class _AspectRatioExampleState extends State<AspectRatioExample> {

  String url = 'https://www.youtube.com/watch?v=XcnP3_mO_Ms';

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
              'Properties of Aspect Ratio Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.aspectRatio\n'
              '2.child',
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
              'Example 1: aspect ratio: 16 / 9',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Container(
              color: Colors.green,
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                  color: Colors.blue,
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
              'Example 2: aspectRatio in double value',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Container(
              color: Colors.blue,
              alignment: Alignment.center,
              width: double.infinity,
              height: 200,
              child: AspectRatio(
                aspectRatio: 6.2,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 150,
          ),
        ],
      ),
    );
  }
}