import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SliverListWidget extends StatefulWidget {
  const SliverListWidget({super.key});

  @override
  State<SliverListWidget> createState() => _SliverListWidgetState();
}

class _SliverListWidgetState extends State<SliverListWidget> {

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
          'SliverList',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/sliver_list_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class SliverListExample extends StatefulWidget {
          const SliverListExample({super.key});
        
          @override
          State<SliverListExample> createState() => _SliverListExampleState();
        }
        
          class _SliverListExampleState extends State<SliverListExample> {
        
          @override
          Widget build(BuildContext context) {
            return CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [        
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item {index + 1}'),    // put dollar symbol before {}.
                  tileColor: Colors.blue[100 * (index % 9 + 1)],
                );
              },
              childCount: 10,
            ),
          ),
          // Example 2 Code
          
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return ListTile(
                  title: Text('Item {index + 1}'),   // put dollar symbol before {}
                  tileColor: Colors.red[100 * (index % 9 + 1)],
                );
              },
              childCount: 10,
            ),
          ),
        ],
            );
          }
        }''',
          child: SliverListExample(),
        ),
      ),
    );
  }
}

class SliverListExample extends StatefulWidget {
  const SliverListExample({super.key});

  @override
  State<SliverListExample> createState() => _SliverListExampleState();
}

class _SliverListExampleState extends State<SliverListExample> {

  String url = 'https://www.youtube.com/watch?v=ORiTTaVY6mM';

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
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: SingleChildScrollView(
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
                    'Property of SliverList Widget: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    '1.delegate',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 15),
                  child: Text(
                    'Example 1: ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.blue,
                        fontSize: 17),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                ),
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  title: Text('Item ${index + 1}'),
                  tileColor: Colors.red,
                ),
              );
            },
            childCount: 10,
          ),
        ),
        const SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Divider(
                thickness: 2,
                height: 50,
              ),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Example 2: ',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                      fontSize: 17),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 18),
              ),
            ],
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              return ListTile(
                title: Text('Item ${index + 1}'),
                tileColor: Colors.blue[100 * (index % 9 + 1)],
              );
            },
            childCount: 10,
          ),
        ),
      ],
    );
  }
}
