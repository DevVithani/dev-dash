import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SelectableTextWidget extends StatefulWidget {
  const SelectableTextWidget({super.key});

  @override
  State<SelectableTextWidget> createState() => _SelectableTextWidgetState();
}

class _SelectableTextWidgetState extends State<SelectableTextWidget> {

  String url = 'https://www.youtube.com/watch?v=ZSU3ZXOs6hc';

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
          'Selectable Text',
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
              filePath: 'lib/widgets/selectable_text_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class SelectableTextExample extends StatefulWidget {
              const SelectableTextExample({super.key});
            
              @override
              State<SelectableTextExample> createState() => _SelectableTextExampleState();
            }
            
            class _SelectableTextExampleState extends State<SelectableTextExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: SelectableText.rich(
                      minLines: 3,
                      TextSpan(
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        text:
                            'Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the ',
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Android, IOS, Web, Linux, Windows and Mac OS.',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic,
                              fontFamily: 'Montserrat',
                              color: Colors.redAccent,
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
              child: SelectableTextExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class SelectableTextExample extends StatefulWidget {
  const SelectableTextExample({super.key});

  @override
  State<SelectableTextExample> createState() => _SelectableTextExampleState();
}

class _SelectableTextExampleState extends State<SelectableTextExample> {

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Properties of SelectableText Widget: \n',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.autofocus\n'
              '2.contextMenuBuilder\n'
              '3.cursorColor\n'
              '4.cursorHeight\n'
              '5.cursorRadius\n'
              '6.cursorWidth\n'
              '7.data\n'
              '8.dragStartBehavior\n'
              '9.enableInteractiveSelection\n'
              '10.focusNode\n'
              '11.magnifierConfiguration\n'
              '12.maxLines\n'
              '13.minLines\n'
              '14.onSelectionChanged\n'
              '15.onTap\n'
              '16.scrollPhysics\n'
              '17.selectionControls\n'
              '18.selectionEnabled\n'
              '19.selectionHeightStyle\n'
              '20.selectionWidthStyle\n'
              '21.semanticsLabel\n'
              '22.showCursor\n'
              '23.strutStyle\n'
              '24.style\n'
              '25.textAlign\n'
              '26.textHeightBehavior\n'
              '27.textScaler\n'
              '28.textSpan\n'
              '29.textWidthBasis',
              style: TextStyle(fontSize: 18),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: SelectableText.rich(
                minLines: 3,
                TextSpan(
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  text:
                      'Flutter is an open-source UI software development kit created by Google. It can be used to develop cross platform applications from a single codebase for the ',
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Android, IOS, Web, Linux, Windows and Mac OS.',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontFamily: 'Montserrat',
                        color: Colors.redAccent,
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
}
