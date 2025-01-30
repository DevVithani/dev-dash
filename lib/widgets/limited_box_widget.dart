import 'package:flutter/material.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LimitedBoxWidget extends StatefulWidget {
  const LimitedBoxWidget({super.key});

  @override
  State<LimitedBoxWidget> createState() => _LimitedBoxWidgetState();
}

class _LimitedBoxWidgetState extends State<LimitedBoxWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'LimitedBox',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/limited_box_widget',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
                  
          class LimitedBoxExample extends StatefulWidget {
          const LimitedBoxExample({super.key});
        
          @override
          State<LimitedBoxExample> createState() => _LimitedBoxExampleState();
        }
        
        class _LimitedBoxExampleState extends State<LimitedBoxExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 code
          
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: LimitedBox(
                    maxHeight: 50,
                    maxWidth: 300,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Person 1"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Example 2 code
            
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: LimitedBox(
                    maxHeight: 69,
                    maxWidth: 365,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Person 2"),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            
            // Example 3 Code
            
            const Padding(
              padding: EdgeInsets.only(top: 18),
              child: Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: LimitedBox(
                    maxHeight: 80,
                    maxWidth: 320,
                    child: Card(
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Person 3"),
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
          child: LimitedBoxExample(),
        ),
      ),
    );
  }
}

class LimitedBoxExample extends StatefulWidget {
  const LimitedBoxExample({super.key});

  @override
  State<LimitedBoxExample> createState() => _LimitedBoxExampleState();
}

class _LimitedBoxExampleState extends State<LimitedBoxExample> {

  String url = 'https://www.youtube.com/watch?v=uVki2CIzBTs';

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
              'Properties of LimitedBox Widget: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.maxHeight\n'
              '2.maxWidth\n'
              '3.child',
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
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: LimitedBox(
                  maxHeight: 50,
                  maxWidth: 300,
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Person 1"),
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
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: LimitedBox(
                  maxHeight: 69,
                  maxWidth: 365,
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Person 2"),
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
              'Example 3: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: LimitedBox(
                  maxHeight: 80,
                  maxWidth: 320,
                  child: Card(
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text("Person 3"),
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
        ],
      ),
    );
  }
}
