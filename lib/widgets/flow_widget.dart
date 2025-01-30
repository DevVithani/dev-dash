import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';

class FlowWidget extends StatefulWidget {
  const FlowWidget({super.key});

  @override
  State<FlowWidget> createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget> {
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
          'Flow',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/flow_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FlowMenuDelegate extends FlowDelegate {
          FlowMenuDelegate({required this.menuAnimation})
        : super(repaint: menuAnimation);
        
          final Animation<double> menuAnimation;
        
          @override
          bool shouldRepaint(FlowMenuDelegate oldDelegate) {
            return menuAnimation != oldDelegate.menuAnimation;
          }
        
          @override
          void paintChildren(FlowPaintingContext context) {
            double dx = 0.0;
            for (int i = 0; i < context.childCount; ++i) {
        dx = context.getChildSize(i)!.width * i;
        context.paintChild(
          i,
          transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0),
        );
            }
          }
        }
        
        class FlowExample extends StatefulWidget {
          const FlowExample({super.key});
        
          @override
          State<FlowExample> createState() => _FlowExampleState();
        }
        
        class _FlowExampleState extends State<FlowExample>
            with SingleTickerProviderStateMixin {
          late AnimationController menuAnimation;
          IconData lastIconClicked = Icons.home;
          final List<IconData> menuItems = <IconData>[
            Icons.home,
            Icons.new_releases,
            Icons.notifications,
            Icons.settings,
            Icons.menu,
          ];
        
          @override
          void initState() {
            super.initState();
            menuAnimation = AnimationController(
          duration: const Duration(milliseconds: 250), vsync: this);
          }
        
          @override
          Widget build(BuildContext context) {
            return Flow(
        delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
        children: menuItems
            .map<Widget>((IconData icon) => Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: FloatingActionButton(
                    backgroundColor:
                        lastIconClicked == icon ? Colors.white : Colors.black,
                    splashColor: Colors.white,
                    onPressed: () {
                      if (icon != Icons.menu) {
                        setState(() {
                          lastIconClicked = icon;
                        });
                      }
                      menuAnimation.status == AnimationStatus.completed
                          ? menuAnimation.reverse()
                          : menuAnimation.forward();
                    },
                    child: Icon(icon),
                  ),
                ))
            .toList(),
            );
          }
        }''',
          child: FlowExample(),
        ),
      ),
    );
  }
}

class FlowMenuDelegate extends FlowDelegate {
  FlowMenuDelegate({required this.menuAnimation})
      : super(repaint: menuAnimation);

  final Animation<double> menuAnimation;

  @override
  bool shouldRepaint(FlowMenuDelegate oldDelegate) {
    return menuAnimation != oldDelegate.menuAnimation;
  }

  @override
  void paintChildren(FlowPaintingContext context) {
    double dx = 0.0;
    for (int i = 0; i < context.childCount; ++i) {
      dx = context.getChildSize(i)!.width * i;
      context.paintChild(
        i,
        transform: Matrix4.translationValues(dx * menuAnimation.value, 0, 0),
      );
    }
  }
}

class FlowExample extends StatefulWidget {
  const FlowExample({super.key});

  @override
  State<FlowExample> createState() => _FlowExampleState();
}

class _FlowExampleState extends State<FlowExample>
    with SingleTickerProviderStateMixin {
  late AnimationController menuAnimation;
  IconData lastIconClicked = Icons.home;
  final List<IconData> menuItems = <IconData>[
    Icons.home,
    Icons.new_releases,
    Icons.notifications,
    Icons.settings,
    Icons.menu,
  ];

  String url = 'https://www.youtube.com/watch?v=NG6pvXpnIso';

  YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();
    menuAnimation = AnimationController(
        duration: const Duration(milliseconds: 250), vsync: this);

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
      clipBehavior: Clip.none,
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
              'Properties of Flow Widget: ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.children\n'
              '2.clipBehavior\n'
              '3.delegate\n',
              style: TextStyle(fontSize: 18),
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 8,
            child: Flow(
              delegate: FlowMenuDelegate(menuAnimation: menuAnimation),
              children: menuItems
                  .map<Widget>((IconData icon) => Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: FloatingActionButton(
                          backgroundColor: lastIconClicked == icon
                              ? Colors.white
                              : Colors.black,
                          splashColor: Colors.white,
                          onPressed: () {
                            if (icon != Icons.menu) {
                              setState(() {
                                lastIconClicked = icon;
                              });
                            }
                            menuAnimation.status == AnimationStatus.completed
                                ? menuAnimation.reverse()
                                : menuAnimation.forward();
                          },
                          child: Icon(icon),
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
