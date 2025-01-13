import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class RawMagnifierWidget extends StatefulWidget {
  const RawMagnifierWidget({super.key});

  @override
  State<RawMagnifierWidget> createState() => _RawMagnifierWidgetState();
}

class _RawMagnifierWidgetState extends State<RawMagnifierWidget> {

  String url = 'https://www.youtube.com/watch?v=YBRkVCRP1Gw';

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
          'Raw Magnifier',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
              filePath: 'lib/widgets/raw_magnifier_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class RawMagnifierExample extends StatefulWidget {
              const RawMagnifierExample({super.key});
            
              @override
              State<RawMagnifierExample> createState() => _RawMagnifierExampleState();
            }
            
            class _RawMagnifierExampleState extends State<RawMagnifierExample> {
              Offset dragGesturePosition = Offset.zero;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [      
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text('Drag on the logo!'),
                      RepaintBoundary(
                        child: Stack(
                          children: <Widget>[
                            GestureDetector(
                              onPanUpdate: (DragUpdateDetails details) => setState(
                                () {
                                  dragGesturePosition = details.localPosition;
                                },
                              ),
                              child: const FlutterLogo(size: 200),
                            ),
                            const Positioned(
                              left: 50,
                              top: 50,
                              child: RawMagnifier(
                                decoration: MagnifierDecoration(
                                  shape: CircleBorder(
                                    side: BorderSide(color: Colors.black, width: 2),
                                  ),
                                ),
                                size: Size(100, 100),
                                magnificationScale: 3,
                              ),
                            )
                          ],
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
              child: RawMagnifierExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class RawMagnifierExample extends StatefulWidget {
  const RawMagnifierExample({super.key});

  @override
  State<RawMagnifierExample> createState() => _RawMagnifierExampleState();
}

class _RawMagnifierExampleState extends State<RawMagnifierExample> {
  Offset dragGesturePosition = Offset.zero;

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
                'Properties of RawMagnifier Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.child\n'
                '2.clipBehavior\n'
                '3.decoration\n'
                '4.focalPointOffset\n'
                '5.magnificationScale\n'
                '6.size',
                style: TextStyle(
                  fontSize: 18,
                ),
              )),
          const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              )),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Drag on the logo!'),
                RepaintBoundary(
                  child: Stack(
                    children: <Widget>[
                      GestureDetector(
                        onPanUpdate: (DragUpdateDetails details) => setState(
                          () {
                            dragGesturePosition = details.localPosition;
                          },
                        ),
                        child: const FlutterLogo(size: 200),
                      ),
                      Positioned(
                        left: dragGesturePosition.dx - 35,
                        top: dragGesturePosition.dy - 35,
                        child: const RawMagnifier(
                          decoration: MagnifierDecoration(
                            shape: CircleBorder(
                              side: BorderSide(color: Colors.black, width: 2),
                            ),
                          ),
                          size: Size(100, 100),
                          magnificationScale: 3,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
