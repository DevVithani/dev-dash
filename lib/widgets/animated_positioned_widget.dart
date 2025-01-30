import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedPositionedWidget extends StatefulWidget {
  const AnimatedPositionedWidget({super.key});

  @override
  State<AnimatedPositionedWidget> createState() =>
      _AnimatedPositionedWidgetState();
}

class _AnimatedPositionedWidgetState extends State<AnimatedPositionedWidget> {

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
          'Animated Position',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_positioned_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AnimatedPositionExample extends StatefulWidget {
          const AnimatedPositionExample({super.key});
        
          @override
          State<AnimatedPositionExample> createState() =>
        _AnimatedPositionExampleState();
        }
        
        class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
          bool _isLeft = true;
           bool _isTop = true;
          bool selected = true;
        
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
        body: SingleChildScrollView(
          clipBehavior: Clip.none,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6.8,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(seconds: 2),
                        left: _isLeft ? 10 : 270,
                        top: 50,
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                 /// Example 2 Code
                 
                 Padding(
              padding: const EdgeInsets.all(18.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6.8,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(seconds: 2),
                        top: _isTop ? 10 : 50,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _isTop = !_isTop;
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.black,
                            child: const Center(
                              child: Text(
                                'Tap',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            
            
            /// Example 3 Code
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 28.0),
              child: Center(
                child: SizedBox(
                  height: MediaQuery.of(context).size.height / 6.8,
                  child: Stack(
                    children: <Widget>[
                      AnimatedPositioned(
                        duration: const Duration(seconds: 2),
                        width: selected ? 90.0 : 10.0,
                        height: selected ? 10.0 : 90.0,
                        top: selected ? 50.0 : 100.0,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              selected = !selected;
                            });
                          },
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
              ),
            ),
          );
        }
      }''',
          child: AnimatedPositionExample(),
        ),
      ),
    );
  }
}

class AnimatedPositionExample extends StatefulWidget {
  const AnimatedPositionExample({super.key});

  @override
  State<AnimatedPositionExample> createState() =>
      _AnimatedPositionExampleState();
}

class _AnimatedPositionExampleState extends State<AnimatedPositionExample> {
  bool _isLeft = true;
  bool _isTop = true;
  bool selected = true;

  String url = 'https://youtu.be/hC3s2YdtWt8';

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
              'Properties of AnimatedPositioned Widget: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.bottom\n'
              '2.child\n'
              '3.curve\n'
              '4.duration\n'
              '5.height\n'
              '6.left\n'
              '7.onEnd\n'
              '8.right\n'
              '9.top\n'
              '10.width',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 75,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: Left-Right Position',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 6.8,
              child: Stack(
                children: <Widget>[
                  AnimatedPositioned(
                    duration: const Duration(seconds: 2),
                    left: _isLeft ? 10 : 270,
                    top: 50,
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          _isLeft = !_isLeft;
                        });
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        color: Colors.black,
                        child: const Center(
                            child: Text(
                          'Tap',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.white),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 75,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: Up-Down Position',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 6.8,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: const Duration(seconds: 2),
                      top: _isTop ? 10 : 50,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isTop = !_isTop;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                          child: const Center(
                            child: Text(
                              'Tap',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 75,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 3: Shape changing Position(Tap on Container)',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Center(
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 6.8,
                child: Stack(
                  children: <Widget>[
                    AnimatedPositioned(
                      duration: const Duration(seconds: 2),
                      width: selected ? 90.0 : 10.0,
                      height: selected ? 10.0 : 90.0,
                      top: selected ? 50.0 : 100.0,
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selected = !selected;
                          });
                        },
                        child: Container(
                          height: 100,
                          width: 100,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
          ),
        ],
      ),
    );
  }
}
