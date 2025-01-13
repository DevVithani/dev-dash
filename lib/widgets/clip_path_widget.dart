import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ClipPathWidget extends StatefulWidget {
  const ClipPathWidget({super.key});

  @override
  State<ClipPathWidget> createState() => _ClipPathWidgetState();
}

class _ClipPathWidgetState extends State<ClipPathWidget> {

  String url = 'https://www.youtube.com/watch?v=oAUebVIb-7s';

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
          'ClipPath Widget',
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
              filePath: 'lib/widgets/clip_path_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class ClipPathExample extends StatefulWidget {
              const ClipPathExample({super.key});
            
              @override
              State<ClipPathExample> createState() => _ClipPathExampleState();
            }
            
            class _ClipPathExampleState extends State<ClipPathExample> {
              
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
                    'Example: ',
                    style: TextStyle(fontSize: 17),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue,
                              Colors.green,
                              Colors.black,
                              Colors.red,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                        child: const Center(
                          child: Text(
                            'ClipPath',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  // Example 2 Code: 
                  Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: ClipPath(
                      clipper: ClipperExample(),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.purple,
                              Colors.blue,
                              Colors.green,
                              Colors.yellow,
                              Colors.red,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
               ),
               
               // Example 3 Code
               
               Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: ClipPath(
                      clipper: ClipperThree(),
                      child: Container(
                        height: 200,
                        width: 200,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            tileMode: TileMode.mirror,
                            colors: [
                              Colors.blue,
                              Colors.red,
                              Colors.pink,
                              Colors.deepPurpleAccent,
                              Colors.lightBlueAccent,
                              Colors.yellowAccent,
                              Colors.greenAccent,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomRight,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
             ],
                 ),
               );
             }
            }
            
            class MyClipper extends CustomClipper<Path> {
              @override
              Path getClip(Size size) {
                var path = Path();
                path.moveTo(0, size.height * 0.5);
                path.lineTo(size.width * 0.6, 0);
                path.lineTo(size.width * 0.1, 0);
                path.lineTo(size.width, size.height * 0.5);
                path.lineTo(size.width * 0.1, size.height);
                path.lineTo(size.width * 0.7, size.height);
                path.close();
                return path;
              }
            
              @override
              bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
                return false;
              }
            }
            
            class ClipperExample extends CustomClipper<Path> {
              @override
              Path getClip(Size size) {
                var path = Path();
                path.moveTo(1, size.height * 0.5);
                path.lineTo(size.width * 1.2, 0);
                path.lineTo(size.width * 0.27, 0);
                path.lineTo(size.width, size.height * 1.5);
                path.lineTo(size.width * 2.8, size.height);
                path.lineTo(size.width * 3.2, size.height);
                path.close();
                return path;
              }
            
              @override
              bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
                return false;
              }
            }
            
            class ClipperThree extends CustomClipper<Path> {
              @override
              Path getClip(Size size) {
                var path = Path();
                path.moveTo(0, size.height * 0.5);
                path.lineTo(size.width * 0.2, 0);
                path.lineTo(size.width * 0.8, 0);
                path.lineTo(size.width, size.height * 0.5);
                path.lineTo(size.width * 0.8, size.height);
                path.lineTo(size.width * 0.2, size.height);
                path.close();
                return path;
              }
            
              @override
              bool shouldReclip(CustomClipper<Path> oldClipper) {
                return false;
              }
            }''',
              child: ClipPathExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class ClipPathExample extends StatefulWidget {
  const ClipPathExample({super.key});

  @override
  State<ClipPathExample> createState() => _ClipPathExampleState();
}

class _ClipPathExampleState extends State<ClipPathExample> {

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
              'Properties of ClipPath Widget:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.clipBehavior\n'
              '3.clipper',
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
              'Example 1: ',
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
              child: ClipPath(
                clipper: MyClipper(),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.blue,
                        Colors.green,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'ClipPath',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
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
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: ',
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
              child: ClipPath(
                clipper: ClipperExample(),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.purple,
                        Colors.blue,
                        Colors.green,
                        Colors.yellow,
                        Colors.red,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
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
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: ',
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
              child: ClipPath(
                clipper: ClipperThree(),
                child: Container(
                  height: 200,
                  width: 200,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      tileMode: TileMode.mirror,
                      colors: [
                        Colors.blue,
                        Colors.red,
                        Colors.pink,
                        Colors.deepPurpleAccent,
                        Colors.lightBlueAccent,
                        Colors.yellowAccent,
                        Colors.greenAccent,
                      ],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomRight,
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

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.6, 0);
    path.lineTo(size.width * 0.1, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.1, size.height);
    path.lineTo(size.width * 0.7, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipperExample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(1, size.height * 0.5);
    path.lineTo(size.width * 1.2, 0);
    path.lineTo(size.width * 0.27, 0);
    path.lineTo(size.width, size.height * 1.5);
    path.lineTo(size.width * 2.8, size.height);
    path.lineTo(size.width * 3.2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ClipperThree extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(0, size.height * 0.5);
    path.lineTo(size.width * 0.2, 0);
    path.lineTo(size.width * 0.8, 0);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width * 0.8, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
