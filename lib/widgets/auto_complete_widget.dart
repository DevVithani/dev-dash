import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AutocompleteWidget extends StatefulWidget {
  const AutocompleteWidget({super.key});

  static const List<String> listItems = <String>[
    'Apple',
    'WaterMelon',
    'Banana',
    'Lemon',
    'Mango',
    'Tomato',
    'Potato',
  ];

  static const List<String> listLanguages = <String>[
    'Dart',
    'Flutter',
    'Java',
    'Kotlin',
    'Python',
    'C#',
    'Swift',
  ];

  @override
  State<AutocompleteWidget> createState() => _AutocompleteWidgetState();
}

class _AutocompleteWidgetState extends State<AutocompleteWidget> {

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
          'AutoComplete widget',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/auto_complete_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AutoCompleteExample extends StatefulWidget {
          const AutoCompleteExample({super.key});
          
           static const List<String> listItems = <String>[
            'Apple',
            'WaterMelon',
            'Banana',
            'Lemon',
            'Mango',
            'Tomato',
            'Potato',
          ];
          
            static const List<String> listLanguages = <String>[
            'Dart',
            'Flutter',
            'Java',
            'Kotlin',
            'Python',
            'C#',
            'Swift',
          ];
        
          @override
          State<AutoCompleteExample> createState() => _AutoCompleteExampleState();
        }
        
        class _AutoCompleteExampleState extends State<AutoCompleteExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return AutocompleteWidget.listItems.where((String item) {
                    return item.contains(textEditingValue.text.toUpperCase());
                  });
                },
                onSelected: (String item) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(('item Selected ')),   //put dollar symbol before item
                    ),
                  );
                },
              ),
            ),
            
            // Example 2 Code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Autocomplete<String>(
                optionsBuilder: (TextEditingValue textEditingValue) {
                  if (textEditingValue.text == '') {
                    return const Iterable<String>.empty();
                  }
                  return AutocompleteWidget.listLanguages.where((String item) {
                    return item.contains(textEditingValue.text.toUpperCase());
                  });
                },
                onSelected: (String item) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(('item Selected')),     // put dollar symbol before item
                    ),
                  );
                },
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: AutoCompleteExample(),
        ),
      ),
    );
  }
}

class AutoCompleteExample extends StatefulWidget {
  const AutoCompleteExample({super.key});

  @override
  State<AutoCompleteExample> createState() => _AutoCompleteExampleState();
}

class _AutoCompleteExampleState extends State<AutoCompleteExample> {

  String url = 'https://youtu.be/-Nny8kzW380';

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
              'Properties of AutoComplete Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.displayStringForOption\n'
              '2.fieldViewBuilder\n'
              '3.initialValue\n'
              '4.onSelected\n'
              '5.optionsBuilder\n'
              '6.optionsMaxHeight\n'
              '7.optionsViewBuilder\n'
              '8.optionsViewOpenDirection',
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
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '''Example 1: Type below to autocomplete the following possible results: [Apple, WaterMelon, Banana, Lemon, Mango, Tomato, Potato]''',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return AutocompleteWidget.listItems.where((String item) {
                  return item.contains(textEditingValue.text.toUpperCase());
                });
              },
              onSelected: (String item) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(('$item Selected')),
                  ),
                );
              },
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '''Example 2: Type below to autocomplete the following possible results: [Dart, Flutter, Java, Kotlin, Python, C#, C++, C, Swift]''',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Autocomplete<String>(
              optionsBuilder: (TextEditingValue textEditingValue) {
                if (textEditingValue.text == '') {
                  return const Iterable<String>.empty();
                }
                return AutocompleteWidget.listLanguages.where((String item) {
                  return item.contains(textEditingValue.text.toUpperCase());
                });
              },
              onSelected: (String item) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(('$item Selected')),
                  ),
                );
              },
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
