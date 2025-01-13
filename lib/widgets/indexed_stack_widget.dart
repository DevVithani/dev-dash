import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';

class IndexStackWidget extends StatefulWidget {
  const IndexStackWidget({super.key});

  @override
  State<IndexStackWidget> createState() => _IndexStackWidgetState();
}

class _IndexStackWidgetState extends State<IndexStackWidget> {

  String url = 'https://www.youtube.com/watch?v=_O0PPD1Xfbk';

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
          'Indexed Stack',
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
              filePath: 'lib/widgets/indexed_stack_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class IndexedStackExample extends StatefulWidget {
              const IndexedStackExample({super.key});
            
              @override
              State<IndexedStackExample> createState() => _IndexedStackExampleState();
            }
            
            class _IndexedStackExampleState extends State<IndexedStackExample> {
              int _index = 0;
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [   
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _index = 0;
                              });
                            },
                            child: Text('_index'), // put dollar symbol before _index
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _index = 1;
                              });
                            },
                            child: Text('_index'), // put dollar symbol before _index
                          ),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                _index = 2;
                              });
                            },
                            child: Text('_index'), // put dollar symbol before _index
                          ),
                        ],
                      ),
                      IndexedStack(
                        index: _index,
                        children: [
                          Center(
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsIz4qZKTOplGKCIt860B8HP3mTBMZGACNFg&s'),
                          ),
                          Center(
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s'),
                          ),
                          Center(
                            child: Image.network(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Gm7iDyKB4FY_HNqS1wxRUalz4ywmRTKqiQ&s'),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 50),
                        color: Colors.red,
                        height: 50,
                        width: 200,
                        child: Text(
                          'Page: {_index + 1}', // put dollar symbol before {}
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: IndexedStackExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class IndexedStackExample extends StatefulWidget {
  const IndexedStackExample({super.key});

  @override
  State<IndexedStackExample> createState() => _IndexedStackExampleState();
}

class _IndexedStackExampleState extends State<IndexedStackExample> {
  int index = 0;
  int _index = 0;

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
              'Properties of IndexedStack Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.children\n'
              '3.clipBehavior\n'
              '4.index\n'
              '5.sizing\n'
              '6.textDirection',
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
              'Example 1:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 0;
                        });
                      },
                      child: const Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 1;
                        });
                      },
                      child: const Text('2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          index = 2;
                        });
                      },
                      child: const Text('3'),
                    ),
                  ],
                ),
                IndexedStack(
                  index: index,
                  children: [
                    Center(
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsIz4qZKTOplGKCIt860B8HP3mTBMZGACNFg&s'),
                    ),
                    Center(
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s'),
                    ),
                    Center(
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0Gm7iDyKB4FY_HNqS1wxRUalz4ywmRTKqiQ&s'),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child: Text(
                    'Page: ${index + 1}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
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
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _index = 0;
                        });
                      },
                      child: const Text('1'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _index = 1;
                        });
                      },
                      child: const Text('2'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          _index = 2;
                        });
                      },
                      child: const Text('3'),
                    ),
                  ],
                ),
                IndexedStack(
                  index: _index,
                  children: [
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.blue,
                        child: const Center(
                            child: Text(
                          '1',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.orange,
                        child: const Center(
                            child: Text(
                          '2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                    Center(
                      child: Container(
                        height: 200,
                        width: 200,
                        color: Colors.green,
                        child: const Center(
                            child: Text(
                          '3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        )),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(top: 50),
                  color: Colors.red,
                  height: 50,
                  width: 200,
                  child: Text(
                    'Page: ${_index + 1}',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
