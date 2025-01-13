import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class MouseRegionWidget extends StatefulWidget {
  const MouseRegionWidget({super.key});

  @override
  State<MouseRegionWidget> createState() => _MouseRegionWidgetState();
}

class _MouseRegionWidgetState extends State<MouseRegionWidget> {

  String url = 'https://youtu.be/1oF3pI5umck';

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
          'Mouse Region',
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
              filePath: 'lib/widgets/mouse_region_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class MouseRegionExample extends StatefulWidget {
              const MouseRegionExample({super.key});
            
              @override
              State<MouseRegionExample> createState() => _MouseRegionExampleState();
            }
            
            class _MouseRegionExampleState extends State<MouseRegionExample> {
            
              int _enterCounter = 0;
              int _exitCounter = 0;
              double x = 0.0;
              double y = 0.0;
            
              void _incrementEnter(PointerEvent details) {
                setState(() {
            _enterCounter++;
                });
              }
            
              void _incrementExit(PointerEvent details) {
                setState(() {
            _exitCounter++;
                });
              }
            
              void _updateLocation(PointerEvent details) {
                setState(() {
            x = details.position.dx;
            y = details.position.dy;
                });
              }
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(
                        const Size(300.0, 200.0),
                      ),
                      child: MouseRegion(
                        onEnter: _incrementEnter,
                        onHover: _updateLocation,
                        onExit: _incrementExit,
                        child: ColoredBox(
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'You have entered or exited this box this many times:',
                              ),
                              Text(
                                '_enterCounter Entries\n_exitCounter Exits',    // put dollar symbol before _enterCounter _exitCounter
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                'The cursor is here: ({x.toStringAsFixed(2)}, {y.toStringAsFixed(2)})',  // put dollar symbol before {}
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 2 code
                
                Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints.tight(
                        const Size(300.0, 200.0),
                      ),
                      child: MouseRegion(
                        onEnter: _incrementEnter,
                        onHover: _updateLocation,
                        onExit: _incrementExit,
                        child: ColoredBox(
                          color: Colors.blue,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                'You have entered or exited this box this many times:',
                              ),
                              Text(
                                '_enterCounter Entries\n_exitCounter Exits',    // put dollar before _enter and _exit
                                style: Theme.of(context).textTheme.headlineMedium,
                              ),
                              Text(
                                'The cursor is here: ({x.toStringAsFixed(2)}, {y.toStringAsFixed(2)})',  // put dollar before {x}, {y}
                              ),
                            ],
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
              child: MouseRegionExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class MouseRegionExample extends StatefulWidget {
  const MouseRegionExample({super.key});

  @override
  State<MouseRegionExample> createState() => _MouseRegionExampleState();
}

class _MouseRegionExampleState extends State<MouseRegionExample> {

  int _enterCounter = 0;
  int _exitCounter = 0;
  double x = 0.0;
  double y = 0.0;

  void _incrementEnter(PointerEvent details) {
    setState(() {
      _enterCounter++;
    });
  }

  void _incrementExit(PointerEvent details) {
    setState(() {
      _exitCounter++;
    });
  }

  void _updateLocation(PointerEvent details) {
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
  }

  String status = '';

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
              'Properties of MouseRegion Widget:',
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
              '2.cursor\n'
              '3.hitTestBehavior\n'
              '4.onEnter\n'
              '5.onExit\n'
              '6.onHover\n'
              '7.opaque',
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
            padding: EdgeInsets.only(top: 18, left: 15, bottom: 10),
            child: Text(
              'Example 1: Basic Example',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Mouse Status : $status'),
                const SizedBox(
                  height: 30,
                ),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  opaque: false,
                  onEnter: (s) {
                    setState(() {
                      status = 'Mouse Entered in region';
                    });
                  },
                  onHover: (s) {
                    setState(() {
                      status = 'Mouse hovering on region';
                    });
                  },
                  onExit: (s) {
                    setState(() {
                      status = 'Mouse exit from region';
                    });
                  },
                  child: Container(
                    height: 80.0,
                    width: 80.0,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.blueAccent),
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
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: Complex Example',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ConstrainedBox(
                constraints: BoxConstraints.tight(
                  const Size(300.0, 200.0),
                ),
                child: MouseRegion(
                  onEnter: _incrementEnter,
                  onHover: _updateLocation,
                  onExit: _incrementExit,
                  child: ColoredBox(
                    color: Colors.blue,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'You have entered or exited this box this many times:',
                        ),
                        Text(
                          '$_enterCounter Entries\n$_exitCounter Exits',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        Text(
                          'The cursor is here: (${x.toStringAsFixed(2)}, ${y.toStringAsFixed(2)})',
                        ),
                      ],
                    ),
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
