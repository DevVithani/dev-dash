import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ClipRRectWidget extends StatefulWidget {
  const ClipRRectWidget({super.key});

  @override
  State<ClipRRectWidget> createState() => _ClipRRectWidgetState();
}

class _ClipRRectWidgetState extends State<ClipRRectWidget> {

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
          'ClipR Rect',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/clipr_rect_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ClipRRectExample extends StatefulWidget {
          const ClipRRectExample({super.key});
        
          @override
          State<ClipRRectExample> createState() => _ClipRRectExampleState();
        }
        
        class _ClipRRectExampleState extends State<ClipRRectExample> {
          
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Example 1 code
               
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Example 2 Code
            
             Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  height: 100,
                  width: 100,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: ClipRRectExample(),
        ),
      ),
    );
  }
}

class ClipRRectExample extends StatefulWidget {
  const ClipRRectExample({super.key});

  @override
  State<ClipRRectExample> createState() => _ClipRRectExampleState();
}

class _ClipRRectExampleState extends State<ClipRRectExample> {

  String url = 'https://www.youtube.com/watch?v=eI43jkQkrvs';

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
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Properties of ClipRRect:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              '1.borderRadius\n'
              '2.Widget child\n'
              '3.clipBehavior\n'
              '4.clipper\n',
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
              'Example 1: Image',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s',
                fit: BoxFit.cover,
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
              'Example 2: Widget',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
          ),
          Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                height: 100,
                width: 100,
                color: Colors.black,
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
