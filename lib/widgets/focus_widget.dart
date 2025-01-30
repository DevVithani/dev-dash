import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FocusWidget extends StatefulWidget {
  const FocusWidget({super.key});

  @override
  State<FocusWidget> createState() => _FocusWidgetState();
}

class _FocusWidgetState extends State<FocusWidget> {

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
          'Focus',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/focus_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FocusExample extends StatefulWidget {
          const FocusExample({super.key});
        
          @override
          State<FocusExample> createState() => _FocusExampleState();
        }
        
        class _FocusExampleState extends State<FocusExample> {
          int focusedChild = 0;
          List<Widget> children = <Widget>[];
          List<FocusNode> childFocusNodes = <FocusNode>[];
        
          @override
          void initState() {
            super.initState();
            _addChild();
          }
        
          @override
          void dispose() {
            for (final FocusNode node in childFocusNodes) {
        node.dispose();
            }
            super.dispose();
          }
        
          void _addChild() {
            childFocusNodes
          .add(FocusNode(debugLabel: 'Child {children.length}')..requestFocus());  // put dollar symbol before {}
            children.add(
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: ActionChip(
            focusNode: childFocusNodes.last,
            label: Text('Child {children.length}'),   // put dollar symbol before {}
            onPressed: () {},
          ),
        ),
            );
          }
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
        body: Center(
          child: Wrap(
            children: children,
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              focusedChild = children.length;
              _addChild();
            });
          },
          child: const Icon(Icons.add),
        ),
            );
          }
        }''',
          child: FocusExample(),
        ),
      ),
    );
  }
}

class FocusExample extends StatefulWidget {
  const FocusExample({super.key});

  @override
  State<FocusExample> createState() => _FocusExampleState();
}

class _FocusExampleState extends State<FocusExample> {
  int focusedChild = 0;
  List<Widget> children = <Widget>[];
  List<FocusNode> childFocusNodes = <FocusNode>[];

  String url = 'https://youtu.be/JCDfh5bs1xc';

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
    _addChild();
    super.initState();
  }

  @override
  void dispose() {
    for (final FocusNode node in childFocusNodes) {
      node.dispose();
    }
    super.dispose();
  }

  void _addChild() {
    childFocusNodes
        .add(FocusNode(debugLabel: 'Child ${children.length}')..requestFocus());
    children.add(
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: ActionChip(
          focusNode: childFocusNodes.last,
          label: Text('Child ${children.length}'),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                'Properties of Focus Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.autofocus\n'
                '2.canRequestFocus\n'
                '3.child\n'
                '4.debugLabel\n'
                '5.descendantsAreFocusable\n'
                '6.descendantsAreTraversable\n'
                '7.focusNode\n'
                '8.includeSemantics\n'
                '9.onKeyEvent\n'
                '10.parentNode\n'
                '11.skipTraversal',
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
                'Example: Only work on Web',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
            Center(
              child: Wrap(
                children: children,
              ),
            ),
            const Divider(
              thickness: 2,
              height: 50,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            focusedChild = children.length;
            _addChild();
          });
        },
        child: const Icon(Icons.looks_one),
      ),
    );
  }
}
