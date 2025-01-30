import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AboutDialogWidget extends StatefulWidget {
  const AboutDialogWidget({super.key});

  @override
  State<AboutDialogWidget> createState() => _AboutDialogWidgetState();
}

class _AboutDialogWidgetState extends State<AboutDialogWidget> {

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
          'About Dialog',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          const Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              codeLinkPrefix: 'https://google.com?q=',
              filePath: 'lib/widgets/about_dialog_widget.dart',
              codeContent: '''
              import 'package:flutter/material.dart';
            
             
             class AboutDialogExample extends StatefulWidget {
              const AboutDialogExample({super.key});
            
              @override
              State<AboutDialogExample> createState() => _AboutDialogExampleState();
            }
            
            class _AboutDialogExampleState extends State<AboutDialogExample> {
              
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 50,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Tap to show'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AboutDialog(
                            applicationIcon: FlutterLogo(
                              size: 50,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  height: 50,
                  thickness: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Tap to show'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AboutDialog(
                            applicationVersion: "version 1.0.0",
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Tap to show'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AboutDialog(
                            applicationName: "DevDash",
                            children: [
                              Text('This is Flutter App'),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text('Tap to show'),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AboutDialog(
                            applicationLegalese: 'Legalese Information...',
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const Divider(
                  thickness: 2,
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text("Tap here to show"),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => const AboutDialog(
                            applicationIcon: FlutterLogo(
                              size: 50,
                            ),
                            applicationLegalese: 'Legalese Information...',
                            applicationName: "DevDash",
                            applicationVersion: "version 1.0.0",
                            children: [
                              Text("Flutter Learning App"),
                            ],
                          ),
                        );
                      },
                    ),
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
}''',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              child: AboutDialogExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AboutDialogExample extends StatefulWidget {
  const AboutDialogExample({super.key});

  @override
  State<AboutDialogExample> createState() => _AboutDialogExampleState();
}

class _AboutDialogExampleState extends State<AboutDialogExample> {

  String url = 'https://www.youtube.com/watch?v=YFCSODyFxbE';

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
              'Properties of AboutDialog Widget:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.applicationIcon\n'
              '2.applicationLegalese\n'
              '3.applicationName\n'
              '4.applicationVersion\n'
              '5.children',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: applicationIcon',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                child: const Text('Tap to show'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                      applicationIcon: FlutterLogo(
                        size: 50,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: applicationVersion',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                child: const Text('Tap to show'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                      applicationVersion: "version 1.0.0",
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: applicationName',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                child: const Text('Tap to show'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                      applicationName: "DevDash",
                      children: [
                        Text('This is Flutter App'),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: applicationLegalese',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                child: const Text('Tap to show'),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                      applicationLegalese: 'Legalese Information...',
                    ),
                  );
                },
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: All Properties of AboutDialog Widget.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                child: const Text("Tap to show"),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => const AboutDialog(
                      applicationIcon: FlutterLogo(
                        size: 50,
                      ),
                      applicationLegalese: 'Legalese Information...',
                      applicationName: "DevDash",
                      applicationVersion: "version 1.0.0",
                      children: [
                        Text("Flutter Learning App"),
                      ],
                    ),
                  );
                },
              ),
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
