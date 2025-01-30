import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SwitchListTileWidget extends StatefulWidget {
  const SwitchListTileWidget({super.key});

  @override
  State<SwitchListTileWidget> createState() => _SwitchListTileWidgetState();
}

class _SwitchListTileWidgetState extends State<SwitchListTileWidget> {

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
          'Switch ListTile',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/switch_list_tile_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
         
          class SwitchListTileExample extends StatefulWidget {
          const SwitchListTileExample({super.key});
        
          @override
          State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
        }
        
        class _SwitchListTileExampleState extends State<SwitchListTileExample> {
        
          bool switchValue1 = true;
          bool switchValue2 = false;
          bool switchValue3 = false;
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Column(
                children: [
                  const Divider(
              height: 50,
              thickness: 2,
            ),
            
            // Example 1 Code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: SwitchListTile(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                value: switchValue1,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue1 = value!;
                  });
                },
                title: const Text('Headline'),
                subtitle: const Text('Supporting Text'),
              ),
            ),
            
            
            // Example 2 Code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: SwitchListTile(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                value: switchValue2,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue2 = value!;
                  });
                },
                title: const Text('Headline'),
                subtitle: const Text(
                    'Longer supporting text to demonstrate how the text wraps and the switch is centered vertically with the text.'),
              ),
            ),
            
            // Example 3 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: SwitchListTile(
                activeColor: Colors.white,
                activeTrackColor: Colors.black,
                value: switchValue3,
                onChanged: (bool? value) {
                  setState(() {
                    switchValue3 = value!;
                  });
                },
                title: const Text('Headline'),
                subtitle: const Text(
                    "Longer supporting text to demonstrate how the text wraps and how setting 'SwitchListTile.isThreeLine = true' aligns the switch to the top vertically with the text."),
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
          child: SwitchListTileExample(),
        ),
      ),
    );
  }
}

class SwitchListTileExample extends StatefulWidget {
  const SwitchListTileExample({super.key});

  @override
  State<SwitchListTileExample> createState() => _SwitchListTileExampleState();
}

class _SwitchListTileExampleState extends State<SwitchListTileExample> {
  bool switchValue1 = true;
  bool switchValue2 = false;
  bool switchValue3 = false;

  String url = 'https://www.youtube.com/watch?v=0igIjvtEWNU';

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
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
              'Properties of SwitchListTile Widget: ',
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
              '2.activeThumbImage\n'
              '3.activeTrackColor\n'
              '4.applyCupertinoTheme\n'
              '5.autofocus\n'
              '6.contentPadding\n'
              '7.controlAffinity\n'
              '8.dense\n'
              '9.dragStartBehavior\n'
              '10.enableFeedback\n'
              '11.focusNode\n'
              '12.hoverColor\n'
              '13.inactiveThumbColor\n'
              '14.inactiveThumbImage\n'
              '15.inactiveTrackColor\n'
              '16.isThreeLine\n'
              '17.materialTapTargetSize\n'
              '18.mouseCursor\n'
              '19.onActiveThumbImageError\n'
              '20.onChanged\n'
              '21.onFocusChange\n'
              '22.onInactiveThumbImageError\n'
              '23.overlayColor\n'
              '24.secondary\n'
              '25.selected\n'
              '26.selectedTileColor\n'
              '27.shape\n'
              '28.splashRadius\n'
              '29.subtitle\n'
              '30.thumbColor\n'
              '31.thumbIcon\n'
              '32.tileColor\n'
              '33.title\n'
              '34.trackColor\n'
              '35.trackOutlineColor\n'
              '36.value\n'
              '37.visualDensity',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1:',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: SwitchListTile(
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
              value: switchValue1,
              onChanged: (bool? value) {
                setState(() {
                  switchValue1 = value!;
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
            padding: EdgeInsets.only(
              top: 18,
              left: 15,
            ),
            child: Text(
              'Example 2:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: SwitchListTile(
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
              value: switchValue2,
              onChanged: (bool? value) {
                setState(() {
                  switchValue2 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                  'Longer supporting text to demonstrate how the text wraps and the switch is centered vertically with the text.'),
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
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: SwitchListTile(
              activeColor: Colors.white,
              activeTrackColor: Colors.black,
              value: switchValue3,
              onChanged: (bool? value) {
                setState(() {
                  switchValue3 = value!;
                });
              },
              title: const Text('Headline'),
              subtitle: const Text(
                  "Longer supporting text to demonstrate how the text wraps and how setting 'SwitchListTile.isThreeLine = true' aligns the switch to the top vertically with the text."),
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
