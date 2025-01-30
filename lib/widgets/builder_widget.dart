import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class BuilderWidget extends StatefulWidget {
  const BuilderWidget({super.key});

  @override
  State<BuilderWidget> createState() => _BuilderWidgetState();
}

class _BuilderWidgetState extends State<BuilderWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Builder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/builder_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class BuilderExample extends StatefulWidget {
          const BuilderExample({super.key});
        
          @override
          State<BuilderExample> createState() => _BuilderExampleState();
        }
        
        class _BuilderExampleState extends State<BuilderExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            // Example 1 Code
            
            Center(
              child: Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Button Pressed!')),
                      );
                    },
                    child: const Text('Show Snack bar'),
                  );
                },
              ),
            ),
            
            // Example 2 Code
            
            Center(
              child: Builder(
                builder: (BuildContext context) {
                  return Center(
                    child: TextButton(
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Has Appbar')),
                        );
                      },
                      child: const Text('hasAppBar'),
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
          child: BuilderExample(),
        ),
      ),
    );
  }
}

class BuilderExample extends StatefulWidget {
  const BuilderExample({super.key});

  @override
  State<BuilderExample> createState() => _BuilderExampleState();
}

class _BuilderExampleState extends State<BuilderExample> {

  String url = 'https://youtu.be/xXNOkIuSYuA';

  YoutubePlayerController? controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(url);

    controller = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
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
              'Property of Builder Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.builder',
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
              'Example 1: ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Builder(
              builder: (BuildContext context) {
                return ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Button Pressed!')),
                    );
                  },
                  child: const Text('Show Snack bar'),
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
              'Example 2: ',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Center(
            child: Builder(
              builder: (BuildContext context) {
                return Center(
                  child: TextButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Has Appbar')),
                      );
                    },
                    child: const Text('hasAppBar'),
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
