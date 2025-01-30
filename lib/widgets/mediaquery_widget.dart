import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class MediaQueryWidget extends StatefulWidget {
  const MediaQueryWidget({super.key});

  @override
  State<MediaQueryWidget> createState() => _MediaQueryWidgetState();
}

class _MediaQueryWidgetState extends State<MediaQueryWidget> {

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
          "MediaQuery",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/mediaquery_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class MediaQueryExample extends StatefulWidget {
          const MediaQueryExample({super.key});
        
          @override
          State<MediaQueryExample> createState() => _MediaQueryExampleState();
        }
        
        class _MediaQueryExampleState extends State<MediaQueryExample> {
        
          @override
          Widget build(BuildContext context) {
            final screenWidth = MediaQuery.of(context).size.width;
        
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: Container(
                  width: screenWidth > 600 ? 400 : 200,
                  height: 200,
                  color: Colors.black,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: MediaQueryExample(),
        ),
      ),
    );
  }
}

class MediaQueryExample extends StatefulWidget {
  const MediaQueryExample({super.key});

  @override
  State<MediaQueryExample> createState() => _MediaQueryExampleState();
}

class _MediaQueryExampleState extends State<MediaQueryExample> {

  String url = 'https://youtu.be/A3WrA4zAaPw';

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
    final screenWidth = MediaQuery.of(context).size.width;

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
              'Properties of MediaQuery Widget: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.data',
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
              'Example: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: Container(
                width: screenWidth > 600 ? 400 : 200,
                height: 200,
                color: Colors.black,
                alignment: Alignment.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}