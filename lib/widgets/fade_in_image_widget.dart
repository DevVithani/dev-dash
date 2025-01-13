import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FadeInImageWidget extends StatefulWidget {
  const FadeInImageWidget({super.key});

  @override
  State<FadeInImageWidget> createState() => _FadeInImageWidgetState();
}

class _FadeInImageWidgetState extends State<FadeInImageWidget> {

  String url = 'https://www.youtube.com/watch?v=pK738Pg9cxc';

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
          'Fade In Image',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              filePath: 'lib/widgets/fade_in_image_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class FadeInImageExample extends StatefulWidget {
              const FadeInImageExample({super.key});
            
              @override
              State<FadeInImageExample> createState() => _FadeInImageExampleState();
            }
            
            class _FadeInImageExampleState extends State<FadeInImageExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: FadeInImage.assetNetwork(
                          image: 'https://picsum.photos/250?image=9',
                          placeholder: '',
                        ),
                      ),
                      // Example 2 Code: 
                      Padding(
                  padding: const EdgeInsets.only(top: 18.0),
                  child: Stack(
                    children: <Widget>[
                      Center(
                        child: FadeInImage.assetNetwork(
                          image:
                              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ZlsXWQEm7t2VTVVcRFr5UG3X6U8E-a5k9A&s',
                          placeholder: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_XJZNGiY3LVAY3-yNBYYEtUKbAWmoq4Hf7w&s',
                        ),
                      ),
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
              child: FadeInImageExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class FadeInImageExample extends StatefulWidget {
  const FadeInImageExample({super.key});

  @override
  State<FadeInImageExample> createState() => _FadeInImageExampleState();
}

class _FadeInImageExampleState extends State<FadeInImageExample> {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              'Properties of FadeInImage Widget is:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18.0, left: 15),
            child: Text(
              '1.alignment\n'
              '2.color\n'
              '3.colorBlendMode\n'
              '4.excludeFromSemantics\n'
              '5.fadeInCurve\n'
              '6.fadeInDuration\n'
              '7.fadeOutCurve\n'
              '8.fadeOutDuration\n'
              '9.filterQuality\n'
              '10.fit\n'
              '11.height\n'
              '12.image\n'
              '13.placeholder\n'
              '14.repeat\n'
              '15.width\n'
              '16placeholderFit\n',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Stack(
              children: <Widget>[
                Center(
                  child: FadeInImage.assetNetwork(
                    image: 'https://picsum.photos/250?image=9',
                    placeholder: '',
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
            padding: EdgeInsets.only(top: 15, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18.0),
            child: Stack(
              children: <Widget>[
                Center(
                  child: FadeInImage.assetNetwork(
                    image:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_ZlsXWQEm7t2VTVVcRFr5UG3X6U8E-a5k9A&s',
                    placeholder: 'https://picsum.photos/250?image=9',
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
