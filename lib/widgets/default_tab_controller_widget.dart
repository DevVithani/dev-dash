import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class DefaultTabControllerWidget extends StatefulWidget {
  const DefaultTabControllerWidget({super.key});

  @override
  State<DefaultTabControllerWidget> createState() =>
      _DefaultTabControllerWidgetState();
}

class _DefaultTabControllerWidgetState
    extends State<DefaultTabControllerWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'DefaultTab Controller',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/default_tab_controller_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class DefaultTabExample extends StatefulWidget {
          const DefaultTabExample({super.key});
        
          @override
          State<DefaultTabExample> createState() => _DefaultTabExampleState();
        }
        
        class _DefaultTabExampleState extends State<DefaultTabExample> {
          @override
          Widget build(BuildContext context) {
            return DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            title: const Text(
              'Default TabController',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            backgroundColor: Colors.black,
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Horse'),
                Tab(text: 'Dog'),
                Tab(text: 'Cat'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTF_OiBHvsGVsXfy1RH1dpmwFZxIWSIt6c9GA&s'),
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTt1wkzUIzQ9cpu1d4kv7XjzkTCRHLLXf1RsQ&s'),
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSszHtHXYkShquFKPb8D2MXutGH97YCeajQHQ&s'),
            ],
          ),
        ),
            );
          }
        }''',
          child: DefaultTabExample(),
        ),
      ),
    );
  }
}

class DefaultTabExample extends StatefulWidget {
  const DefaultTabExample({super.key});

  @override
  State<DefaultTabExample> createState() => _DefaultTabExampleState();
}

class _DefaultTabExampleState extends State<DefaultTabExample> {

  String url = 'https://youtu.be/POtoEH-5l40';

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
              'Properties of DefaultTabController Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.animationDuration\n'
              '2.child\n'
              '3.initialIndex\n'
              '4.length',
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
              'Example: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Image.asset('assets/tab_one.png'),
          const Divider(
            thickness: 2,
          ),
          Image.asset('assets/tab_two.png'),
          const Divider(
            thickness: 2,
          ),
          Image.asset('assets/tab_three.png'),
          const Divider(
            thickness: 2,
          ),
        ],
      ),
    );
  }
}
