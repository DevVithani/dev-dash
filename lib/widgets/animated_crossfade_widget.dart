import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class AnimatedCrossFadeWidget extends StatefulWidget {
  const AnimatedCrossFadeWidget({super.key});

  @override
  State<AnimatedCrossFadeWidget> createState() =>
      _AnimatedCrossFadeWidgetState();
}

class _AnimatedCrossFadeWidgetState extends State<AnimatedCrossFadeWidget> {

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
          'AnimatedCrossFade',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/animated_crossfade_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class AnimatedCrossFadeExample extends StatefulWidget {
          const AnimatedCrossFadeExample({super.key});
        
          @override
          State<AnimatedCrossFadeExample> createState() =>
        _AnimatedCrossFadeExampleState();
        }
        
        class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample>
            with TickerProviderStateMixin {
          late bool _bool = true;
          late bool bul = true;
          
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: AnimatedCrossFade(
                firstChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                ),
                secondChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                ),
                crossFadeState:
                    _bool ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        _bool = !_bool;
                      },
                    );
                  },
                  child: const Text("Switch"),
                ),
              ),
            ),
            
            // Example 2 Code
            
            Center(
              child: AnimatedCrossFade(
                firstChild: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsIz4qZKTOplGKCIt860B8HP3mTBMZGACNFg&s'),
                secondChild: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s'),
                crossFadeState:
                    bul ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    setState(
                      () {
                        bul = !bul;
                      },
                    );
                  },
                  child: const Text("Switch"),
          ),
        ),
      ),
              ],
            ),
          );
        }
      }''',
          child: AnimatedCrossFadeExample(),
        ),
      ),
    );
  }
}

class AnimatedCrossFadeExample extends StatefulWidget {
  const AnimatedCrossFadeExample({super.key});

  @override
  State<AnimatedCrossFadeExample> createState() =>
      _AnimatedCrossFadeExampleState();
}

class _AnimatedCrossFadeExampleState extends State<AnimatedCrossFadeExample>
    with TickerProviderStateMixin {
  late bool _bool = true;
  late bool bul = true;

  String url = 'https://youtu.be/PGK2UUAyE54';

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
              'Properties of AnimatedCrossFade Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.crossFadeState\n'
              '3.duration\n'
              '4.excludeBottomFocus\n'
              '5.firstChild\n'
              '6.firstCurve\n'
              '7.layoutBuilder\n'
              '8.reverseDuration\n'
              '9.secondChild\n'
              '10.secondCurve\n'
              '11.sizeCurve',
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
              'Example 1: Widget AnimatedCrossFade',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: AnimatedCrossFade(
                firstChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.blue,
                ),
                secondChild: Container(
                  height: 200,
                  width: 200,
                  color: Colors.green,
                ),
                crossFadeState: _bool
                    ? CrossFadeState.showFirst
                    : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _bool = !_bool;
                    },
                  );
                },
                child: const Text("Switch"),
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
              'Example 2: Image AnimatedCrossFade',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: AnimatedCrossFade(
                firstChild: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQsIz4qZKTOplGKCIt860B8HP3mTBMZGACNFg&s'),
                secondChild: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQZGEs4ajlkUdtcsedEPmKeRkpSkOtQwh6lzQ&s'),
                crossFadeState:
                    bul ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                duration: const Duration(seconds: 1),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      bul = !bul;
                    },
                  );
                },
                child: const Text("Switch"),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
        ],
      ),
    );
  }
}
