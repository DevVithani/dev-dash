import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class DraggableScrollableSheetWidget extends StatefulWidget {
  const DraggableScrollableSheetWidget({super.key});

  @override
  State<DraggableScrollableSheetWidget> createState() =>
      _DraggableScrollableSheetWidgetState();
}

class _DraggableScrollableSheetWidgetState
    extends State<DraggableScrollableSheetWidget> {

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
          'DraggableScrollable Sheet',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/dreggable_scrollable_sheet_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class DragExample extends StatefulWidget {
          const DragExample({super.key});
        
          @override
          State<DragExample> createState() => _DragExampleState();
        }
        
        class _DragExampleState extends State<DragExample> {
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: DraggableScrollableSheet(
                builder:
                    (BuildContext context, ScrollController scrollController) {
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        child: ListTile(
                          title: Text('Item {index + 1}'),     // put dollar symbol before {}
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: DragExample(),
        ),
      ),
    );
  }
}

class DragExample extends StatefulWidget {
  const DragExample({super.key});

  @override
  State<DragExample> createState() => _DragExampleState();
}

class _DragExampleState extends State<DragExample> {

  String url = 'https://youtu.be/Hgw819mL_78';

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
              'Properties of DraggableScrollableSheet Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.builder\n'
              '2.controller\n'
              '3.expand\n'
              '4.initialChildSize\n'
              '5.maxChildSize\n'
              '6.minChildSize\n'
              '7.shouldCloseOnMinExtent\n'
              '8.snap\n'
              '9.snapAnimationDuration\n'
              '10.snapSizes',
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
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: DraggableScrollableSheet(
              builder:
                  (BuildContext context, ScrollController scrollController) {
                return ListView.builder(
                  controller: scrollController,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text('Item ${index + 1}'),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
