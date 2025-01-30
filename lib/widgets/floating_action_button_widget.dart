import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FloatingActionButtonWidget extends StatefulWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  State<FloatingActionButtonWidget> createState() =>
      _FloatingActionButtonWidgetState();
}

class _FloatingActionButtonWidgetState
    extends State<FloatingActionButtonWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'FloatingAction Button',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/floating_action_button_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FloatingActionButtonExample extends StatefulWidget {
          const FloatingActionButtonExample({super.key});
        
          @override
          State<FloatingActionButtonExample> createState() =>
        _FloatingActionButtonExampleState();
        }
        
        class _FloatingActionButtonExampleState
            extends State<FloatingActionButtonExample> {
          int i = 0;
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
        body: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Center(
                  child: Text(
                    'Button Pressed this many Times:',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "i",                //put dollar symbol before i
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.black,
          onPressed: () {
            setState(() {
              i++;
            });
          },
          child: const Icon(
            Icons.add,
            color: Colors.white,
            weight: 30.0,
          ),
        ),
            );
          }
        }''',
          child: FloatingActionButtonExample(),
        ),
      ),
    );
  }
}

class FloatingActionButtonExample extends StatefulWidget {
  const FloatingActionButtonExample({super.key});

  @override
  State<FloatingActionButtonExample> createState() =>
      _FloatingActionButtonExampleState();
}

class _FloatingActionButtonExampleState
    extends State<FloatingActionButtonExample> {

  String url = 'https://www.youtube.com/watch?v=2uaoEDOgk_I';

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

  int i = 0;
  int j = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                  'Properties of FloatingAction Button:',
                  style: TextStyle(fontWeight: FontWeight.w800, fontSize: 20),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18, left: 15),
                child: Text(
                  '1.child\n'
                  '2.tooltip\n'
                  '3.backgroundColor\n'
                  '4.foregroundColor\n'
                  '5.focusColor\n'
                  '6.hoverColor\n'
                  '7.splashColor\n'
                  '8.heroTag: const _DefaultHeroTag(),\n'
                  '9.elevation\n'
                  '10.focusElevation\n'
                  '11.hoverElevation\n'
                  '12.highlightElevation\n'
                  '13.disabledElevation\n'
                  '14.onPressed\n'
                  '15.mouseCursor\n'
                  '16.mini\n'
                  '17.shape\n'
                  '18.ClipBehavior\n'
                  '19.focusNode\n'
                  '20.autofocus\n'
                  '21.isExtended\n'
                  '22.materialTapTargetSize\n',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Example 1:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Center(
                  child: Text(
                    'Press +1 button for +1 number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$i",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 50,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Example 2:',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                    fontSize: 17,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Center(
                  child: Text(
                    'Press -1 button for -1 number',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Center(
                child: Text(
                  "$j",
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Divider(
                thickness: 2,
                height: 50,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: FloatingActionButton(
                onPressed: () {
                  setState(() {
                    i++;
                  });
                },
                backgroundColor: Colors.red,
                child: const Icon(
                  Icons.plus_one,
                  color: Colors.white,
                  weight: 30,
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  j--;
                });
              },
              backgroundColor: Colors.blue,
              child: const Icon(
                Icons.exposure_minus_1,
                color: Colors.white,
                weight: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
