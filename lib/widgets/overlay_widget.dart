import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class OverLayWidget extends StatefulWidget {
  const OverLayWidget({super.key});

  @override
  State<OverLayWidget> createState() => _OverLayWidgetState();
}

class _OverLayWidgetState extends State<OverLayWidget> {
  int currentPageIndex = 0;

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
          'Overlay',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: currentPageIndex,
        destinations: const <NavigationDestination>[
          NavigationDestination(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          NavigationDestination(
            icon: Icon(Icons.commute),
            label: 'Commute',
          ),
          NavigationDestination(
            selectedIcon: Icon(Icons.bookmark),
            icon: Icon(Icons.bookmark_border),
            label: 'Saved',
          ),
        ],
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/overlay_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class OverlayExample extends StatefulWidget {
          const OverlayExample({super.key});
        
          @override
          State<OverlayExample> createState() => _OverlayExampleState();
        }
        
        class _OverlayExampleState extends State<OverlayExample> {
          int currentPageIndex = 0;
        
          OverlayEntry? overlayEntry;
        
          void createHighlightOverlay({
            required AlignmentDirectional alignment,
            required Color borderColor,
          }) {
            removeHighlightOverlay();
        
            assert(overlayEntry == null);
        
            Widget builder(BuildContext context) {
        final (String label, Color? color) = switch (currentPageIndex) {
          0 => ('Explore page', Colors.red),
          1 => ('Commute page', Colors.green),
          2 => ('Saved page', Colors.orange),
          _ => ('No page selected.', null),
        };
        if (color == null) {
          return Text(label);
        }
        return Column(
          children: <Widget>[
            Text(label, style: TextStyle(color: color)),
            Icon(Icons.arrow_downward, color: color),
          ],
        );
            }
        
            overlayEntry = OverlayEntry(
        builder: (BuildContext context) {
          return SafeArea(
            child: Align(
              alignment: alignment,
              heightFactor: 1.0,
              child: DefaultTextStyle(
                style: const TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.bold,
                  fontSize: 14.0,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const Text('Tap here for'),
                    Builder(builder: builder),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3,
                      height: 80.0,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: borderColor,
                              width: 4.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
            );
        
            Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
          }
        
          void removeHighlightOverlay() {
            overlayEntry?.remove();
            overlayEntry?.dispose();
            overlayEntry = null;
          }
        
          @override
          void dispose() {
            removeHighlightOverlay();
            super.dispose();
          }
        
          @override
          Widget build(BuildContext context) {
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            'Use Overlay to highlight a NavigationBar destination',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentPageIndex = 0;
                  });
                  createHighlightOverlay(
                    alignment: AlignmentDirectional.bottomStart,
                    borderColor: Colors.red,
                  );
                },
                child: const Text('Explore'),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentPageIndex = 1;
                  });
                  createHighlightOverlay(
                    alignment: AlignmentDirectional.bottomCenter,
                    borderColor: Colors.green,
                  );
                },
                child: const Text('Commute'),
              ),
              const SizedBox(width: 20.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    currentPageIndex = 2;
                  });
                  createHighlightOverlay(
                    alignment: AlignmentDirectional.bottomEnd,
                    borderColor: Colors.orange,
                  );
                },
                child: const Text('Saved'),
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          ElevatedButton(
            onPressed: () {
              removeHighlightOverlay();
            },
            child: const Text('Remove Overlay'),
          ),
        ],
            );
          }
        }''',
          child: OverlayExample(),
        ),
      ),
    );
  }
}

class OverlayExample extends StatefulWidget {
  const OverlayExample({super.key});

  @override
  State<OverlayExample> createState() => _OverlayExampleState();
}

class _OverlayExampleState extends State<OverlayExample> {

  String url = 'https://www.youtube.com/watch?v=S0Ylpa44OAQ';

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
  int currentPageIndex = 0;

  OverlayEntry? overlayEntry;

  void createHighlightOverlay({
    required AlignmentDirectional alignment,
    required Color borderColor,
  }) {
    removeHighlightOverlay();

    assert(overlayEntry == null);

    Widget builder(BuildContext context) {
      final (String label, Color? color) = switch (currentPageIndex) {
        0 => ('Explore page', Colors.red),
        1 => ('Commute page', Colors.green),
        2 => ('Saved page', Colors.orange),
        _ => ('No page selected.', null),
      };
      if (color == null) {
        return Text(label);
      }
      return Column(
        children: <Widget>[
          Text(label, style: TextStyle(color: color)),
          Icon(Icons.arrow_downward, color: color),
        ],
      );
    }

    overlayEntry = OverlayEntry(
      builder: (BuildContext context) {
        return SafeArea(
          child: Align(
            alignment: alignment,
            heightFactor: 1.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.bold,
                fontSize: 14.0,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Tap here for'),
                  Builder(builder: builder),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 3,
                    height: 80.0,
                    child: Center(
                      child: Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: borderColor,
                            width: 4.0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    Overlay.of(context, debugRequiredFor: widget).insert(overlayEntry!);
  }

  void removeHighlightOverlay() {
    overlayEntry?.remove();
    overlayEntry?.dispose();
    overlayEntry = null;
  }

  @override
  void dispose() {
    removeHighlightOverlay();
    super.dispose();
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
              'Properties of Overlay Widget: ',
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
              '2.initialEntries\n',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
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
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Use Overlay to highlight a NavigationBar destination',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentPageIndex = 0;
                        });
                        createHighlightOverlay(
                          alignment: AlignmentDirectional.bottomStart,
                          borderColor: Colors.red,
                        );
                      },
                      child: const Text('Explore'),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentPageIndex = 1;
                        });
                        createHighlightOverlay(
                          alignment: AlignmentDirectional.bottomCenter,
                          borderColor: Colors.green,
                        );
                      },
                      child: const Text('Commute'),
                    ),
                    const SizedBox(width: 20.0),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentPageIndex = 2;
                        });
                        createHighlightOverlay(
                          alignment: AlignmentDirectional.bottomEnd,
                          borderColor: Colors.orange,
                        );
                      },
                      child: const Text('Saved'),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Align(
                  alignment: Alignment.centerLeft,
                  child: ElevatedButton(
                    onPressed: () {
                      removeHighlightOverlay();
                    },
                    child: const Text('Remove Overlay'),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
            height: 150,
          ),
        ],
      ),
    );
  }
}
