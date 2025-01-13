import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class DividerWidget extends StatefulWidget {
  const DividerWidget({super.key});

  @override
  State<DividerWidget> createState() => _DividerWidgetState();
}

class _DividerWidgetState extends State<DividerWidget> {

  String url = 'https://www.youtube.com/watch?v=_liUC641Nmk';

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
          'Divider',
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
              filePath: 'lib/widgets/devider_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
             class DividerExample extends StatefulWidget {
              const DividerExample({super.key});
            
              @override
              State<DividerExample> createState() => _DividerExampleState();
            }
            
            class _DividerExampleState extends State<DividerExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                //  Example 1 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Divider(
                    color: Colors.black,
                  ),
                ),
                
                // Example 2 Code
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Divider(
                    endIndent: 20,
                  ),
                ),
                
                // Example 3 Code
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Divider(
                    height: 10,
                  ),
                ),
                
                //  Example 4 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                child: Divider(
                    indent: 20,
                  ),
                ),
                
                // Example 5 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Divider(
                    thickness: 3,
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: DividerExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class DividerExample extends StatefulWidget {
  const DividerExample({super.key});

  @override
  State<DividerExample> createState() => _DividerExampleState();
}

class _DividerExampleState extends State<DividerExample> {

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
              'Properties of Divider Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.color\n'
              '2.endIndent\n'
              '3.height\n'
              '4.indent\n'
              '5.thickness',
              style: TextStyle(
                fontSize: 18,
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
              'Example 1: color.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: endIndent.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Divider(
              endIndent: 20,
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: height.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Divider(
              height: 10,
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: indent.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Divider(
              indent: 20,
            ),
          ),
          Divider(
            thickness: 2,
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: thickness.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Divider(
              thickness: 3,
            ),
          ),
        ],
      ),
    );
  }
}
