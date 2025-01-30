import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget> {


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
          'Animated Builder',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_builder_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          import 'dart:math' as math;
        
          class AnimatedBuilderExample extends StatefulWidget {
          const AnimatedBuilderExample({super.key});
        
          @override
          State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
        }
        
        class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
            with TickerProviderStateMixin {
          late final AnimationController _controller = AnimationController(
            duration: const Duration(seconds: 10),
            vsync: this,
          )..repeat();
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15, top: 18),
              child: Center(
                child: AnimatedBuilder(
                  animation: _controller,
                  child: Container(
                    width: 200.0,
                    height: 200.0,
                    color: Colors.green,
                    child: const Center(
                      child: Text(
                        'Green',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  builder: (BuildContext context, Widget? child) {
                    return Transform.rotate(
                      angle: _controller.value * 2.0 * math.pi,
                      child: child,
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
          child: AnimatedBuilderExample(),
        ),
      ),
    );
  }
}

class AnimatedBuilderExample extends StatefulWidget {
  const AnimatedBuilderExample({super.key});

  @override
  State<AnimatedBuilderExample> createState() => _AnimatedBuilderExampleState();
}

class _AnimatedBuilderExampleState extends State<AnimatedBuilderExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();
  late final AnimationController controllerTwo = AnimationController(
    duration: const Duration(seconds: 10),
    vsync: this,
  )..repeat();

  @override
  void dispose() {
    controller?.dispose();
    _controller.dispose();
    super.dispose();
  }

  String url = 'https://www.youtube.com/watch?v=N-RiyZlv8v8';

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
              'Properties of Animated Builder: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.animation,\n'
              '2.builder,\n'
              '3.listenable,\n'
              '4.Widget child\n',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, top: 18),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, top: 18),
            child: Center(
              child: AnimatedBuilder(
                animation: _controller,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'Rotate',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.rotate(
                    angle: _controller.value * 2.0 * math.pi,
                    child: child,
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
            padding: EdgeInsets.only(left: 15, top: 18),
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
            padding: const EdgeInsets.only(left: 15, top: 18),
            child: Center(
              child: AnimatedBuilder(
                animation: controllerTwo,
                child: Container(
                  width: 200.0,
                  height: 200.0,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Flip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                builder: (BuildContext context, Widget? child) {
                  return Transform.flip(
                    flipX: true,
                    flipY: true,
                    child: child,
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
