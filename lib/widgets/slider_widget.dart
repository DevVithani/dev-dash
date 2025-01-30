import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SliderWidget extends StatefulWidget {
  const SliderWidget({super.key});

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

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
          'Slider',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/slider_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class SliderExample extends StatefulWidget {
          const SliderExample({super.key});
        
          @override
          State<SliderExample> createState() => _SliderExampleState();
        }
        
        class _SliderExampleState extends State<SliderExample> {
          double _currentSliderValue = 20;
            double _currentSlIdErValue = 0;
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 code
          
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Slider(
                activeColor: Colors.black,
                inactiveColor: Colors.white,
                value: _currentSliderValue,
                max: 100,
                divisions: 5,
                label: _currentSliderValue.round().toString(),
                onChanged: (double value) {
                  setState(() {
                    _currentSliderValue = value;
                  });
                },
              ),
            ),
            
            // Example 2 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Row(
                children: [
                  const Icon(Icons.volume_up),
                  Slider(
                    activeColor: Colors.blue,
                    inactiveColor: Colors.white,
                    thumbColor: Colors.black,
                    value: _currentSlIderValue,
                    min: 0,
                    max: 100,
                    divisions: 5,
                    label: _currentSlIderValue.round().toString(),
                    onChanged: (double value) {
                      setState(() {
                        _currentSlIderValue = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: SliderExample(),
        ),
      ),
    );
  }
}

class SliderExample extends StatefulWidget {
  const SliderExample({super.key});

  @override
  State<SliderExample> createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _currentSliderValue = 20;
  double _currentSlIdErValue = 0;

  String url = 'https://www.youtube.com/watch?v=ufb4gIPDmEs';

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
              'Properties of Slider Widget:',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.activeColor\n'
              '2.autofocus\n'
              '3.allowedInteraction\n'
              '4.divisions\n'
              '5.focusNode\n'
              '6.label\n'
              '7.max\n'
              '8.min\n'
              '9.mouseCursor\n'
              '10.onChanged\n'
              '11.onChangeEnd\n'
              '12.onChangeStart\n'
              '13.overlayColor\n'
              '14.secondaryActiveColor\n'
              '15.secondaryTrackValue\n'
              '16.semanticFormatterCallback\n'
              '17.thumbColor\n'
              '18.value',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 25),
            child: Text(
              'Example 1: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Slider(
              activeColor: Colors.black,
              inactiveColor: Colors.white,
              value: _currentSliderValue,
              max: 100,
              divisions: 5,
              label: _currentSliderValue.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 25),
            child: Text(
              'Example 2: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 18),
                  child: Icon(Icons.volume_up),
                ),
                Slider(
                  activeColor: Colors.blue,
                  inactiveColor: Colors.white,
                  thumbColor: Colors.black,
                  value: _currentSlIdErValue,
                  min: 0,
                  max: 100,
                  divisions: 5,
                  label: _currentSlIdErValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _currentSlIdErValue = value;
                    });
                  },
                ),
              ],
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
