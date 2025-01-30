import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class IgnorePointerWidget extends StatefulWidget {
  const IgnorePointerWidget({super.key});

  @override
  State<IgnorePointerWidget> createState() => _IgnorePointerWidgetState();
}

class _IgnorePointerWidgetState extends State<IgnorePointerWidget> {

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
          'Ignore Pointer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/ignore_pointer_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class IgnorePointerExample extends StatefulWidget {
          const IgnorePointerExample({super.key});
        
          @override
          State<IgnorePointerExample> createState() => _IgnorePointerExampleState();
        }
        
        class _IgnorePointerExampleState extends State<IgnorePointerExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                ),
                child: const Text('Normal Button'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: IgnorePointer(
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(24),
                  ),
                  child: const Text('Ignore pointer button'),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: IgnorePointerExample(),
        ),
      ),
    );
  }
}

class IgnorePointerExample extends StatefulWidget {
  const IgnorePointerExample({super.key});

  @override
  State<IgnorePointerExample> createState() => _IgnorePointerExampleState();
}

class _IgnorePointerExampleState extends State<IgnorePointerExample> {

  String url = 'https://youtu.be/qV9pqHWxYgI';

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
        children: <Widget>[
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
              'Properties of IgnorePointer Widget: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.ignoring\n'
              '2.child',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.all(24),
              ),
              child: const Text('Normal Button'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: IgnorePointer(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(24),
                ),
                child: const Text('Ignore pointer button'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
