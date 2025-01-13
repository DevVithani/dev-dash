import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class RichTextWidget extends StatefulWidget {
  const RichTextWidget({super.key});

  @override
  State<RichTextWidget> createState() => _RichTextWidgetState();
}

class _RichTextWidgetState extends State<RichTextWidget> {

  String url = 'https://www.youtube.com/watch?v=rykDVh-QFfw';

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
        title: const Text(
          'Rich Text',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
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
              filePath: 'lib/widgets/rich_text_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
                import 'package:flutter/material.dart';
              
              class RichTextExample extends StatefulWidget {
              const RichTextExample({super.key});
            
              @override
              State<RichTextExample> createState() => _RichTextExampleState();
            }
            
            class _RichTextExampleState extends State<RichTextExample> {
            
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
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 21,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Hello ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: "There, ",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ),
                          ),
                          TextSpan(
                              text: "This is ",
                              style: TextStyle(fontFamily: 'Montserrat')),
                          TextSpan(
                            text: "Flutter",
                            style: TextStyle(
                              fontSize: 43,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Montserrat',
                              color: Colors.orange,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 25,
                        ),
                        children: <TextSpan>[
                          TextSpan(
                            text: "Dev",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                          TextSpan(
                            text: "Dash",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Roboto',
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: RichTextExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class RichTextExample extends StatefulWidget {
  const RichTextExample({super.key});

  @override
  State<RichTextExample> createState() => _RichTextExampleState();
}

class _RichTextExampleState extends State<RichTextExample> {

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
              'Properties of RichText Widget:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.children\n'
              '2.locale\n'
              '3.maxLines\n'
              '4.overflow\n'
              '5.selectionColor\n'
              '6.selectionRegistrar\n'
              '7.softWrap\n'
              '8.strutStyle\n'
              '9.text\n'
              '10.textAlign\n'
              '11.textDirection\n'
              '12.textHeightBehavior\n'
              '13.textScaler\n'
              '14.textWidthBasis',
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
              'Example 1:',
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
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 21,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Hello ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    TextSpan(
                      text: "There, ",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                      ),
                    ),
                    TextSpan(
                        text: "This is ",
                        style: TextStyle(fontFamily: 'Montserrat')),
                    TextSpan(
                      text: "Flutter",
                      style: TextStyle(
                        fontSize: 43,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Montserrat',
                        color: Colors.orange,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2:',
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
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: "Dev",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    TextSpan(
                      text: "Dash",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Roboto',
                        color: Colors.black,
                      ),
                    ),
                  ],
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
