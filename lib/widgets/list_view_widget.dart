import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ListViewWidget extends StatefulWidget {
  const ListViewWidget({super.key});

  @override
  State<ListViewWidget> createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {

  String url = 'https://youtu.be/KJpkjHGiI5A';

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
          'Listview',
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
              filePath: 'lib/widgets/list_view_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class ListViewExample extends StatefulWidget {
              const ListViewExample({super.key});
            
              @override
              State<ListViewExample> createState() => _ListViewExampleState();
            }
            
            class _ListViewExampleState extends State<ListViewExample> {
              @override
              Widget build(BuildContext context) {
                return ListView(
            children: [
            
            // Example 1 Code
            
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("User 1"),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.add_circle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("User 2"),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.add_circle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("User 3"),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.add_circle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("User 4"),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.add_circle),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  title: const Text("User 5"),
                  tileColor: Colors.white,
                  onTap: () {},
                  leading: const Icon(Icons.person),
                  trailing: const Icon(Icons.add_circle),
                ),
              ),
              
              // Example 2 Code
              
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.5,
                child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
                      child: ListTile(
                        title: Text('User {index + 1}'),    // put dollar Symbol before {}
                        leading: const Icon(Icons.person, size: 20,),
                        trailing: const Icon(Icons.check, size: 20,),
                      ),
                    );
                  },
                  itemCount: 5,
                ),
              ),
            ],
                );
              }
            }
            ''',
              child: ListViewExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class ListViewExample extends StatefulWidget {
  const ListViewExample({super.key});

  @override
  State<ListViewExample> createState() => _ListViewExampleState();
}

class _ListViewExampleState extends State<ListViewExample> {

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            'Properties of ListView Widget: ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            '1.anchor\n'
            '2.cacheExtent\n'
            '3.center\n'
            '4.childrenDelegate\n'
            '5.clipBehavior\n'
            '6.controller\n'
            '7.dragStartBehavior\n'
            '8.hitTestBehavior\n'
            '9.itemExtent\n'
            '10.itemExtentBuilder\n'
            '11.keyboardDismissBehavior\n'
            '12.padding\n'
            '13.physics\n'
            '14.prototypeItem\n'
            '15.restorationId\n'
            '16.reverse\n'
            '17.scrollBehavior\n'
            '18.scrollDirection\n'
            '19.semanticChildCount\n'
            '20.shrinkWrap',
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
            'Example 1: ',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("User 1"),
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("User 2"),
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("User 3"),
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("User 4"),
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            title: Text("User 5"),
            tileColor: Colors.white,
            leading: Icon(Icons.person),
            trailing: Icon(Icons.add_circle),
          ),
        ),
        const Divider(
          thickness: 2,
          height: 50,
        ),
        const Padding(
          padding: EdgeInsets.only(top: 18, left: 15),
          child: Text(
            'Example 2: ListView.builder',
            style: TextStyle(
                fontSize: 17, color: Colors.blue, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height / 2.5,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: ListTile(
                  onTap: () {},
                  title: Text('User ${index + 1}'),
                  leading: const Icon(
                    Icons.person,
                    size: 20,
                  ),
                  trailing: const Icon(
                    Icons.location_on,
                    size: 20,
                  ),
                ),
              );
            },
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
