import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TweenAnimationBuilderWidget extends StatefulWidget {
  const TweenAnimationBuilderWidget({super.key});

  @override
  State<TweenAnimationBuilderWidget> createState() =>
      _TweenAnimationBuilderWidgetState();
}

class _TweenAnimationBuilderWidgetState
    extends State<TweenAnimationBuilderWidget> {

  String url = 'https://www.youtube.com/watch?v=l9uHB8VXZOg';

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
          'TweenAnimation Builder',
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
              filePath: 'lib/widget/tween_animation_builder_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class TweenAnimationExample extends StatefulWidget {
              const TweenAnimationExample({super.key});
            
              @override
              State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
            }
            
            class _TweenAnimationExampleState extends State<TweenAnimationExample> {
              double _targetValue = 100.0;
                double _value = 50.0;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 code
              
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: _targetValue),
                      duration: const Duration(seconds: 1),
                      builder: (BuildContext context, double size, Widget? child) {
                        return IconButton(
                          iconSize: size,
                          color: Colors.blue,
                          icon: const Icon(Icons.flutter_dash_rounded),
                          onPressed: () {
                            setState(() {
                              _targetValue = _targetValue == 100 ? 250 : 100;
                            });
                          },
                        );
                      },
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: _value),
                      duration: const Duration(seconds: 1),
                      builder: (BuildContext context, double size, Widget? child) {
                        return IconButton(
                          iconSize: size,
                          color: Colors.blue,
                          icon: const Icon(Icons.flutter_dash_rounded),
                          onPressed: () {
                            setState(() {
                              _value = _value == 20 ? 150 : 20;
                            });
                          },
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
              child: TweenAnimationExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class TweenAnimationExample extends StatefulWidget {
  const TweenAnimationExample({super.key});

  @override
  State<TweenAnimationExample> createState() => _TweenAnimationExampleState();
}

class _TweenAnimationExampleState extends State<TweenAnimationExample> {
  double _targetValue = 100.0;
  double _value = 50.0;

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
              'Properties of TweenAnimationBuilder widget:\n',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.builder\n'
              '2.child\n'
              '3.curve\n'
              '4.duration\n'
              '5.onEnd\n'
              '6.tween',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
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
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: _targetValue),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double size, Widget? child) {
                  return IconButton(
                    iconSize: size,
                    color: Colors.blue,
                    icon: const Icon(Icons.flutter_dash_rounded),
                    onPressed: () {
                      setState(() {
                        _targetValue = _targetValue == 100 ? 250 : 100;
                      });
                    },
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
            child: Center(
              child: TweenAnimationBuilder(
                tween: Tween<double>(begin: 0, end: _value),
                duration: const Duration(seconds: 1),
                builder: (BuildContext context, double size, Widget? child) {
                  return IconButton(
                    iconSize: size,
                    color: Colors.blue,
                    icon: const Icon(Icons.add_chart),
                    onPressed: () {
                      setState(() {
                        _value = _value == 20 ? 150 : 20;
                      });
                    },
                  );
                },
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
