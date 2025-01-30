import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ShortcutWidget extends StatefulWidget {
  const ShortcutWidget({super.key});

  @override
  State<ShortcutWidget> createState() => _ShortcutWidgetState();
}

class _ShortcutWidgetState extends State<ShortcutWidget> {

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
          'Shortcut',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/shortcut_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          import 'package:flutter/services.dart';
          
          class IncrementIntent extends Intent {
          const IncrementIntent();
        }
        
        class DecrementIntent extends Intent {
          const DecrementIntent();
        }
        
        class ShortcutsExample extends StatefulWidget {
          const ShortcutsExample({super.key});
        
          @override
          State<ShortcutsExample> createState() => _ShortcutsExampleState();
        }
        
        class _ShortcutsExampleState extends State<ShortcutsExample> {
        
          int count = 0;
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Shortcuts(
                  shortcuts: const <ShortcutActivator, Intent>{
                    SingleActivator(LogicalKeyboardKey.arrowUp):
                        IncrementIntent(),
                    SingleActivator(LogicalKeyboardKey.arrowDown):
                        DecrementIntent(),
                  },
                  child: Actions(
                    actions: <Type, Action<Intent>>{
                      IncrementIntent: CallbackAction<IncrementIntent>(
                        onInvoke: (IncrementIntent intent) => setState(() {
                          count = count + 1;
                        }),
                      ),
                      DecrementIntent: CallbackAction<DecrementIntent>(
                        onInvoke: (DecrementIntent intent) => setState(() {
                          count = count - 1;
                        }),
                      ),
                    },
                    child: Focus(
                      autofocus: true,
                      child: Column(
                        children: <Widget>[
                          const Text(
                              'Add to the counter by pressing the up arrow key'),
                          const Text(
                              'Subtract from the counter by pressing the down arrow key'),
                          Text('count: count'),     // put dollar before  : count
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50),
            ),
          ],
        ),
            );
          }
        }''',
          child: ShortcutsExample(),
        ),
      ),
    );
  }
}

class IncrementIntent extends Intent {
  const IncrementIntent();
}

class DecrementIntent extends Intent {
  const DecrementIntent();
}

class ShortcutsExample extends StatefulWidget {
  const ShortcutsExample({super.key});

  @override
  State<ShortcutsExample> createState() => _ShortcutsExampleState();
}

class _ShortcutsExampleState extends State<ShortcutsExample> {

  int count = 0;

  String url = 'https://youtu.be/6ZcQmdoz9N8';

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
              'Properties of Shortcut Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.debugLabel\n'
              '3.manager\n'
              '4.shortcuts',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: This only work on web',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Center(
              child: Shortcuts(
                shortcuts: const <ShortcutActivator, Intent>{
                  SingleActivator(LogicalKeyboardKey.arrowUp):
                      IncrementIntent(),
                  SingleActivator(LogicalKeyboardKey.arrowDown):
                      DecrementIntent(),
                },
                child: Actions(
                  actions: <Type, Action<Intent>>{
                    IncrementIntent: CallbackAction<IncrementIntent>(
                      onInvoke: (IncrementIntent intent) => setState(() {
                        count = count + 1;
                      }),
                    ),
                    DecrementIntent: CallbackAction<DecrementIntent>(
                      onInvoke: (DecrementIntent intent) => setState(() {
                        count = count - 1;
                      }),
                    ),
                  },
                  child: Focus(
                    autofocus: true,
                    child: Column(
                      children: <Widget>[
                        const Text(
                            'Add to the counter by pressing the up arrow key'),
                        const Text(
                            'Subtract from the counter by pressing the down arrow key'),
                        Text('count: $count'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
          ),
        ],
      ),
    );
  }
}
