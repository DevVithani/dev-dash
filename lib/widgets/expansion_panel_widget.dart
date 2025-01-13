import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ExpansionPanelWidget extends StatefulWidget {
  const ExpansionPanelWidget({super.key});

  @override
  State<ExpansionPanelWidget> createState() => _ExpansionPanelWidgetState();
}

class _ExpansionPanelWidgetState extends State<ExpansionPanelWidget> {

  String url = 'https://www.youtube.com/watch?v=2aJZzRMziJc';

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
          'Expansion Panel',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
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
              filePath: 'lib/widgets/expansion_panel_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
                import 'package:flutter/material.dart';
              
              class Item {
              Item({
                required this.expandedValue,
                required this.headerValue,
                this.isExpanded = false,
              });
            
              String expandedValue;
              String headerValue;
              bool isExpanded;
            }
            
            List<Item> generateItems(int numberOfItems) {
              return List<Item>.generate(numberOfItems, (int index) {
                return Item(
            headerValue: 'Panel {index + 1}',   //put dollar symbol before {}
            expandedValue: 'This is item number {index + 1}',  //put dollar symbol before {}
                );
              });
            }
            
            class ExpansionPanelListExample extends StatefulWidget {
              const ExpansionPanelListExample({super.key});
            
              @override
              State<ExpansionPanelListExample> createState() =>
            _ExpansionPanelListExampleState();
            }
            
            class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
              final List<Item> _data = generateItems(8);
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            child: Container(
              child: _buildPanel(),
            ),
                );
              }
            
              Widget _buildPanel() {
                return ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _data[index].isExpanded = isExpanded;
              });
            },
            children: _data.map<ExpansionPanel>((Item item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    title: Text(item.headerValue),
                  );
                },
                body: ListTile(
                    title: Text(item.expandedValue),
                    subtitle:
                        const Text('To delete this panel, tap the trash can icon'),
                    trailing: const Icon(Icons.delete),
                    onTap: () {
                      setState(() {
                        _data.removeWhere((Item currentItem) => item == currentItem);
                      });
                    }),
                isExpanded: item.isExpanded,
              );
            }).toList(),
                );
              }
            }''',
              child: ExpansionPanelListExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class Item {
  Item({
    required this.expandedValue,
    required this.headerValue,
    this.isExpanded = false,
  });

  String expandedValue;
  String headerValue;
  bool isExpanded;
}

List<Item> generateItems(int numberOfItems) {
  return List<Item>.generate(numberOfItems, (int index) {
    return Item(
      headerValue: 'Panel ${index + 1}',
      expandedValue: 'This is item number ${index + 1}',
    );
  });
}

class ExpansionPanelListExample extends StatefulWidget {
  const ExpansionPanelListExample({super.key});

  @override
  State<ExpansionPanelListExample> createState() =>
      _ExpansionPanelListExampleState();
}

class _ExpansionPanelListExampleState extends State<ExpansionPanelListExample> {
  final List<Item> _data = generateItems(8);

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
              'Properties of ExpansionPanelList Widget: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.animationDuration\n'
              '2.children\n'
              '3.dividerColor\n'
              '4.elevation\n'
              '5.expandedHeaderPadding\n'
              '6.expandedIconColor\n'
              '7.expansionCallback\n'
              '8.initialOpenPanelValue\n'
              '9.materialGapSize',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 20, left: 15),
            child: Text(
              'Example: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 17),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Container(
              child: _buildPanel(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPanel() {
    return ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          _data[index].isExpanded = isExpanded;
        });
      },
      children: _data.map<ExpansionPanel>((Item item) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              title: Text(item.headerValue),
            );
          },
          body: ListTile(
              title: Text(item.expandedValue),
              subtitle:
                  const Text('To delete this panel, tap the trash can icon'),
              trailing: const Icon(Icons.delete),
              onTap: () {
                setState(() {
                  _data.removeWhere((Item currentItem) => item == currentItem);
                });
              }),
          isExpanded: item.isExpanded,
        );
      }).toList(),
    );
  }
}
