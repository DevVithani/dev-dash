import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class PlaceholderWidget extends StatefulWidget {
  const PlaceholderWidget({super.key});

  @override
  State<PlaceholderWidget> createState() => _PlaceholderWidgetState();
}

class _PlaceholderWidgetState extends State<PlaceholderWidget> {
  String url = 'https://www.youtube.com/watch?v=LPe56fezmoo';

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
        title: const Text(
          'Placeholder',
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
              filePath: 'lib/widgets/placeholder_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class PlaceHolderExample extends StatefulWidget {
              const PlaceHolderExample({super.key});
            
              @override
              State<PlaceHolderExample> createState() => _PlaceHolderExampleState();
            }
            
            class _PlaceHolderExampleState extends State<PlaceHolderExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Placeholder(
                      strokeWidth: 1.0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Coming Soon!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                // Example 2 Code 
                
                Center(
                    child: Placeholder(
                      color: Colors.black,
                      strokeWidth: 3.0,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Coming Soon!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  
                  // Example 3 code
                  
                  Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Placeholder(
                      fallbackWidth: 56,
                      fallbackHeight: 100,
                      color: Colors.black,
                      child: Container(
                        padding: const EdgeInsets.all(20),
                        child: const Text(
                          'Coming Soon!',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
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
              child: PlaceHolderExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class PlaceHolderExample extends StatefulWidget {
  const PlaceHolderExample({super.key});

  @override
  State<PlaceHolderExample> createState() => _PlaceHolderExampleState();
}

class _PlaceHolderExampleState extends State<PlaceHolderExample> {
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
              'Properties of PlaceHolder Widget:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.color\n'
              '2.fallbackHeight\n'
              '3.fallbackWidth\n'
              '4.strokeWidth',
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
              'Example 1:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Placeholder(
                strokeWidth: 1.0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coming Soon!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
              'Example 2:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Placeholder(
                color: Colors.black,
                strokeWidth: 3.0,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coming Soon!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
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
              'Example 3:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: Placeholder(
                fallbackWidth: 56,
                fallbackHeight: 100,
                color: Colors.black,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  child: const Text(
                    'Coming Soon!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 150,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
