import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ListTileWidget extends StatefulWidget {
  const ListTileWidget({super.key});

  @override
  State<ListTileWidget> createState() => _ListTileWidgetState();
}

class _ListTileWidgetState extends State<ListTileWidget> {

  String videoUrl = 'https://www.youtube.com/watch?v=l8dj0yPBvgQ';
  YoutubePlayerController? _controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoUrl);

    _controller = YoutubePlayerController(
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
    _controller?.dispose();
    super.dispose();
  }

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
          'ListTile',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: _controller!,
              showVideoProgressIndicator: true,
              progressColors: const ProgressBarColors(
                backgroundColor: Colors.white,
                handleColor: Colors.black,
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: WidgetWithCodeView(
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              filePath: 'lib/widgets/list_tile_widget.dart',
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
            class ListTileExample extends StatefulWidget {
                const ListTileExample({super.key});
            
              @override
              State<ListTileExample> createState() => _ListTileExampleState();
            }
            
            class _ListTileExampleState extends State<ListTileExample> {
            
              @override
              Widget build(BuildContext context) {
                return ListView(
            children: <Widget>[
              
              // Example 1 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    title: Text('One-line ListTile'),
                  ),
                ),
              ),
              
              // Example 2 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('One-line with leading widget'),
                  ),
                ),
              ),
              
              // Example 3 code
              
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    title: Text('One-line with trailing widget'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
              
              // Example 4 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(),
                    title: Text('One-line with both widgets'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
              
              // Example 5 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    title: Text('One-line dense ListTile'),
                    dense: true,
                  ),
                ),
              ),
              
              //Example 6 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 56.0),
                    title: Text('Two-line ListTile'),
                    subtitle: Text('Here is a second line'),
                    trailing: Icon(Icons.more_vert),
                  ),
                ),
              ),
             
             // Example 7 code
              const Padding(
                padding: EdgeInsets.only(top: 18),
                child: Card(
                  child: ListTile(
                    leading: FlutterLogo(size: 72.0),
                    title: Text('Three-line ListTile'),
                    subtitle:
                        Text('A sufficiently long subtitle warrants three lines.'),
                    trailing: Icon(Icons.more_vert),
                    isThreeLine: true,
                  ),
                ),
              ),
            ],
                );
              }
            }''',
              child: ListTileExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class ListTileExample extends StatefulWidget {
  const ListTileExample({super.key});

  @override
  State<ListTileExample> createState() => _ListTileExampleState();
}

class _ListTileExampleState extends State<ListTileExample> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            'Properties of ListTile Widget: ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            '1.autofocus\n'
            '2.contentPadding\n'
            '3.dense\n'
            '4.enabled\n'
            '5.enableFeedback\n'
            '6.focusColor\n'
            '7.focusNode\n'
            '8.horizontalTitleGap\n'
            '9.hoverColor\n'
            '10.iconColor\n'
            '11.isThreeLine\n'
            '12.leading\n'
            '13.leadingAndTrailingTextStyle\n'
            '14.minLeadingWidth\n'
            '15.minTileHeight\n'
            '16.minVerticalPadding\n'
            '17.mouseCursor\n'
            '18.onFocusChange\n'
            '19.onLongPress\n'
            '20.onTap\n'
            '21.selected\n'
            '22.selectedColor\n'
            '23.selectedTileColor\n'
            '24.shape\n'
            '25.splashColor\n'
            '26.style\n'
            '27.subtitle\n'
            '28.subtitleTextStyle\n'
            '29.textColor\n'
            '30.tileColor\n'
            '31.title\n'
            '32.titleAlignment\n'
            '33.titleTextStyle\n'
            '34.titleTextStyle\n'
            '35.trailing',
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
            'Example 1: One line ListTile',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              title: Text('One-line ListTile'),
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
            'Example 2: One Line with leading Widget.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with leading widget'),
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
            'Example 3: One Line with trailing Widget.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              title: Text('One-line with trailing widget'),
              trailing: Icon(Icons.more_vert),
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
            'Example 4: One Line with both Widgets.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              leading: FlutterLogo(),
              title: Text('One-line with both widgets'),
              trailing: Icon(Icons.more_vert),
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
            'Example 5: One Line dense ListTile.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              title: Text('One-line dense ListTile'),
              dense: true,
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
            'Example 6: Two Line ListTile.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              leading: FlutterLogo(size: 56.0),
              title: Text('Two-line ListTile'),
              subtitle: Text('Here is a second line'),
              trailing: Icon(Icons.more_vert),
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
            'Example 7: Three Line ListTile.',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.w600),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18),
          child: Card(
            child: ListTile(
              leading: FlutterLogo(size: 72.0),
              title: Text('Three-line ListTile'),
              subtitle:
                  Text('A sufficiently long subtitle warrants three lines.'),
              trailing: Icon(Icons.more_vert),
              isThreeLine: true,
            ),
          ),
        ),
        const Divider(
          height: 50,
          thickness: 2,
        ),
      ],
    );
  }
}
