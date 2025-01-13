import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';



class InkWellWidget extends StatefulWidget {
  const InkWellWidget({super.key});

  @override
  State<InkWellWidget> createState() => _InkWellWidgetState();
}

class _InkWellWidgetState extends State<InkWellWidget> {
  String url = 'https://www.youtube.com/watch?v=YbrrnSDCbC4';

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
          'Inkwell',
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
              filePath: 'lib/widgets/inkwell_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class InkwellExample extends StatefulWidget {
              const InkwellExample({super.key});
            
              @override
              State<InkwellExample> createState() => _InkwellExampleState();
            }
            
            class _InkwellExampleState extends State<InkwellExample> {
              double sideLength = 100;
              double siDelENgTH= 100;
              double  sIDElEnGTH= 100;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 Code
              
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: sideLength,
                      width: sideLength,
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            sideLength == 100 ? sideLength = 200 : sideLength = 100;
                          });
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }
            
            
                // Example 2 Code
            
                  Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: sIDElEnGTH,
                      width: sIDElEnGTH,
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      child: InkWell(
                        splashColor: Colors.white,
                        onDoubleTap: () {
                          setState(() {
                            sIDElEnGTH == 100 ? sIDElEnGTH = 200 : sIDElEnGTH = 100;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                
                // Example 3 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: AnimatedContainer(
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      height: siDelENgTH,
                      width: siDelENgTH,
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      child: InkWell(
                        splashColor: Colors.white,
                        onLongPress: () {
                          setState(() {
                            siDelENgTH == 100 ? siDelENgTH = 200 : siDelENgTH = 100;
                          });
                        },
                      ),
                    ),
                  ),
                ),''',
              child: InkwellExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class InkwellExample extends StatefulWidget {
  const InkwellExample({super.key});

  @override
  State<InkwellExample> createState() => _InkwellExampleState();
}

class _InkwellExampleState extends State<InkwellExample> {
  double sideLength = 100;
  double siDelENgTH = 100;
  double sIDElEnGTH = 100;

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
              'Properties of Inkwell Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.autofocus\n'
              '2.borderRadius\n'
              '3.canRequestFocus\n'
              '4.child\n'
              '5.containedInkWell\n'
              '6.customBorder\n'
              '7.enableFeedback\n'
              '8.excludeFromSemantics\n'
              '9.focusColor\n'
              '10.focusNode\n'
              '11.highlightColor\n'
              '12.highlightShape\n'
              '13.hoverColor\n'
              '14.hoverDuration\n'
              '15.mouseCursor\n'
              '16.onDoubleTap\n'
              '17.onFocusChange\n'
              '18.onHighlightChanged\n'
              '19.onHover\n'
              '20.onLongPress\n'
              '21.onSecondaryTap\n'
              '22.onSecondaryTapCancel\n'
              '23.onSecondaryTapDown\n'
              '24.onSecondaryTapUp\n'
              '25.onTap\n'
              '26.onTapCancel\n'
              '27.onTapDown\n'
              '28.onTapUp\n'
              '29.overlayColor\n'
              '30.radius\n'
              '31.splashColor\n'
              '32.splashFactory\n'
              '33.statesController\n',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(
            height: 75,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: onTap ',
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
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: sideLength,
                width: sideLength,
                duration: const Duration(seconds: 2),
                curve: Curves.bounceInOut,
                child: InkWell(
                  splashColor: Colors.white,
                  onTap: () {
                    setState(() {
                      sideLength == 100 ? sideLength = 200 : sideLength = 100;
                    });
                  },
                ),
              ),
            ),
          ),
          const Divider(
            height: 75,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: onDoubleTap ',
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
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: sIDElEnGTH,
                width: sIDElEnGTH,
                duration: const Duration(seconds: 2),
                curve: Curves.fastEaseInToSlowEaseOut,
                child: InkWell(
                  splashColor: Colors.white,
                  onDoubleTap: () {
                    setState(() {
                      sIDElEnGTH == 100 ? sIDElEnGTH = 200 : sIDElEnGTH = 100;
                    });
                  },
                ),
              ),
            ),
          ),
          const Divider(
            height: 75,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 3: onLongPress ',
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
              child: AnimatedContainer(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                height: siDelENgTH,
                width: siDelENgTH,
                duration: const Duration(seconds: 2),
                curve: Curves.elasticInOut,
                child: InkWell(
                  splashColor: Colors.white,
                  onLongPress: () {
                    setState(() {
                      siDelENgTH == 100 ? siDelENgTH = 200 : siDelENgTH = 100;
                    });
                  },
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
