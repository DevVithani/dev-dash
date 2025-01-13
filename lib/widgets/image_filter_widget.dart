import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ImageFilterWidget extends StatefulWidget {
  const ImageFilterWidget({super.key});

  @override
  State<ImageFilterWidget> createState() => _ImageFilterWidgetState();
}

class _ImageFilterWidgetState extends State<ImageFilterWidget> {

  String url = 'https://youtu.be/7Lftorq4i2o';

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
          'Image Filter',
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
              filePath: 'lib/widgets/image_filter_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class ImageFilteredExample extends StatefulWidget {
              const ImageFilteredExample({super.key});
            
              @override
              State<ImageFilteredExample> createState() => _ImageFilteredExampleState();
            }
            
            class _ImageFilteredExampleState extends State<ImageFilteredExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
              // Example 1 code
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 2 code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.compose(
                        outer: ImageFilter.erode(radiusY: 20, radiusX: 20),
                        inner: ImageFilter.dilate(radiusX: 10, radiusY: 20),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 3 code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.erode(
                        radiusX: 20,
                        radiusY: 36,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 4 code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.dilate(
                        radiusY: 25,
                        radiusX: 32,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Example 5 code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ImageFiltered(
                      imageFilter: ImageFilter.matrix(
                        Matrix4.rotationZ(0.2).storage,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
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
              child: ImageFilteredExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class ImageFilteredExample extends StatefulWidget {
  const ImageFilteredExample({super.key});

  @override
  State<ImageFilteredExample> createState() => _ImageFilteredExampleState();
}

class _ImageFilteredExampleState extends State<ImageFilteredExample> {

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
              'Properties of ImageFiltered Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.enabled\n'
              '3.imageFilter',
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
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: ImageFilter.blur',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ImageFiltered(
                imageFilter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 150,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: ImageFilter.compass',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ImageFiltered(
                imageFilter: ImageFilter.compose(
                  outer: ImageFilter.erode(radiusY: 20, radiusX: 20),
                  inner: ImageFilter.dilate(radiusX: 10, radiusY: 20),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 150,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: ImageFilter.erode',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ImageFiltered(
                imageFilter: ImageFilter.erode(
                  radiusX: 20,
                  radiusY: 36,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 150,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: ImageFilter.dilate',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ImageFiltered(
                imageFilter: ImageFilter.dilate(
                  radiusY: 25,
                  radiusX: 32,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 150,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: ImageFilter.matrix',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ImageFiltered(
                imageFilter: ImageFilter.matrix(
                  Matrix4.rotationZ(0.2).storage,
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRm2-IiCQnnEHH1dk5HN2K60xrv8Wyu8VRW7Q&s',
                  ),
                ),
              ),
            ),
          ),
          const Divider(
            height: 150,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
