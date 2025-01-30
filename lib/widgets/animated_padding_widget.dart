import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedPaddingWidget extends StatefulWidget {
  const AnimatedPaddingWidget({super.key});

  @override
  State<AnimatedPaddingWidget> createState() => _AnimatedPaddingWidgetState();
}

class _AnimatedPaddingWidgetState extends State<AnimatedPaddingWidget> {

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
          'Animated Padding',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_padding_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AnimatedPaddingExample extends StatefulWidget {
          const AnimatedPaddingExample({super.key});
        
          @override
          State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
        }
        
        class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
          double _padding = 8;
        
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
                'Example: Tap on Container to change padding with animation.',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: AnimatedPadding(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.elasticInOut,
                  padding: EdgeInsets.all(_padding),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _padding = _padding == 8 ? 100 : 8;
                      });
                    },
                    child: Container(
                      height: 100,
                      color: Colors.blue,
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
          child: AnimatedPaddingExample(),
        ),
      ),
    );
  }
}

class AnimatedPaddingExample extends StatefulWidget {
  const AnimatedPaddingExample({super.key});

  @override
  State<AnimatedPaddingExample> createState() => _AnimatedPaddingExampleState();
}

class _AnimatedPaddingExampleState extends State<AnimatedPaddingExample> {
  double _padding = 8;
  double _paDDing = 12;

  String url = 'https://www.youtube.com/watch?v=PY2m0fhGNz4';

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
              'Properties of Animated Padding Widget:',
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
              '2.curve\n'
              '3.duration\n'
              '4.onEnd\n'
              '5.padding',
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
              'Example 1: Tap on Container to change padding with animation',
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
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                curve: Curves.elasticInOut,
                padding: EdgeInsets.all(_padding),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _padding = _padding == 8 ? 100 : 8;
                    });
                  },
                  child: Container(
                    height: 100,
                    color: Colors.blue,
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
              'Example 2: Tap on Container to change padding with animation',
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
              child: AnimatedPadding(
                duration: const Duration(milliseconds: 500),
                curve: Curves.bounceInOut,
                padding: EdgeInsets.all(_paDDing),
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      _paDDing = _paDDing == 12 ? 150 : 12;
                    });
                  },
                  child: Container(
                    height: 100,
                    color: Colors.black,
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
