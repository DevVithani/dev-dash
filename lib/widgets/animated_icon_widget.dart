import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedIconWidget extends StatefulWidget {
  const AnimatedIconWidget({super.key});

  @override
  _AnimatedIconWidgetState createState() => _AnimatedIconWidgetState();
}

class _AnimatedIconWidgetState extends State<AnimatedIconWidget> {
  String url = 'https://www.youtube.com/watch?v=pJcbh8pbvJs';

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
          'Animated Icon',
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
              filePath: 'lib/widgets/animated_icon_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class AnimatedIconExample extends StatefulWidget {
              const AnimatedIconExample({super.key});
            
              @override
              State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
            }
            
            class _AnimatedIconExampleState extends State<AnimatedIconExample>
                with TickerProviderStateMixin {
              late AnimationController _animationController;
              late AnimationController _animationCoNtRoLLer;
              late AnimationController _aNiMaTIoNCOnTROlLER;
            
              @override
              void initState() {
                super.initState();
                _animationController = AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 300),);
                _animationCoNtRoLLer = AnimationController(
                vsync: this,
                duration: const Duration(milliseconds: 300),);
                _aNiMaTIoNCOnTROlLER = AnimationController(
                vsync: this,
                duration: const Duration(milliseconds: 300),
                );
              }
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [  
                // Example 1 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_animationController.isDismissed) {
                          _animationController.forward();
                        } else {
                          _animationController.reverse();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.menu_close,
                        progress: _animationController,
                        size: 50.0,
                        color: Colors.blue,
                        semanticLabel: 'Menu/Close',
                      ),
                    ),
                  ),
                ),
                // Example 2 Code 
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_animationCoNtRoLLer.isDismissed) {
                          _animationCoNtRoLLer.forward();
                        } else {
                          _animationCoNtRoLLer.reverse();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.ellipsis_search,
                        progress: _animationCoNtRoLLer,
                        size: 50.0,
                        color: Colors.black,
                        semanticLabel: 'Ellipsis/Search',
                      ),
                    ),
                  ),
                ),
                
                // Example 3 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        if (_aNiMaTIoNCOnTROlLER.isDismissed) {
                          _aNiMaTIoNCOnTROlLER.forward();
                        } else {
                          _aNiMaTIoNCOnTROlLER.reverse();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.arrow_menu,
                        progress: _aNiMaTIoNCOnTROlLER,
                        size: 50.0,
                        color: Colors.black,
                        semanticLabel: 'Arrow/Menu',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}''',
              child: AnimatedIconExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AnimatedIconExample extends StatefulWidget {
  const AnimatedIconExample({super.key});

  @override
  State<AnimatedIconExample> createState() => _AnimatedIconExampleState();
}

class _AnimatedIconExampleState extends State<AnimatedIconExample>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationCoNtRoLLer;
  late AnimationController _aNiMaTIoNCOnTROlLER;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _animationCoNtRoLLer = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _aNiMaTIoNCOnTROlLER = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    _animationCoNtRoLLer.dispose();
    _aNiMaTIoNCOnTROlLER.dispose();
    super.dispose();
  }

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
              'Properties of AnimatedIcon:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.color\n'
              '2.icon\n'
              '3.progress\n'
              '4.semanticLabel\n'
              '5.size\n'
              '6.textDirection',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 18),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_animationController.isDismissed) {
                    _animationController.forward();
                  } else {
                    _animationController.reverse();
                  }
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.menu_close,
                  progress: _animationController,
                  size: 50.0,
                  color: Colors.black,
                  semanticLabel: 'Menu/Close',
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 18),
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
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_animationCoNtRoLLer.isDismissed) {
                    _animationCoNtRoLLer.forward();
                  } else {
                    _animationCoNtRoLLer.reverse();
                  }
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.ellipsis_search,
                  progress: _animationCoNtRoLLer,
                  size: 50.0,
                  color: Colors.black,
                  semanticLabel: 'Ellipsis/Search',
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 15, left: 18),
            child: Text(
              'Example 3: ',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: GestureDetector(
                onTap: () {
                  if (_aNiMaTIoNCOnTROlLER.isDismissed) {
                    _aNiMaTIoNCOnTROlLER.forward();
                  } else {
                    _aNiMaTIoNCOnTROlLER.reverse();
                  }
                },
                child: AnimatedIcon(
                  icon: AnimatedIcons.arrow_menu,
                  progress: _aNiMaTIoNCOnTROlLER,
                  size: 50.0,
                  color: Colors.black,
                  semanticLabel: 'Arrow/Menu',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
