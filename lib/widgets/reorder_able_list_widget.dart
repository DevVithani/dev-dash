import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ReOrderAbleListWidget extends StatefulWidget {
  const ReOrderAbleListWidget({super.key});

  @override
  State<ReOrderAbleListWidget> createState() => _ReOrderAbleListWidgetState();
}

class _ReOrderAbleListWidgetState extends State<ReOrderAbleListWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'ReorderAble List',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: "lib/widgets/reorder_able_list_widget.dart",
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ReorderExample extends StatefulWidget {
          const ReorderExample({super.key});
        
          @override
          State<ReorderExample> createState() => _ReorderExampleState();
        }
        
        class _ReorderExampleState extends State<ReorderExample> {
          List<String> item = [
            "Java",
            "Flutter",
            "Developer",
            "Android",
            "Programming",
            "C++",
            "Python",
            "javascript",
            "Apple",
            "Google"
          ];
        
          void sorting() {
            setState(() {
        item.sort();
            });
          }
        
          void recorderData(int oldIndex, int newIndex) {
            setState(() {
        if (newIndex > oldIndex) {
          newIndex -= 1;
        }
        final items = item.removeAt(oldIndex);
        item.insert(newIndex, items);
            });
          }
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ReorderableListView(
                onReorder: recorderData,
                children: [
                  for (final items in item)
                    Card(
                      color: Colors.white,
                      key: Key(items),
                      elevation: 2,
                      child: ListTile(
                        title: Text(items),
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
          child: ReorderExample(),
        ),
      ),
    );
  }
}

class ReorderExample extends StatefulWidget {
  const ReorderExample({super.key});

  @override
  State<ReorderExample> createState() => _ReorderExampleState();
}

class _ReorderExampleState extends State<ReorderExample> {
  List<String> item = [
    "Java",
    "Flutter",
    "Developer",
    "Android",
    "Programming",
    "C++",
    "Python",
    "javascript",
    "Apple",
    "Google"
  ];

  void sorting() {
    setState(() {
      item.sort();
    });
  }

  void recorderData(int oldIndex, int newIndex) {
    setState(() {
      if (newIndex > oldIndex) {
        newIndex -= 1;
      }
      final items = item.removeAt(oldIndex);
      item.insert(newIndex, items);
    });
  }

  String url = 'https://youtu.be/3fB1mxOsqJE';

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
      clipBehavior: Clip.none,
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
              'Properties of ReorderAbleListView Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.anchor\n'
              '2.autoScrollerVelocityScalar\n'
              '3.buildDefaultDragHandles\n'
              '4.cacheExtent\n'
              '5.clipBehavior\n'
              '6.dragStartBehavior\n'
              '7.footer\n'
              '8.header\n'
              '9.itemBuilder\n'
              '10.itemCount\n'
              '11.itemExtent\n'
              '12.itemExtentBuilder\n'
              '13.keyboardDismissBehavior\n'
              '14.onReorder\n'
              '15.onReorderEnd\n'
              '16.onReorderStart\n'
              '17.padding\n'
              '18.physics\n'
              '19.primary\n'
              '20.prototypeItem\n'
              '21.proxyDecorator\n'
              '22.restorationId\n'
              '23.reverse\n'
              '24.scrollController\n'
              '25.scrollDirection\n'
              '26.shrinkWrap',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: ',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: ReorderableListView(
              onReorder: recorderData,
              children: [
                for (final items in item)
                  Card(
                    color: Colors.white,
                    key: Key(items),
                    elevation: 2,
                    child: ListTile(
                      title: Text(items),
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
