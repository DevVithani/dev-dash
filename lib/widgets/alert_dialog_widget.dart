import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AlertDialogWidget extends StatefulWidget {
  const AlertDialogWidget({super.key});

  @override
  State<AlertDialogWidget> createState() => _AlertDialogWidgetState();
}

class _AlertDialogWidgetState extends State<AlertDialogWidget> {

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
          'Alert Dialog',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/alert_dialog_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class AlertDialogExample extends StatefulWidget {
          const AlertDialogExample({super.key});
        
          @override
          State<AlertDialogExample> createState() => _AlertDialogExampleState();
        }
        
        class _AlertDialogExampleState extends State<AlertDialogExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: const Text('Close'),
                          ),
                        ],
                        title: const Text('Login Required'),
                        contentPadding: const EdgeInsets.all(20.0),
                        content: const Text(
                          'Please login for look at your Products',
                        ),
                      ),
                    );
                  },
                  child: const Text('Products'),
          ),
        ),
      ),
              ],
            ),
          );
        }
      }''',
          child: AlertDialogExample(),
        ),
      ),
    );
  }
}

class AlertDialogExample extends StatefulWidget {
  const AlertDialogExample({super.key});

  @override
  State<AlertDialogExample> createState() => _AlertDialogExampleState();
}

class _AlertDialogExampleState extends State<AlertDialogExample> {

  String url = 'https://www.youtube.com/watch?v=75CsnyRXf5I';

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
              'Properties of AlertDialog Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.actions\n'
              '2.actionsAlignment\n'
              '3.actionsOverflowAlignment\n'
              '4.actionOverflowButtonSpacing\n'
              '5.actionsOverflowDirection\n'
              '6.actionsPadding\n'
              '7.alignment\n'
              '8.backgroundColor\n'
              '9.buttonPadding\n'
              '10.clipBehavior\n'
              '11.content\n'
              '12.contentPadding\n'
              '13.contentTextStyle\n'
              '14.elevation\n'
              '15.icon\n'
              '16.iconColor\n'
              '17.iconPadding\n'
              '18.insertPadding\n'
              '19.scrollable\n'
              '20.semanticLabel\n'
              '21.shadowColor\n'
              '22.shape\n'
              '23.surfaceTintColor\n'
              '24.title\n'
              '25.titlePadding\n'
              '26.titleTextStyle',
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
              'Example 1:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                      title: const Text('Login Required'),
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text(
                        'Please login for look at your Products',
                      ),
                    ),
                  );
                },
                child: const Text('Products'),
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
              'Example 2:',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Close'),
                        ),
                      ],
                      title: const Text('Server busy'),
                      contentPadding: const EdgeInsets.all(20.0),
                      content: const Text(
                        'Try again after Some time...',
                      ),
                    ),
                  );
                },
                child: const Text('Purchase'),
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
