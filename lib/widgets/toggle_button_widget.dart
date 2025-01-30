import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

const List<Widget> fruits = <Widget>[
  Text('Not Sold'),
  Text('Rent'),
  Text('Sold'),
];

const List<Widget> vegetables = <Widget>[
  Text('House'),
  Text('Apartment'),
  Text('pentHouse'),
];

class ToggleButtonWidget extends StatefulWidget {
  const ToggleButtonWidget({super.key});

  @override
  State<ToggleButtonWidget> createState() => _ToggleButtonWidgetState();
}

class _ToggleButtonWidgetState extends State<ToggleButtonWidget> {

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
          'Toggle Button',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/toggle_button_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ToggleButtonExample extends StatefulWidget {
          const ToggleButtonExample({super.key});
        
          @override
          State<ToggleButtonExample> createState() => _ToggleButtonExampleState();
        }
        
        class _ToggleButtonExampleState extends State<ToggleButtonExample> {
          final List<bool> _selectedFruits = <bool>[true, false, false];
          final List<bool> _selectedVegetables = <bool>[false, true, false];
          bool vertical = false;
        
          @override
          Widget build(BuildContext context) {
            return Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [            
              
              // Example 1 Code
              
              Padding(
                padding: const EdgeInsets.only(top: 18),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Text(
                          'Single-select',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15),
                        ),
                        const SizedBox(height: 5),
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              for (int i = 0; i < _selectedFruits.length; i++) {
                                _selectedFruits[i] = i == index;
                              }
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.red[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.red,
                          color: Colors.black,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedFruits,
                          children: fruits,
                        ),
                        const Divider(
                          thickness: 2,
                          height: 50,
                        ),
                        
                        // Example 2 Code
                        
                        const SizedBox(height: 20),
                        const Text(
                          'Multi-select',
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        ToggleButtons(
                          direction: vertical ? Axis.vertical : Axis.horizontal,
                          onPressed: (int index) {
                            setState(() {
                              _selectedVegetables[index] =
                                  !_selectedVegetables[index];
                            });
                          },
                          borderRadius:
                              const BorderRadius.all(Radius.circular(8)),
                          selectedBorderColor: Colors.green[700],
                          selectedColor: Colors.white,
                          fillColor: Colors.green,
                          color: Colors.black,
                          constraints: const BoxConstraints(
                            minHeight: 40.0,
                            minWidth: 80.0,
                          ),
                          isSelected: _selectedVegetables,
                          children: vegetables,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.symmetric(vertical: 30))
            ],
          ),
        ),
            );
          }
        }''',
          child: ToggleButtonExample(),
        ),
      ),
    );
  }
}

class ToggleButtonExample extends StatefulWidget {
  const ToggleButtonExample({super.key});

  @override
  State<ToggleButtonExample> createState() => _ToggleButtonExampleState();
}

class _ToggleButtonExampleState extends State<ToggleButtonExample> {
  final List<bool> _selectedFruits = <bool>[true, false, false];
  final List<bool> _selectedVegetables = <bool>[false, true, false];
  bool vertical = false;

  String url = 'https://www.youtube.com/watch?v=kVEguaQWGAY';

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
      body: SingleChildScrollView(
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
                'Properties of ToggleButton Widget:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.borderColor\n'
                '2.borderRadius\n'
                '3.borderWidth\n'
                '4.children\n'
                '5.color\n'
                '6.constraints\n'
                '7.direction\n'
                '8.disabledBorderColor\n'
                '9.disabledColor\n'
                '10.fillColor\n'
                '11.focusColor\n'
                '12.focusNodes\n'
                '13.highlightColor\n'
                '14.hoverColor\n'
                '15.isSelected\n'
                '16.mouseCursor\n'
                '17.onPressed\n'
                '18.renderBorder\n'
                '19.selectedBorderColor\n'
                '20.selectedColor\n'
                '21.splashColor\n'
                '22.tapTargetSize\n'
                '23.textStyle\n'
                '24.verticalDirection',
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
                'Example 1: ',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text(
                        'Single-select',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      const SizedBox(height: 5),
                      ToggleButtons(
                        direction: vertical ? Axis.vertical : Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            for (int i = 0; i < _selectedFruits.length; i++) {
                              _selectedFruits[i] = i == index;
                            }
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Colors.red[700],
                        selectedColor: Colors.white,
                        fillColor: Colors.red,
                        color: Colors.black,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedFruits,
                        children: fruits,
                      ),
                      const Divider(
                        thickness: 2,
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 18, left: 15),
                        child: Text(
                          'Example 2: ',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        'Multi-select',
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      ToggleButtons(
                        direction: vertical ? Axis.vertical : Axis.horizontal,
                        onPressed: (int index) {
                          setState(() {
                            _selectedVegetables[index] =
                                !_selectedVegetables[index];
                          });
                        },
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        selectedBorderColor: Colors.green[700],
                        selectedColor: Colors.white,
                        fillColor: Colors.green,
                        color: Colors.black,
                        constraints: const BoxConstraints(
                          minHeight: 40.0,
                          minWidth: 80.0,
                        ),
                        isSelected: _selectedVegetables,
                        children: vegetables,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.symmetric(vertical: 30))
          ],
        ),
      ),
    );
  }
}
