import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedContainerWidget extends StatefulWidget {
  const AnimatedContainerWidget({super.key});

  @override
  State<AnimatedContainerWidget> createState() =>
      _AnimatedContainerWidgetState();
}

class _AnimatedContainerWidgetState extends State<AnimatedContainerWidget> {
  String url = 'https://www.youtube.com/watch?v=yI-8QHpGIP4';

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
          'Animated Container',
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
              filePath: 'lib/widgets/animated_container_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class AnimatedContainerExample extends StatefulWidget {
              const AnimatedContainerExample({super.key});
            
              @override
              State<AnimatedContainerExample> createState() =>
            _AnimatedContainerExampleState();
            }
            
            class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
              bool selected = false;
              bool sELECTED = false;
              bool seLeCTeD = false;
              bool sElEcTeD = false;
              bool seLeCtEd = false;
            
              @override
              Widget build(BuildContext context) {
                return GestureDetector(
            onTap: () {
              setState(() {
                selected = !selected;
              });
            },
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Example 1 Code
                  
                  Center(
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 15),
                      width: selected ? 200.0 : 100.0,
                      height: selected ? 200.0 : 100.0,
                      alignment: selected
                          ? Alignment.center
                          : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.elasticInOut,
                      decoration: BoxDecoration(
                        color: selected ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlutterLogo(size: 75),
                    ),
                  ),
                  const Divider(thickness: 2, height: 50),
                // Example 2 Code
                
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sELECTED = !sELECTED;
                      });
                    },
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 15),
                      width: sELECTED ? 200.0 : 100.0,
                      height: sELECTED ? 200.0 : 100.0,
                      alignment:
                      sELECTED ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                        color: sELECTED ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlutterLogo(size: 75),
                    ),
                  ),
                ),
                const Divider(thickness: 2, height: 50),
                // Example 3 Code
                
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        sElEcTeD = !sElEcTeD;
                      });
                    },
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 15),
                      width: sElEcTeD ? 200.0 : 100.0,
                      height: sElEcTeD ? 200.0 : 100.0,
                      alignment:
                      sElEcTeD ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeInOut,
                      decoration: BoxDecoration(
                        color: sElEcTeD ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlutterLogo(size: 75),
                    ),
                  ),
                ),
                const Divider(thickness: 2, height: 50),
                // Example 4 Code
                
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seLeCTeD = !seLeCTeD;
                      });
                    },
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 15),
                      width: seLeCTeD ? 200.0 : 100.0,
                      height: seLeCTeD ? 200.0 : 100.0,
                      alignment:
                      seLeCTeD ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutQuint,
                      decoration: BoxDecoration(
                        color: seLeCTeD ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlutterLogo(size: 75),
                    ),
                  ),
                ),
                const Divider(thickness: 2, height: 50),
                // Example 5 code
                
                Center(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        seLeCtEd = !seLeCtEd;
                      });
                    },
                    child: AnimatedContainer(
                      margin: const EdgeInsets.only(top: 15),
                      width: seLeCtEd ? 200.0 : 100.0,
                      height: seLeCtEd ? 200.0 : 100.0,
                      alignment:
                      seLeCtEd ? Alignment.center : AlignmentDirectional.topCenter,
                      duration: const Duration(seconds: 2),
                      curve: Curves.easeOutQuart,
                      decoration: BoxDecoration(
                        color: seLeCtEd ? Colors.red : Colors.blue,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const FlutterLogo(size: 75),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}''',
              child: AnimatedContainerExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedContainerExample extends StatefulWidget {
  const AnimatedContainerExample({super.key});

  @override
  State<AnimatedContainerExample> createState() =>
      _AnimatedContainerExampleState();
}

class _AnimatedContainerExampleState extends State<AnimatedContainerExample> {
  bool selected = false;
  bool sELECTED = false;
  bool seLeCTeD = false;
  bool sElEcTeD = false;
  bool seLeCtEd = false;

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
              'Properties of AnimatedContainer:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.padding\n'
              '3.color\n'
              '4.decoration\n'
              '5.foregroundDecoration\n'
              '6.double\n'
              '7.double\n'
              '8.constraints\n'
              '9.margin\n'
              '10.transform\n'
              '11.Curve\n'
              '12.duration\n'
              '13.child',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Example 1: elasticInOut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selected = !selected;
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 15),
                width: selected ? 200.0 : 100.0,
                height: selected ? 200.0 : 100.0,
                alignment: selected
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.elasticInOut,
                decoration: BoxDecoration(
                  color: selected ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Example 2: bounceInOut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  sELECTED = !sELECTED;
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 15),
                width: sELECTED ? 200.0 : 100.0,
                height: sELECTED ? 200.0 : 100.0,
                alignment: sELECTED
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.bounceInOut,
                decoration: BoxDecoration(
                  color: sELECTED ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Example 3: easeInOut',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  sElEcTeD = !sElEcTeD;
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 15),
                width: sElEcTeD ? 200.0 : 100.0,
                height: sElEcTeD ? 200.0 : 100.0,
                alignment: sElEcTeD
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.easeInOut,
                decoration: BoxDecoration(
                  color: sElEcTeD ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Example 4: easeOutQuint',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  seLeCTeD = !seLeCTeD;
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 15),
                width: seLeCTeD ? 200.0 : 100.0,
                height: seLeCTeD ? 200.0 : 100.0,
                alignment: seLeCTeD
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutQuint,
                decoration: BoxDecoration(
                  color: seLeCTeD ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FlutterLogo(size: 75),
              ),
            ),
          ),
          const Divider(thickness: 2, height: 50),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Example 5: easeOutQuart',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  seLeCtEd = !seLeCtEd;
                });
              },
              child: AnimatedContainer(
                margin: const EdgeInsets.only(top: 15),
                width: seLeCtEd ? 200.0 : 100.0,
                height: seLeCtEd ? 200.0 : 100.0,
                alignment: seLeCtEd
                    ? Alignment.center
                    : AlignmentDirectional.topCenter,
                duration: const Duration(seconds: 2),
                curve: Curves.easeOutQuart,
                decoration: BoxDecoration(
                  color: seLeCtEd ? Colors.red : Colors.blue,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const FlutterLogo(size: 75),
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
