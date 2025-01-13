import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class CircularProgressIndicatorWidget extends StatefulWidget {
  const CircularProgressIndicatorWidget({super.key});

  @override
  State<CircularProgressIndicatorWidget> createState() =>
      _CircularProgressIndicatorWidgetState();
}

class _CircularProgressIndicatorWidgetState
    extends State<CircularProgressIndicatorWidget> {

  String url = 'https://www.youtube.com/watch?v=O-rhXZLtpv0';

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
        title: const Text(
          'Indicators',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.black,
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
              filePath: 'lib/widgets/circular_progress_indicator_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
            class IndicatorsExample extends StatefulWidget {
              const IndicatorsExample({super.key});
            
              @override
              State<IndicatorsExample> createState() => _IndicatorsExampleState();
            }
            
            class _IndicatorsExampleState extends State<IndicatorsExample> {
              double value = 0;
            
              String url = 'https://www.youtube.com/watch?v=O-rhXZLtpv0';
            
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
            
              void updateProgress() {
                setState(() {
            value += 0.1;
            if (value > 1.0) {
              value = 0.0;
            }
                });
              }
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Examples of CircularProgressIndicators
                
                // Example 1 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
                
                // Example 3 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeAlign: 3,
                    ),
                  ),
                ),
                
                // Example 4 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                ),
                
                // Example 5 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                    ),
                  ),
                ),
                
                // Example 6 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      value: 0.3,
                    ),
                  ),
                ),
                
                // Example 7 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
                
                // LinearProgressIndicator Example
                
                // Example 1 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                    ),
                  ),
                ),
                
                // Example 2 Code
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      value: 0.8,
                    ),
                  ),
                ),
                
                //Example 3 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      backgroundColor: Colors.black,
                    ),
                  ),
                ),
                
                // Example 4 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      color: Colors.black,
                    ),
                  ),
                ),
                
                // Example 5 Code
                
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                
                // Example 6 Code
                
                const Padding(
                  padding: EdgeInsets.only(top: 18),
                  child: Center(
                    child: LinearProgressIndicator(
                      minHeight: 2,
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: IndicatorsExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class IndicatorsExample extends StatefulWidget {
  const IndicatorsExample({super.key});

  @override
  State<IndicatorsExample> createState() => _IndicatorsExampleState();
}

class _IndicatorsExampleState extends State<IndicatorsExample> {
  double value = 0;

  void updateProgress() {
    setState(() {
      value += 0.1;
      if (value > 1.0) {
        value = 0.0;
      }
    });
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
              'Properties of LinearProgressIndicator Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.backgroundColor\n'
              '2.borderRadius\n'
              '3.color\n'
              '4.minHeight\n'
              '5.semanticsLabel\n'
              '6.semanticsValue\n'
              '7.value\n'
              '8.valueColor',
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
              'Examples of CircularProgressIndicator: \n\n',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: backgroundColor.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: color.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Divider(
            thickness: 3,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: strokeAlign.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                strokeAlign: 3,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: strokeCap.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                strokeCap: StrokeCap.round,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: strokeWidth.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                strokeWidth: 2,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 6: value.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                value: 0.3,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 7: valueColor.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
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
              'Examples of LinearProgressIndicator: \n\n',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: valueColor.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: value.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                value: 0.8,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: backgroundColor.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                backgroundColor: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: color.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                color: Colors.black,
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: borderRadius.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 6: minHeight.',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: LinearProgressIndicator(
                minHeight: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
