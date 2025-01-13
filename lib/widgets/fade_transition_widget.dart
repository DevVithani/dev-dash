import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FadeTransitionWidget extends StatefulWidget {
  const FadeTransitionWidget({super.key});
  @override
  State<FadeTransitionWidget> createState() => _FadeTransitionWidgetState();
}

class _FadeTransitionWidgetState extends State<FadeTransitionWidget> {

  String url = 'https://www.youtube.com/watch?v=rLwWVbv3xDQ';

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
  void dispose() {
    controller?.dispose();
    super.dispose();
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
          'Fade Transition',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: controller!,
              progressColors: const ProgressBarColors(
                backgroundColor: Colors.black,
                handleColor: Colors.white,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: const WidgetWithCodeView(
              filePath: 'lib/widgets/fade_transition_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class FadeTransitionExample extends StatefulWidget {
              const FadeTransitionExample({super.key});
            
              @override
              State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
            }
            
            class _FadeTransitionExampleState extends State<FadeTransitionExample>
                with TickerProviderStateMixin {
              late final AnimationController _controller =
            AnimationController(vsync: this, duration: const Duration(seconds: 2))
              ..repeat(reverse: true);
              late final Animation<double> _animation =
            CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 Code
              
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 30),
                  child: Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: const FlutterLogo(size: 150),
                    ),
                  ),
                ),
              
                // Example 2 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18.0, right: 30),
                  child: Center(
                    child: FadeTransition(
                      opacity: _animation,
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSlzgF_naJxuH1GVmKSsvK2N4RojeyefhHw&s'),
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: FadeTransitionExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeTransitionExample extends StatefulWidget {
  const FadeTransitionExample({super.key});

  @override
  State<FadeTransitionExample> createState() => _FadeTransitionExampleState();
}

class _FadeTransitionExampleState extends State<FadeTransitionExample>
    with TickerProviderStateMixin {
  late final AnimationController _controller =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);
  late final Animation<double> _animation =
      CurvedAnimation(parent: _controller, curve: Curves.bounceInOut);
  late final AnimationController _coNtrOllEr =
      AnimationController(vsync: this, duration: const Duration(seconds: 2))
        ..repeat(reverse: true);
  late final Animation<double> _aNiMAtION =
      CurvedAnimation(parent: _coNtrOllEr, curve: Curves.elasticInOut);

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
              'Properties of FadeTransition Widget: \n',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.opacity\n'
              '2.alwaysIncludeSemantics,\n'
              '3.child',
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
              'Example 1: FadeTransition with Widget',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 30),
            child: Center(
              child: FadeTransition(
                opacity: _animation,
                child: const FlutterLogo(size: 150),
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
              'Example 2: FadeTransition with Image',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0, right: 30),
            child: Center(
              child: FadeTransition(
                opacity: _aNiMAtION,
                child: Center(
                    child: Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkSlzgF_naJxuH1GVmKSsvK2N4RojeyefhHw&s')),
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
