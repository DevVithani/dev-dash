import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  String selectPage = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            children: [
              DrawerHeader(
                padding: EdgeInsets.zero,
                child: Container(
                  color: Colors.white,
                  padding: const EdgeInsets.all(5),
                  child: const Text(
                    'Drawer Header',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Profile',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.file_download,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Download',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.upload,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Upload',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.star,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Favorite',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.save,
                    color: Colors.white,
                  ),
                  title: const Text(
                    'Saved',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Divider(),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'LogOut',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              Card(
                color: Colors.black,
                child: ListTile(
                  onTap: () {},
                  leading: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                  title: const Text(
                    'Delete account',
                    style: TextStyle(
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.black,
        title: const Text(
          'Drawer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/drawer_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class DrawerExample extends StatefulWidget {
          const DrawerExample({super.key});
        
          @override
          State<DrawerExample> createState() => _DrawerExampleState();
        }
        
        class _DrawerExampleState extends State<DrawerExample> {
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Scaffold(
              drawer: Drawer(
                child: Container(
                  color: Colors.black,
                  child: ListView(
                    children: [
                      DrawerHeader(
                        padding: EdgeInsets.zero,
                        child: Container(
                          color: Colors.white,
                          padding: const EdgeInsets.all(5),
                          child: const Text(
                            'Drawer Header',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ),
                      ),
                      Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Profile',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.file_download,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Download',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.upload,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Upload',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.star,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Favorite',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.save,
                      color: Colors.white,
                    ),
                    title: const Text(
                      'Saved',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const Divider(),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'LogOut',
                      style: TextStyle(
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Card(
                  color: Colors.black,
                  child: ListTile(
                    onTap: () {},
                    leading: const Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                    title: const Text(
                      'Delete account',
                      style: TextStyle(
                        color: Colors.red,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: DrawerExample(),
        ),
      ),
    );
  }
}

class DrawerExample extends StatefulWidget {
  const DrawerExample({super.key});

  @override
  State<DrawerExample> createState() => _DrawerExampleState();
}

class _DrawerExampleState extends State<DrawerExample> {

  String url = 'https://youtu.be/WRj86iHihgY';

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
              'Properties of Drawer Widget: ',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.backgroundColor\n'
              '2.child\n'
              '3.clipBehavior\n'
              '4.elevation\n'
              '5.semanticLabel\n'
              '6.shadowColor\n'
              '7.shape\n'
              '8.surfaceTintColor\n'
              '9.width',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: Tap on the three lines at top of the corner.',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}
