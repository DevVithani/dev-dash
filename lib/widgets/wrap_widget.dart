import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class WrapWidget extends StatefulWidget {
  const WrapWidget({super.key});

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  String url = 'https://www.youtube.com/watch?v=z5iw2SeFx2M';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Wrap',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: YoutubePlayer(
              controller: controller!,
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
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
            import 'package:flutter/material.dart';
            
                class WrapWidget extends StatefulWidget {
              const WrapWidget({super.key});
            
              @override
              State<WrapWidget> createState() => _WrapWidgetState();
            }
            
            class _WrapWidgetState extends State<WrapWidget> {
            
            
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
                'Wrap Widget',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            body WrapWidgetExample(),
            ),
                );
              }
            }
            
            class WrapWidgetExample extends StatefulWidget {
              const WrapWidgetExample({super.key});
            
              @override
              State<WrapWidgetExample> createState() => _WrapWidgetExampleState();
            }
            
            class _WrapWidgetExampleState extends State<WrapWidgetExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: <Widget>[
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('1')),
                      label: const Text('Hamilton'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('2')),
                      label: const Text('Lafayette'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('3')),
                      label: const Text('Mulligan'),
                    ),
                    Chip(
                      avatar: CircleAvatar(
                          backgroundColor: Colors.blue.shade900,
                          child: const Text('4')),
                      label: const Text('Laurens'),
                    ),
                  ],
                ),
              ],
            ),
                );
              }
            },
            
             // Example 2 code
             
             class WrapW extends StatelessWidget {
              @override
              Widget build(BuildContext context) {
                return Scaffold(
            appBar:AppBar(
            backgroundColor: Colors.black,
              title: Text("Wrap Widget"),
            ),
            body: Wrap(
              children: <Widget>[
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 100,
                  child:Center(child: Text("W1",))
                ),
                Container(
                  color: Colors.red,
                  width: 100,
                  height: 100,
                  child:Center(child: Text("W2",))
                ),
                Container(
                  color: Colors.teal,
                  width: 100,
                  height: 100,
                  child:Center(child: Text("W3",))
                ),
                Container(
                  color: Colors.indigo,
                  width: 100,
                  height: 100,
                  child:Center(child: Text("W4",))
                ),
                Container(
                  color: Colors.orange,
                  width: 100,
                  height: 100,
                  child:Center(child: Text("W5",))
                ),
              ],
            ),
                );
              }
            }''',
              labelBackgroundColor: Colors.black,
              filePath: 'lib/widgets/wrap_widget.dart',
              child: WrapWidgetExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class WrapWidgetExample extends StatefulWidget {
  const WrapWidgetExample({super.key});

  @override
  State<WrapWidgetExample> createState() => _WrapWidgetExampleState();
}

class _WrapWidgetExampleState extends State<WrapWidgetExample> {
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
              'Properties of Wrap Widget:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.direction\n'
              '2.alignment\n'
              '3.spacing\n'
              '4.runAlignment\n'
              '5.runSpacing\n'
              '6.WrapCrossAlignment\n'
              '7.textDirection\n'
              '8.verticalDirection\n',
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
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
          ),
          Wrap(
            spacing: 8.0,
            runSpacing: 4.0,
            children: <Widget>[
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('1', style: TextStyle(color: Colors.white),),),
                label: const Text('Hamilton'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('2', style: TextStyle(color: Colors.white),),),
                label: const Text('Lafayette'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('3', style: TextStyle(color: Colors.white),),),
                label: const Text('Mulligan'),
              ),
              Chip(
                avatar: CircleAvatar(
                    backgroundColor: Colors.blue.shade900,
                    child: const Text('4', style: TextStyle(color: Colors.white),),),
                label: const Text('Laurens'),
              ),
            ],
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Image.asset('assets/wrap_widget.png'),
          ),
        ],
      ),
    );
  }
}
