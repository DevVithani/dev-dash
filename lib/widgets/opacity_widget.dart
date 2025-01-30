import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class OpacityWidget extends StatefulWidget {
  const OpacityWidget({super.key});

  @override
  State<OpacityWidget> createState() => _OpacityWidgetState();
}

class _OpacityWidgetState extends State<OpacityWidget> {

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
          "Opacity",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/opacity_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class OpaqueExample extends StatefulWidget {
          const OpaqueExample({super.key});
        
          @override
          State<OpaqueExample> createState() => _OpaqueExampleState();
        }
        
        class _OpaqueExampleState extends State<OpaqueExample> {
          String url = 'https://www.youtube.com/watch?v=9hltevOHQBw';
        
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
          
          // Example 1 code
          
            Opacity(
              opacity: 1,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text("Container 1"),
              ),
            ),
            
            // Example 2 code
            
            Opacity(
              opacity: 0.5,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text("Container 2"),
              ),
            ),
            
            // Example 3 code
            
            Opacity(
              opacity: 0.1,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text("Container 3"),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: OpaqueExample(),
        ),
      ),
    );
  }
}

class OpaqueExample extends StatefulWidget {
  const OpaqueExample({super.key});

  @override
  State<OpaqueExample> createState() => _OpaqueExampleState();
}

class _OpaqueExampleState extends State<OpaqueExample> {

  String url = 'https://www.youtube.com/watch?v=9hltevOHQBw';

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
              'Properties of Opacity Widget:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of Opacity Widget: \n'
              '1.opacity\n'
              '2.alwaysIncludeSemantics\n'
              '3.child\n',
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
              'Example 1: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Opacity(
              opacity: 1,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.blue,
                alignment: Alignment.center,
                child: const Text("Container 1"),
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
              'Example 2: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Opacity(
              opacity: 0.5,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.green,
                alignment: Alignment.center,
                child: const Text("Container 2"),
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
              'Example 3: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Opacity(
              opacity: 0.1,
              child: Container(
                width: double.infinity,
                height: 100,
                color: Colors.red,
                alignment: Alignment.center,
                child: const Text("Container 3"),
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
