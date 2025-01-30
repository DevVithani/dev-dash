import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FittedBoxWidget extends StatefulWidget {
  const FittedBoxWidget({super.key});

  @override
  State<FittedBoxWidget> createState() => _FittedBoxWidgetState();
}

class _FittedBoxWidgetState extends State<FittedBoxWidget> {

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
          "Fitted Box",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/fitted_box_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FittedBoxExample extends StatefulWidget {
          const FittedBoxExample({super.key});
        
          @override
          State<FittedBoxExample> createState() => _FittedBoxExampleState();
        }
        
        class _FittedBoxExampleState extends State<FittedBoxExample> {
        
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
                width: 300,
                color: Colors.black,
                child: const FittedBox(
                  child: Text(
                    'Fitted Box',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            // Example 2 code
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Container(
                  width: 100,
                  color: Colors.black,
                  child: const FittedBox(
                    child: Text(
                      'Fitted Box',
                      style: TextStyle(color: Colors.white),
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
          child: FittedBoxExample(),
        ),
      ),
    );
  }
}

class FittedBoxExample extends StatefulWidget {
  const FittedBoxExample({super.key});

  @override
  State<FittedBoxExample> createState() => _FittedBoxExampleState();
}

class _FittedBoxExampleState extends State<FittedBoxExample> {

  String url = 'https://www.youtube.com/watch?v=T4Uehk3_wlY';

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
              'Properties of FittedBox:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.Widget child\n'
              '3.clipBehavior\n'
              '4.fit\n',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 18,
              left: 15,
            ),
            child: Text(
              'Example 1: width 300',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 18,
            ),
          ),
          Center(
            child: Container(
              width: 300,
              color: Colors.black,
              child: const FittedBox(
                child: Text(
                  'Fitted Box',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(
              top: 18,
              left: 15,
            ),
            child: Text(
              'Example 2: width 100',
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
                width: 100,
                color: Colors.black,
                child: const FittedBox(
                  child: Text(
                    'Fitted Box',
                    style: TextStyle(color: Colors.white),
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
