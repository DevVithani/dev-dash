import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ScrollbarWidget extends StatefulWidget {
  const ScrollbarWidget({super.key});

  @override
  State<ScrollbarWidget> createState() => _ScrollbarWidgetState();
}

class _ScrollbarWidgetState extends State<ScrollbarWidget> {

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
          'ScrollBar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/scrollbar_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ScrollBarExample extends StatefulWidget {
          const ScrollBarExample({super.key});
        
          @override
          State<ScrollBarExample> createState() => _ScrollBarExampleState();
        }
        
        class _ScrollBarExampleState extends State<ScrollBarExample> {
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Scrollbar(
                trackVisibility: true,
                thumbVisibility: true,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemCount: 50,
                  primary: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Center(
                      child: Text('item index'),   // put dollar symbol before index
                    );
                  },
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: ScrollBarExample(),
        ),
      ),
    );
  }
}

class ScrollBarExample extends StatefulWidget {
  const ScrollBarExample({super.key});

  @override
  State<ScrollBarExample> createState() => _ScrollBarExampleState();
}

class _ScrollBarExampleState extends State<ScrollBarExample> {

  String url = 'https://youtu.be/DbkIQSvwnZc';

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
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of ScrollBar Widget: ',
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
              '2.controller\n'
              '3.interactive\n'
              '4.notificationPredicate\n'
              '4.radius\n'
              '5.scrollbarOrientation\n'
              '6.thickness\n'
              '7.thumbVisibility\n'
              '8.trackVisibility',
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
              'Example 1: Vertical Scrollbar',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height / 2.2,
            child: Scrollbar(
              trackVisibility: true,
              thumbVisibility: true,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: 50,
                primary: true,
                itemBuilder: (BuildContext context, int index) {
                  return Center(
                    child: Text('item $index'),
                  );
                },
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
              'Example 2: Horizontal Scrollbar',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Scrollbar(
                thumbVisibility: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      20,
                      (index) => Container(
                        width: 100,
                        height: 100,
                        color: Colors.blueAccent,
                        margin: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Center(
                          child: Text(
                            '${index + 1}',
                            style: const TextStyle(
                                color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 30,
          ),
        ],
      ),
    );
  }
}
