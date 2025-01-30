import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class PositionWidget extends StatefulWidget {
  const PositionWidget({super.key});

  @override
  _PositionWidgetState createState() => _PositionWidgetState();
}

class _PositionWidgetState extends State<PositionWidget> {

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
          'Positioned',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/position_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
        import 'package:flutter/material.dart';
          
          class PositionExample extends StatefulWidget {
          const PositionExample({super.key});
        
          @override
          State<PositionExample> createState() => _PositionExampleState();
        }
        
        class _PositionExampleState extends State<PositionExample> {
          String url = 'https://www.youtube.com/watch?v=EgtPleVwxBQ';
        
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
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 1.5,
              child: Stack(
                children: [
                  Positioned(
                    left: 20,
                    top: 20,
                    child: Container(
                      color: Colors.red,
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        'Red',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 60,
                    top: 50, // Adjusted to prevent overlap
                    child: Container(
                      color: Colors.blue,
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        'Blue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    left: 169,
                    top: 150,
                    child: Container(
                      color: Colors.green,
                      height: 150,
                      width: 150,
                      alignment: Alignment.center,
                      child: const Text(
                        'Green',
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
          ],
        ),
            );
          }
        }''',
          child: PositionExample(),
        ),
      ),
    );
  }
}

class PositionExample extends StatefulWidget {
  const PositionExample({super.key});

  @override
  State<PositionExample> createState() => _PositionExampleState();
}

class _PositionExampleState extends State<PositionExample> {

  String url = 'https://www.youtube.com/watch?v=EgtPleVwxBQ';

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
      clipBehavior: Clip.none,
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
            padding: EdgeInsets.only(left: 15, top: 18),
            child: Text(
              'Properties of Positioned Widget:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 18),
            child: Text(
              '1.height\n'
              '2.width\n'
              '3.bottom\n'
              '4.top\n'
              '5.left\n'
              '6.right\n'
              '7.child',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: Widget',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: [
                Positioned(
                  left: 20,
                  top: 20,
                  child: Container(
                    color: Colors.red,
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text(
                      'Red',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 60,
                  top: 50, // Adjusted to prevent overlap
                  child: Container(
                    color: Colors.blue,
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text(
                      'Blue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  left: 169,
                  top: 150,
                  child: Container(
                    color: Colors.green,
                    height: 150,
                    width: 150,
                    alignment: Alignment.center,
                    child: const Text(
                      'Green',
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
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: Image',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Stack(
              children: [
                Positioned(
                  left: 40,
                  top: 10,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Gm7iDyKB4FY_HNqS1wxRUalz4ywmRTKqiQ&s'),
                ),
                Positioned(
                  left: 80,
                  top: 55,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s'),
                ),
                Positioned(
                  left: 169,
                  top: 150,
                  child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
