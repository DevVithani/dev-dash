import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class CheckBoxListTileWidget extends StatefulWidget {
  const CheckBoxListTileWidget({super.key});

  @override
  State<CheckBoxListTileWidget> createState() => _CheckBoxListTileWidgetState();
}

class _CheckBoxListTileWidgetState extends State<CheckBoxListTileWidget> {

  String url = 'https://www.youtube.com/watch?v=RkSqPAn9szs';

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
  void dispose() {
    controller?.dispose();
    super.dispose();
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
          'Checkbox ListTile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
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
              filePath: 'lib/widgets/check_box_list_tile_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class CheckBoxListTileExample extends StatefulWidget {
              const CheckBoxListTileExample({super.key});
            
              @override
              State<CheckBoxListTileExample> createState() =>
            _CheckBoxListTileExampleState();
            }
            
            class _CheckBoxListTileExampleState extends State<CheckBoxListTileExample> {
              bool checkboxValue1 = false;
              bool checkboxValue2 = true;
              bool checkboxValue3 = false;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Column(
                    children: <Widget>[
                    
                  //Example 1 Code
                  
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: CheckboxListTile(
                    activeColor: Colors.black,
                    value: checkboxValue1,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValue1 = value!;
                      });
                    },
                    title: const Text('Headline'),
                    subtitle: const Text('Supporting Text'),
                  ),
                ),
                
                // Example 2 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: CheckboxListTile(
                    activeColor: Colors.black,
                    value: checkboxValue2,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValue2 = value!;
                      });
                    },
                    title: const Text('Headline'),
                    subtitle: const Text(
                        'Longer supporting text to demonstrate how the text wraps and the checkbox is centered vertically with the text.'),
                  ),
                ),
                
                //Example 3 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: CheckboxListTile(
                    activeColor: Colors.black,
                    value: checkboxValue3,
                    onChanged: (bool? value) {
                      setState(() {
                        checkboxValue3 = value!;
                      });
                    },
                    title: const Text('Headline'),
                    subtitle: const Text(
                        "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text."),
                    isThreeLine: true,
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
              child: CheckBoxListTileExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxListTileExample extends StatefulWidget {
  const CheckBoxListTileExample({super.key});

  @override
  State<CheckBoxListTileExample> createState() =>
      _CheckBoxListTileExampleState();
}

class _CheckBoxListTileExampleState extends State<CheckBoxListTileExample> {
  bool checkboxValue1 = false;
  bool checkboxValue2 = true;
  bool checkboxValue3 = false;

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
              'Properties of CheckBoxListTile Widget:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.activeColor\n'
              '2.autofocus\n'
              '3.checkboxSemanticLabel\n'
              '4.checkboxShape\n'
              '5.checkColor\n'
              '6.contentPadding\n'
              '7.controlAffinity\n'
              '8.dense\n'
              '9.enabled\n'
              '10.enableFeedback\n'
              '11.fillColor\n'
              '12.focusNode\n'
              '13.hoverColor\n'
              '14.isError\n'
              '15.isThreeLine\n'
              '16.materialTapTargetSize\n'
              '17.mouseCursor\n'
              '18.onChanged\n'
              '19.onFocusChange\n'
              '20.overlayColor\n'
              '21.secondary\n'
              '22.selected\n'
              '23.selectedTileColor\n'
              '24.shape\n'
              '25.side\n'
              '26.splashRadius\n'
              '27.subtitle\n'
              '28.tileColor\n'
              '29.title\n'
              '30.triState\n'
              '31.value\n'
              '32.visualDensity',
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
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: CheckboxListTile(
              activeColor: Colors.black,
              value: checkboxValue1,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue1 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text('Supporting Text'),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: CheckboxListTile(
              activeColor: Colors.black,
              value: checkboxValue2,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue2 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                  'Longer supporting text to demonstrate how the text wraps and the checkbox is centered vertically with the text.'),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
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
            child: CheckboxListTile(
              activeColor: Colors.black,
              value: checkboxValue3,
              onChanged: (bool? value) {
                setState(() {
                  checkboxValue3 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                "Longer supporting text to demonstrate how the text wraps and how setting 'CheckboxListTile.isThreeLine = true' aligns the checkbox to the top vertically with the text.",
              ),
              isThreeLine: true,
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
