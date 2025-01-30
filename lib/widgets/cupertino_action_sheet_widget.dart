import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class CupertinoActionSheetWidget extends StatefulWidget {
  const CupertinoActionSheetWidget({super.key});

  @override
  State<CupertinoActionSheetWidget> createState() => _CupertinoActionSheetWidgetState();
}

class _CupertinoActionSheetWidgetState extends State<CupertinoActionSheetWidget> {

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        leading: IconButton(
          icon: const Icon(CupertinoIcons.back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        middle: const Text(
          'CupertinoActionSheet',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      child: const Scaffold(
        body: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              filePath: 'lib/widgets/cupertino_action_sheet_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/cupertino.dart';
            
              class CupertinoActionExample extends StatefulWidget {
            const CupertinoActionExample({super.key});
                    
            @override
            State<CupertinoActionExample> createState() => _CupertinoActionExampleState();
                    }
                    
                    class _CupertinoActionExampleState extends State<CupertinoActionExample> {
            void _showActionSheet(BuildContext context) {
                    showCupertinoModalPopup<void>(
            context: context,
            builder: (BuildContext context) => CupertinoActionSheet(
              title: const Text('Title'),
              message: const Text('Message'),
              actions: <CupertinoActionSheetAction>[
                CupertinoActionSheetAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Default Action'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Action'),
                ),
                CupertinoActionSheetAction(
                  isDestructiveAction: true,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Destructive Action'),
                ),
              ],
            ),
                    );
            }
                    
            @override
            Widget build(BuildContext context) {
                    return CupertinoPageScaffold(
            navigationBar: const CupertinoNavigationBar(
              middle: Text('CupertinoActionSheet Sample'),
            ),
            child: Center(
              child: CupertinoButton(
                onPressed: () => _showActionSheet(context),
                child: const Text('CupertinoActionSheet'),
              ),
            ),
                    );
            }
                    }''',
              child: CupertinoActionExample(),
            ),
          ),
        ),
      ),
    );
  }
}

class CupertinoActionExample extends StatefulWidget {
  const CupertinoActionExample({super.key});

  @override
  State<CupertinoActionExample> createState() => _CupertinoActionExampleState();
}

class _CupertinoActionExampleState extends State<CupertinoActionExample> {

  String url = 'https://youtu.be/U-ao8p4A82k';

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

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('DevDash'),
        message: const Text('Are you sure'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('App info'),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Storage'),
          ),
          CupertinoActionSheetAction(
            isDestructiveAction: true,
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
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
              'Properties of CupertinoActionSheet Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.actions\n'
              '2.actionScrollController\n'
              '3.cancelButton\n'
              '4.message\n'
              '5.messageScrollController\n'
              '6.title\n',
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
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: CupertinoButton(
              onPressed: () => _showActionSheet(context),
              child: Container(
                height: 50,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('Delete')),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
