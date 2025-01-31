import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({super.key});

  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {

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
          "Animated Switcher",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_switcher_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AnimatedSwitcherExample extends StatefulWidget {
          const AnimatedSwitcherExample({super.key});
        
          @override
          State<AnimatedSwitcherExample> createState() =>
        _AnimatedSwitcherExampleState();
        }
        
        class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
          int _count = 0;
        
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
                'Example:',
                style: TextStyle(fontSize: 17),
              ),
            ),
            Center(
              child: ColoredBox(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return RotationTransition(turns: animation, child: child);
                      },
                      child: Text(
                        '_count         //put dollar sign before _count',
                        key: ValueKey<int>(_count),
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    ElevatedButton(
                      child: const Text('Increment'),
                      onPressed: () {
                        setState(() {
                          _count += 1;
                        });
                },
              ),
            ],
          ),
        ),
      ),
      
      
      // Example 2 Code
      
      AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: value
                    ? Container(
                        key: const ValueKey('red_container'),
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      )
                    : Container(
                        key: const ValueKey('Blue_container'),
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                onPressed: () => setState(() {
                  value = !value;
                }),
                child: const Icon(Icons.change_circle),
              ),
              ],
            ),
          );
        }
      }''',
          child: AnimatedSwitcherExample(),
        ),
      ),
    );
  }
}

class AnimatedSwitcherExample extends StatefulWidget {
  const AnimatedSwitcherExample({super.key});

  @override
  State<AnimatedSwitcherExample> createState() =>
      _AnimatedSwitcherExampleState();
}

class _AnimatedSwitcherExampleState extends State<AnimatedSwitcherExample> {
  int _count = 0;
  bool value = false;

  String url = 'https://www.youtube.com/watch?v=2W7POjFb88g';

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
              'Properties of AnimatedSwitcher Widget:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.duration\n'
              '3.layoutBuilder\n'
              '4.reverseDuration\n'
              '5.switchInCurve\n'
              '6.switchOutCurve\n'
              '7.transitionBuilder\n',
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
              'Example 1:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: ColoredBox(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: Text(
                      '$_count',
                      key: ValueKey<int>(_count),
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: ElevatedButton(
                      child: const Text('Increment'),
                      onPressed: () {
                        setState(() {
                          _count += 1;
                        });
                      },
                    ),
                  ),
                ],
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
              'Example 2:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: AnimatedSwitcher(
                duration: const Duration(milliseconds: 500),
                transitionBuilder: (Widget child, Animation<double> animation) {
                  return RotationTransition(turns: animation, child: child);
                },
                child: value
                    ? Container(
                        key: const ValueKey('red_container'),
                        height: 100,
                        width: 100,
                        color: Colors.red,
                      )
                    : Container(
                        key: const ValueKey('Blue_container'),
                        height: 100,
                        width: 100,
                        color: Colors.blue,
                      ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                onPressed: () => setState(() {
                  value = !value;
                }),
                child: const Icon(Icons.change_circle),
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
