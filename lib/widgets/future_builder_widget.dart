import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FutureBuilderWidget extends StatefulWidget {
  const FutureBuilderWidget({super.key});

  @override
  State<FutureBuilderWidget> createState() => _FutureBuilderWidgetState();
}

class _FutureBuilderWidgetState extends State<FutureBuilderWidget> {

  String url = 'https://youtu.be/zEdw_1B7JHY';

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
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
          title: const Text(
            'FutureBuilder',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
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
                filePath: 'lib/widgets/future_builder_widget.dart',
                iconBackgroundColor: Colors.black,
                iconForegroundColor: Colors.white,
                codeLinkPrefix: 'https://google.com?q=',
                codeContent: '''
              import 'package:flutter/material.dart';
                
                class FutureDemo extends StatelessWidget {
                Future getData() {
                  return Future.delayed(
                    const Duration(seconds: 2),
                    () {
              return "Refreshed Data";
                    },
                  );
                }
              
                const FutureDemo({super.key});
              
                @override
                Widget build(BuildContext context) {
                  return SafeArea(
                    child: Scaffold(
              appBar: AppBar(
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () => Navigator.of(context).pop(),
                ),
                backgroundColor: Colors.black,
                title: const Text(
                  'Refreshed Data',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              body: FutureBuilder(
                builder: (ctx, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                          '{snapshot.error} occurred',    // put dollar symbol before {}
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    } else if (snapshot.hasData) {
                      final data = snapshot.data;
                      return Center(
                        child: Text(
                          data,
                          style: const TextStyle(fontSize: 18),
                        ),
                      );
                    }
                  }
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                },
                future: getData(),
              ),
                    ),
                  );
                }
              }
              
              class FutureBuilderExample extends StatefulWidget {
                const FutureBuilderExample({super.key});
              
                @override
                State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
              }
              
              class _FutureBuilderExampleState extends State<FutureBuilderExample> {
                @override
                Widget build(BuildContext context) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (ctx) => const FutureDemo(),
                      ),
                    ),
                    child: const Text("Click to Refresh"),
                  ),
                ),
              ],
                    ),
                  );
                }
              }''',
                child: FutureBuilderExample(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FutureDemo extends StatelessWidget {
  Future getData() {
    return Future.delayed(
      const Duration(seconds: 2),
      () {
        return "Refreshed Data";
      },
    );
  }

  const FutureDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Colors.black,
          title: const Text(
            'Refreshed Data',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(
                    '${snapshot.error} occurred',
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              } else if (snapshot.hasData) {
                final data = snapshot.data;
                return Center(
                  child: Text(
                    data,
                    style: const TextStyle(fontSize: 18),
                  ),
                );
              }
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          },
          future: getData(),
        ),
      ),
    );
  }
}

class FutureBuilderExample extends StatefulWidget {
  const FutureBuilderExample({super.key});

  @override
  State<FutureBuilderExample> createState() => _FutureBuilderExampleState();
}

class _FutureBuilderExampleState extends State<FutureBuilderExample> {

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
              'Properties of FutureBuilder Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.builder\n'
              '2.future\n'
              '3.initialData',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: Tap on Refresh Button.',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => const FutureDemo(),
                  ),
                ),
                child: const Text("Refresh"),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
