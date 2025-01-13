import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedListWidget extends StatefulWidget {
  const AnimatedListWidget({super.key});

  @override
  State<AnimatedListWidget> createState() => _AnimatedListWidgetState();
}

class _AnimatedListWidgetState extends State<AnimatedListWidget> {

  String url = 'https://youtu.be/ZtfItHwFlZ8';

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
          'AnimatedList',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 8),
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
              filePath: 'lib/widgets/animated_list_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class AnimatedListExample extends StatefulWidget {
              const AnimatedListExample({super.key});
            
              @override
              State<AnimatedListExample> createState() => _AnimatedListExampleState();
            }
            
            class _AnimatedListExampleState extends State<AnimatedListExample> {
              final GlobalKey<AnimatedListState> _listKey = GlobalKey();
              final _items = [];
            
              void _addItem() {
                _items.insert(0, "Item {_items.length + 1}");    // put dollar symbol before {}
                _listKey.currentState!
              .insertItem(0, duration: const Duration(milliseconds: 500));
              }
            
              void _removeItem(int index) {
                _listKey.currentState!.removeItem(
            index,
            (_, animation) {
              return SizeTransition(
                sizeFactor: animation,
                child: const Card(
                  margin: EdgeInsets.all(10),
                  color: Colors.black,
                  child: ListTile(
                    title: Text(
                      "Deleted",
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
            duration: const Duration(milliseconds: 500),
                );
                _items.removeAt(index);
              }
            
              @override
              Widget build(BuildContext context) {
                return Scaffold(
            body: SingleChildScrollView(
              clipBehavior: Clip.none,
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 4,
                    child: AnimatedList(
                      key: _listKey,
                      initialItemCount: 0,
                      padding: const EdgeInsets.all(10),
                      itemBuilder: (context, index, animation) {
                        return SizeTransition(
                          key: UniqueKey(),
                          sizeFactor: animation,
                          child: Card(
                            margin: const EdgeInsets.all(10),
                            color: Colors.blue,
                            child: ListTile(
                              title: Text(
                                _items[index],
                                style: const TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  _removeItem(index);
                                },
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: _addItem,
              child: const Icon(Icons.add),
            ),
                );
              }
            }''',
              child: AnimatedListExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedListExample extends StatefulWidget {
  const AnimatedListExample({super.key});

  @override
  State<AnimatedListExample> createState() => _AnimatedListExampleState();
}

class _AnimatedListExampleState extends State<AnimatedListExample> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey();
  final _items = [];

  void _addItem() {
    _items.insert(0, "Item ${_items.length + 1}");
    _listKey.currentState!
        .insertItem(0, duration: const Duration(milliseconds: 500));
  }

  void _removeItem(int index) {
    _listKey.currentState!.removeItem(
      index,
      (_, animation) {
        return SizeTransition(
          sizeFactor: animation,
          child: const Card(
            margin: EdgeInsets.all(10),
            color: Colors.black,
            child: ListTile(
              title: Text(
                "Deleted",
                style: TextStyle(fontSize: 24, color: Colors.white),
              ),
            ),
          ),
        );
      },
      duration: const Duration(milliseconds: 500),
    );
    _items.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        clipBehavior: Clip.none,
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Properties of AnimatedList Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.clipBehavior\n'
                '2.controller\n'
                '3.initialItemCount\n'
                '4.itemBuilder\n'
                '5.padding\n'
                '6.physics\n'
                '7.primary\n'
                '8.removedSeparatorBuilder\n'
                '9.reverse\n'
                '10.scrollDirection\n'
                '11.shrinkWrap',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example: Click on + Button',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 4,
              child: AnimatedList(
                key: _listKey,
                initialItemCount: 0,
                padding: const EdgeInsets.all(10),
                itemBuilder: (context, index, animation) {
                  return SizeTransition(
                    key: UniqueKey(),
                    sizeFactor: animation,
                    child: Card(
                      margin: const EdgeInsets.all(10),
                      color: Colors.blue,
                      child: ListTile(
                        title: Text(
                          _items[index],
                          style: const TextStyle(
                              fontSize: 24,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                          onPressed: () {
                            _removeItem(index);
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        child: const Icon(Icons.add),
      ),
    );
  }
}
