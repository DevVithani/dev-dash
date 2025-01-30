import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'PageView',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/page_view_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
        import 'package:flutter/material.dart';
          
          class PageViewExample extends StatefulWidget {
          const PageViewExample({super.key});
        
          @override
          State<PageViewExample> createState() => _PageViewExampleState();
        }
        
        class _PageViewExampleState extends State<PageViewExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // Example 1 Code
          
            Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView.builder(
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.green[(index + 1) * 100],
                        child: Center(
                          child: Text(
                            'Page {index + 1}', // put dollar symbol before {}
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Example 2 Code
            
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example 2: Vertical PageView',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(18),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: PageView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return Container(
                        color: Colors.blue[(index + 1) * 100],
                        child: Center(
                          child: Text(
                            'Page {index + 1}',   // put dollar symbol before {}
                            style: const TextStyle(
                                color: Colors.white, fontSize: 24),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: PageViewExample(),
        ),
      ),
    );
  }
}

class PageViewExample extends StatefulWidget {
  const PageViewExample({super.key});

  @override
  State<PageViewExample> createState() => _PageViewExampleState();
}

class _PageViewExampleState extends State<PageViewExample> {

  String url = 'https://youtu.be/J1gE9xvph-A';

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
              'Properties of PageView Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.allowImplicitScrolling\n'
              '2.childrenDelegate\n'
              '3.clipBehavior\n'
              '4.controller\n'
              '5.dragStartBehavior\n'
              '6.hitTestBehavior\n'
              '7.onPageChanged\n'
              '8.panEnds\n'
              '9.pageSnapping\n'
              '10.physics\n'
              '11.restorationId\n'
              '12.reverse\n'
              '13.scrollBehavior\n'
              '15.scrollDirection',
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
              'Example 1: Horizontal PageView',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.green[(index + 1) * 100],
                      child: Center(
                        child: Text(
                          'Page ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
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
              'Example 2: Vertical PageView',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18),
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                height: MediaQuery.of(context).size.height * 0.6,
                child: PageView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blue[(index + 1) * 100],
                      child: Center(
                        child: Text(
                          'Page ${index + 1}',
                          style: const TextStyle(
                              color: Colors.white, fontSize: 24),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
