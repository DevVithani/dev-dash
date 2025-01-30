import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class DropDownButtonWidget extends StatefulWidget {
  const DropDownButtonWidget({super.key});

  @override
  State<DropDownButtonWidget> createState() => _DropDownButtonWidgetState();
}

class _DropDownButtonWidgetState extends State<DropDownButtonWidget> {

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
          'DropDown Button',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/drop_down_button_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class DropDownButtonExample extends StatefulWidget {
          const DropDownButtonExample({super.key});
        
          @override
          State<DropDownButtonExample> createState() => _DropDownButtonExampleState();
        }
        
        class _DropDownButtonExampleState extends State<DropDownButtonExample> {
          static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
           static const List<String> listTwo = <String>[
            'Flutter',
            'Java',
            'Python',
            'C++'
          ];
        
          String dropdownValue = list.first;
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 Code
          
            Center(
              child: DropdownMenu<String>(
                initialSelection: list.first,
                onSelected: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    list.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
            
            // Example 2 Code
            
            Center(
              child: DropdownMenu<String>(
                label: const Text('Select'),
                initialSelection: listTwo.first,
                onSelected: (String? value) {
                  setState(() {
                    dropdownValue = value!;
                  });
                },
                dropdownMenuEntries:
                    listTwo.map<DropdownMenuEntry<String>>((String value) {
                  return DropdownMenuEntry<String>(value: value, label: value);
                }).toList(),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: DropDownButtonExample(),
        ),
      ),
    );
  }
}

class DropDownButtonExample extends StatefulWidget {
  const DropDownButtonExample({super.key});

  @override
  State<DropDownButtonExample> createState() => _DropDownButtonExampleState();
}

class _DropDownButtonExampleState extends State<DropDownButtonExample> {
  static const List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  static const List<String> listTwo = <String>[
    'Flutter',
    'Java',
    'Python',
    'C++'
  ];

  String dropdownValue = list.first;

  String url = 'https://www.youtube.com/watch?v=ZzQ_PWrFihg';

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
              'Properties of DropDownButton Widget: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.autofocus\n'
              '3.borderRadius\n'
              '4.disabledHint\n'
              '5.dropdownColor\n'
              '6.elevation\n'
              '7.enableFeedback\n'
              '8.focusColor\n'
              '9.focusNode\n'
              '10.hint\n'
              '11.icon\n'
              '12.iconDisabledColor\n'
              '13.iconEnabledColor\n'
              '14.iconSize\n'
              '15.isDense\n'
              '16.isExpanded\n'
              '17.itemHeight\n'
              '18.items\n'
              '19.menuMaxHeight\n'
              '20.menuWidth\n'
              '21.onChanged\n'
              '22.onTap\n'
              '23.padding\n'
              '24.selectedItemBuilder\n'
              '25.style\n'
              '26.underline\n'
              '27.value',
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
          Center(
            child: DropdownMenu<String>(
              initialSelection: list.first,
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  list.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: DropdownMenu<String>(
              label: const Text('Select'),
              initialSelection: listTwo.first,
              onSelected: (String? value) {
                setState(() {
                  dropdownValue = value!;
                });
              },
              dropdownMenuEntries:
                  listTwo.map<DropdownMenuEntry<String>>((String value) {
                return DropdownMenuEntry<String>(value: value, label: value);
              }).toList(),
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
