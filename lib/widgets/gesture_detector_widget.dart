import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class GestureDetectorWidget extends StatefulWidget {
  const GestureDetectorWidget({super.key});

  @override
  State<GestureDetectorWidget> createState() => _GestureDetectorWidgetState();
}

class _GestureDetectorWidgetState extends State<GestureDetectorWidget> {

  String url = 'https://www.youtube.com/watch?v=WhVXkCFPmK4';

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
          'GestureDetector',
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
              filePath: 'lib/widgets/gesture_detector_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class GestureDetectorExample extends StatefulWidget {
              const GestureDetectorExample({super.key});
            
              @override
              State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
            }
            
            class _GestureDetectorExampleState extends State<GestureDetectorExample> {
             
              bool _lightIsOn = false;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: FractionalOffset.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.lightbulb_outline,
                          color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
                          size: 60,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            _lightIsOn = !_lightIsOn;
                          });
                        },
                        child: Container(
                          color: Colors.yellow.shade600,
                          padding: const EdgeInsets.all(8),
                          child:
                              Text(_lightIsOn ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
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
              child: GestureDetectorExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  bool _lightIsOn = false;
  bool _lightIsoN = true;
  bool _lIGHTISON = false;


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
              'Properties of GestureDetector Widget:',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.behavior\n'
              '2.child\n'
              '3.dragStartBehavior\n'
              '4.excludeFromSemantics\n'
              '5.onDoubleTap\n'
              '6.onDoubleTapCancel\n'
              '7.onDoubleTapDown\n'
              '8.onForcePressEnd\n'
              '9.onForcePressPeak\n'
              '10.onForcePressStart\n'
              '11.onForcePressUpdate\n'
              '12.onHorizontalDragCancel\n'
              '13.onHorizontalDragDown\n'
              '14.onHorizontalDragEnd\n'
              '15.onHorizontalDragStart\n'
              '16.onHorizontalDragUpdate\n'
              '17.onLongPress\n'
              '18.onLongPressCancel\n'
              '19.onLongPressDown\n'
              '20.onLongPressEnd\n'
              '21.onLongPressMoveUpdate\n'
              '22.onLongPressStart\n'
              '23.onLongPressUp\n'
              '24.onPanCancel\n'
              '25.onPanDown\n'
              '26.onPanEnd\n'
              '27.onPanStart\n'
              '28.onPanUpdate\n'
              '29.onScaleEnd\n'
              '30.onScaleStart\n'
              '31.onScaleUpdate\n'
              '32.onSecondaryLongPress\n'
              '33.onSecondaryLongPressCancel\n'
              '34.onSecondaryLongPressDown\n'
              '35.onSecondaryLongPressEnd\n'
              '36.onSecondaryLongPressMoveUpdate\n'
              '37.onSecondaryLongPressStart\n'
              '38.onSecondaryLongPressUp\n'
              '39.onSecondaryTap\n'
              '40.onSecondaryTapCancel\n'
              '41.onSecondaryTapDown\n'
              '42.onSecondaryTapUp\n'
              '43.onTap\n'
              '44.onTapCancel\n'
              '45.onTapDown\n'
              '46.onTapUp\n'
              '47.onTertiaryLongPress'
              '48.onTertiaryLongPressCancel\n'
              '49.onTertiaryLongPressDown\n'
              '50.onTertiaryLongPressEnd\n'
              '51.onTertiaryLongPressMoveUpdate\n'
              '52.onTertiaryLongPressStart\n'
              '53.onTertiaryLongPressUp\n'
              '54.onTertiaryTapCancel\n'
              '55.onTertiaryTapDown\n'
              '56.onTertiaryTapUp\n'
              '57.onVerticalDragCancel\n'
              '58.onVerticalTapDown\n'
              '59.onVerticalTapEnd',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: onTap',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: _lightIsOn ? Colors.yellow.shade600 : Colors.black,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _lightIsOn = !_lightIsOn;
                    });
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    child:
                        Text(_lightIsOn ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: onDoubleTap',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: _lightIsoN ? Colors.yellow.shade600 : Colors.black,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onDoubleTap: () {
                    setState(() {
                      _lightIsoN = !_lightIsoN;
                    });
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    child:
                        Text(_lightIsoN ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 3: onLongPress',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            alignment: FractionalOffset.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.lightbulb_outline,
                    color: _lIGHTISON ? Colors.yellow.shade600 : Colors.black,
                    size: 60,
                  ),
                ),
                GestureDetector(
                  onLongPress: () {
                    setState(() {
                      _lIGHTISON = !_lIGHTISON;
                    });
                  },
                  child: Container(
                    color: Colors.yellow.shade600,
                    padding: const EdgeInsets.all(8),
                    child:
                        Text(_lIGHTISON ? 'TURN LIGHT OFF' : 'TURN LIGHT ON'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, height: 50),
        ],
      ),
    );
  }
}
