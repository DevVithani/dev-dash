import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedOpacityWidget extends StatefulWidget {
  const AnimatedOpacityWidget({super.key});

  @override
  State<AnimatedOpacityWidget> createState() => _AnimatedOpacityWidgetState();
}

class _AnimatedOpacityWidgetState extends State<AnimatedOpacityWidget> {

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
          'Animated Opacity',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_opacity_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AnimatedOpacityExample extends StatefulWidget {
          const AnimatedOpacityExample({super.key});
        
          @override
          State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
        }
        
        class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
          double opacityLevel = 1.0;
          double opACityLevel = 1.0;
        
          void _changeOpacity() {
            setState(() {
        opacityLevel = opacityLevel == 0 ? 1.0 : 0.00;
            });
          }
          
            void _opacityChange() {
            setState(() {
        opACityLevel = opACityLevel == 0 ? 1.0 : 0.00;
            });
          }
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
          
            // Example 1 Code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: AnimatedOpacity(
                      opacity: opacityLevel,
                      duration: const Duration(seconds: 1),
                      child: const FlutterLogo(
                        size: 100,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: ElevatedButton(
                        onPressed: _changeOpacity,
                        child: const Text(
                          'Fade Logo',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            
            // Example 2 Code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: AnimatedOpacity(
                      opacity: opacityLevel,
                      duration: const Duration(seconds: 1),
                      child: Image.network('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSymIX9nnyHCZoUUNG_ZTfxZOSa6GfqGgQDgg&s')
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: ElevatedButton(
                        onPressed: _changeOpacity,
                        child: const Text(
                          'Fade Image',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )),
                  )
                ],
              ),
            ),
            
            // Example 2 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child: AnimatedOpacity(
                        opacity: opACityLevel,
                        duration: const Duration(seconds: 1),
                        child: Image.network(
                            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSymIX9nnyHCZoUUNG_ZTfxZOSa6GfqGgQDgg&s')),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: ElevatedButton(
                      onPressed: _opacityChange,
                      child: const Text(
                        'Fade Image',
                        style: TextStyle(
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
          child: AnimatedOpacityExample(),
        ),
      ),
    );
  }
}

class AnimatedOpacityExample extends StatefulWidget {
  const AnimatedOpacityExample({super.key});

  @override
  State<AnimatedOpacityExample> createState() => _AnimatedOpacityExampleState();
}

class _AnimatedOpacityExampleState extends State<AnimatedOpacityExample> {
  double opacityLevel = 1.0;
  double opACityLevel = 1.0;

  void _changeOpacity() {
    setState(() {
      opacityLevel = opacityLevel == 0 ? 1.0 : 0.00;
    });
  }

  void _opacityChange() {
    setState(() {
      opACityLevel = opACityLevel == 0 ? 1.0 : 0.00;
    });
  }

  String url = 'https://www.youtube.com/watch?v=QZAvjqOqiLY';

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
              'Properties of AnimatedOpacity Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alwaysIncludeSemantics\n'
              '2.child\n'
              '3.curve\n'
              '4.duration\n'
              '5.onEnd\n'
              '6.opacity',
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
              'Example 1: AnimatedOpacity with Widget',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AnimatedOpacity(
                    opacity: opacityLevel,
                    duration: const Duration(seconds: 1),
                    child: const FlutterLogo(
                      size: 100,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                      onPressed: _changeOpacity,
                      child: const Text(
                        'Fade Logo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                )
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: AnimatedOpacity with Image',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: AnimatedOpacity(
                      opacity: opACityLevel,
                      duration: const Duration(seconds: 1),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSymIX9nnyHCZoUUNG_ZTfxZOSa6GfqGgQDgg&s')),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: ElevatedButton(
                    onPressed: _opacityChange,
                    child: const Text(
                      'Fade Image',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
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
