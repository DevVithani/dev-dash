import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SliverGridWidget extends StatefulWidget {
  const SliverGridWidget({super.key});

  @override
  State<SliverGridWidget> createState() => _SliverGridWidgetState();
}

class _SliverGridWidgetState extends State<SliverGridWidget> {

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
          'SliverGrid',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/sliver_grid_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class SliverGridExample extends StatefulWidget {
          const SliverGridExample({super.key});
        
          @override
          State<SliverGridExample> createState() => _SliverGridExampleState();
        }
        
        class _SliverGridExampleState extends State<SliverGridExample> {
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
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.blue[100 * (index % 9 + 1)],
                child: Text('Item {index + 1}'),      // put dollar symbol before {}
              );
            }, childCount: 10),
          ),
          // Example 2 code
          
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            delegate:
            SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                alignment: Alignment.center,
                color: Colors.yellow[100 * (index % 9 + 1)],
                child: Text('Item {index + 1}'),   // put dollar symbol before {}
              );
            }, childCount: 10),
          ),
        ],
            );
          }
        }''',
          child: SliverGridExample(),
        ),
      ),
    );
  }
}

class SliverGridExample extends StatefulWidget {
  const SliverGridExample({super.key});

  @override
  State<SliverGridExample> createState() => _SliverGridExampleState();
}

class _SliverGridExampleState extends State<SliverGridExample> {

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
                    'Property of SliverGrid Widget: ',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    '1.delegate\n'
                    '2.gridDelegate',
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
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                ),
              ],
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 2,
            crossAxisSpacing: 2,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.yellow,
              child: Text('Item ${index + 1}'),
            );
          }, childCount: 10),
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
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          delegate:
              SliverChildBuilderDelegate((BuildContext context, int index) {
            return Container(
              alignment: Alignment.center,
              color: Colors.blue[100 * (index % 9 + 1)],
              child: Text('Item ${index + 1}'),
            );
          }, childCount: 10),
        ),
      ],
    );
  }
}
