import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ExpandedWidget extends StatefulWidget {
  const ExpandedWidget({super.key});

  @override
  State<ExpandedWidget> createState() => _ExpandedWidgetState();
}

class _ExpandedWidgetState extends State<ExpandedWidget> {

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
          'Expanded',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/expanded_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ExpandedExample extends StatefulWidget {
          const ExpandedExample({super.key});
        
          @override
          State<ExpandedExample> createState() => _ExpandedExampleState();
        }
        
        class _ExpandedExampleState extends State<ExpandedExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          //  Example 1 Code
          
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: const Text(
                      'Flex: 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Text(
                      'flex: 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    child: const Text(
                      'flex: 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
            );
          }
        }
        
        // Example 2 Code
        
        Center(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.blue,
                height: 100,
                width: 100,
                child: const Center(
                    child: Text(
                  'flex: 1',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                )),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                color: Colors.red,
                height: 100,
                width: 100,
                child: const Center(
                    child: Text(
                  'flex: 2',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                )),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                height: 100,
                width: 100,
                child: const Center(
                    child: Text(
                  'flex: 3',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 17),
                )),
              ),
            ),
          ],
        ),
            );''',
          child: ExpandedExample(),
        ),
      ),
    );
  }
}

class ExpandedExample extends StatefulWidget {
  const ExpandedExample({super.key});

  @override
  State<ExpandedExample> createState() => _ExpandedExampleState();
}

class _ExpandedExampleState extends State<ExpandedExample> {

  String url = 'https://www.youtube.com/watch?v=_rnZaagadyo';

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
              'Properties of Expanded Widget:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.flex: int(default is 1)\n'
              '2.Required Widget child\n',
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
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    color: Colors.blue,
                    height: 100,
                    child: const Text(
                      'Flex: 1',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    color: Colors.red,
                    height: 100,
                    child: const Text(
                      'flex: 2',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    color: Colors.green,
                    height: 100,
                    child: const Text(
                      'flex: 3',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            height: 50,
            thickness: 3,
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
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Image.asset('assets/expanded.png'),
          ),
        ],
      ),
    );
  }
}