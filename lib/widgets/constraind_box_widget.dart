import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ConstrainedBoxWidget extends StatefulWidget {
  const ConstrainedBoxWidget({super.key});

  @override
  State<ConstrainedBoxWidget> createState() => _ConstrainedBoxWidgetState();
}

class _ConstrainedBoxWidgetState extends State<ConstrainedBoxWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Constrained Box',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/constrained_box_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ConstrainedBoxExample extends StatefulWidget {
          const ConstrainedBoxExample({super.key});
        
          @override
          State<ConstrainedBoxExample> createState() => _ConstrainedBoxExampleState();
        }
        
        class _ConstrainedBoxExampleState extends State<ConstrainedBoxExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 Code
          
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  maxHeight: 200,
                  maxWidth: 700,
                ),
                child: const Card(
                  color: Colors.white,
                  child: Center(
                    child: Text(
                      'Hello!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Example 2 Code
            
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(
                  minHeight: 175,
                  minWidth: 350,
                  maxHeight: 350,
                  maxWidth: 700,
                ),
                child: const Card(
                  color: Colors.blue,
                  child: Center(
                    child: Text(
                      'Hello!',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
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
          child: ConstrainedBoxExample(),
        ),
      ),
    );
  }
}

class ConstrainedBoxExample extends StatefulWidget {
  const ConstrainedBoxExample({super.key});

  @override
  State<ConstrainedBoxExample> createState() => _ConstrainedBoxExampleState();
}

class _ConstrainedBoxExampleState extends State<ConstrainedBoxExample> {

  String url = 'https://www.youtube.com/watch?v=o2KveVr7adg';

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
              'Properties of ConstrainedBox Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.constraints',
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
              'Example 1: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxHeight: 200,
                maxWidth: 700,
              ),
              child: const Card(
                color: Colors.black,
                child: Center(
                  child: Text(
                    'Hello!',
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
              'Example 2: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
          ),
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                minHeight: 175,
                minWidth: 350,
                maxHeight: 350,
                maxWidth: 700,
              ),
              child: const Card(
                color: Colors.blue,
                child: Center(
                  child: Text(
                    'Hello!',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
