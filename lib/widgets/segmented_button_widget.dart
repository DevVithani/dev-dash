import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SegmentedButtonWidget extends StatefulWidget {
  const SegmentedButtonWidget({super.key});

  @override
  State<SegmentedButtonWidget> createState() => _SegmentedButtonWidgetState();
}

class _SegmentedButtonWidgetState extends State<SegmentedButtonWidget> {

  String url = 'https://www.youtube.com/watch?v=Kj6jwKsVC3A';

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
          'Segmented Button',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
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
              filePath: 'lib/widgets/segmented_button_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              enum Calendar { day, week, month, year }
            
            class SingleChoice extends StatefulWidget {
              const SingleChoice({super.key});
            
              @override
              State<SingleChoice> createState() => _SingleChoiceState();
            }
            
            class _SingleChoiceState extends State<SingleChoice> {
              Calendar calendarView = Calendar.day;
            
              @override
              Widget build(BuildContext context) {
                return SegmentedButton<Calendar>(
            segments: const <ButtonSegment<Calendar>>[
              ButtonSegment<Calendar>(
                  value: Calendar.day,
                  label: Text('Day'),
                  icon: Icon(Icons.calendar_view_day)),
              ButtonSegment<Calendar>(
                  value: Calendar.week,
                  label: Text('Week'),
                  icon: Icon(Icons.calendar_view_week)),
              ButtonSegment<Calendar>(
                  value: Calendar.month,
                  label: Text('Month'),
                  icon: Icon(Icons.calendar_view_month)),
              ButtonSegment<Calendar>(
                  value: Calendar.year,
                  label: Text('Year'),
                  icon: Icon(Icons.calendar_today)),
            ],
            selected: <Calendar>{calendarView},
            onSelectionChanged: (Set<Calendar> newSelection) {
              setState(() {
                calendarView = newSelection.first;
              });
            },
                );
              }
            }
            
            enum Sizes { extraSmall, small, medium, large, extraLarge }
            
            class MultipleChoice extends StatefulWidget {
              const MultipleChoice({super.key});
            
              @override
              State<MultipleChoice> createState() => _MultipleChoiceState();
            }
            
            class _MultipleChoiceState extends State<MultipleChoice> {
              Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};
            
              @override
              Widget build(BuildContext context) {
                return SegmentedButton<Sizes>(
            segments: const <ButtonSegment<Sizes>>[
              ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
              ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
              ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
              ButtonSegment<Sizes>(
                value: Sizes.large,
                label: Text('L'),
              ),
              ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
            ],
            selected: selection,
            onSelectionChanged: (Set<Sizes> newSelection) {
              setState(() {
                selection = newSelection;
              });
            },
            multiSelectionEnabled: true,
                );
              }
            }
            
            class SegmentedButtonExample extends StatefulWidget {
              const SegmentedButtonExample({super.key});
            
              @override
              State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
            }
            
            class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {
            
              @override
              Widget build(BuildContext context) {
                return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  // Example 1 Code
                  
                  const Padding(
                    padding: EdgeInsets.only(left: 18.0),
                    child: Text(
                      'Single choice:',
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  const SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChoice(),
                      ],
                    ),
                  ),
                  
                  // Example 2 Code
                  const Padding(
                    padding: EdgeInsets.only(top: 18, left: 15),
                    child: Text(
                      'Multiple choice',
                      style: TextStyle(fontSize: 15,),
                    ),
                  ),
                  const SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        MultipleChoice(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
                );
              }
            }''',
              child: SegmentedButtonExample(),
            ),
          ),
        ],
      ),
    );
  }
}

enum Calendar { day, week, month, year }

class SingleChoice extends StatefulWidget {
  const SingleChoice({super.key});

  @override
  State<SingleChoice> createState() => _SingleChoiceState();
}

class _SingleChoiceState extends State<SingleChoice> {
  Calendar calendarView = Calendar.day;

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Calendar>(
      segments: const <ButtonSegment<Calendar>>[
        ButtonSegment<Calendar>(
            value: Calendar.day,
            label: Text('Day'),
            icon: Icon(Icons.calendar_view_day_outlined)),
        ButtonSegment<Calendar>(
            value: Calendar.week,
            label: Text('Week'),
            icon: Icon(Icons.calendar_view_week_rounded)),
        ButtonSegment<Calendar>(
            value: Calendar.month,
            label: Text('Month'),
            icon: Icon(Icons.calendar_month)),
        ButtonSegment<Calendar>(
            value: Calendar.year,
            label: Text('Year'),
            icon: Icon(Icons.calendar_today)),
      ],
      selected: <Calendar>{calendarView},
      onSelectionChanged: (Set<Calendar> newSelection) {
        setState(() {
          calendarView = newSelection.first;
        });
      },
    );
  }
}

enum Sizes { extraSmall, small, medium, large, extraLarge }

class MultipleChoice extends StatefulWidget {
  const MultipleChoice({super.key});

  @override
  State<MultipleChoice> createState() => _MultipleChoiceState();
}

class _MultipleChoiceState extends State<MultipleChoice> {
  Set<Sizes> selection = <Sizes>{Sizes.large, Sizes.extraLarge};

  @override
  Widget build(BuildContext context) {
    return SegmentedButton<Sizes>(
      segments: const <ButtonSegment<Sizes>>[
        ButtonSegment<Sizes>(value: Sizes.extraSmall, label: Text('XS')),
        ButtonSegment<Sizes>(value: Sizes.small, label: Text('S')),
        ButtonSegment<Sizes>(value: Sizes.medium, label: Text('M')),
        ButtonSegment<Sizes>(
          value: Sizes.large,
          label: Text('L'),
        ),
        ButtonSegment<Sizes>(value: Sizes.extraLarge, label: Text('XL')),
      ],
      selected: selection,
      onSelectionChanged: (Set<Sizes> newSelection) {
        setState(() {
          selection = newSelection;
        });
      },
      multiSelectionEnabled: true,
    );
  }
}

class SegmentedButtonExample extends StatefulWidget {
  const SegmentedButtonExample({super.key});

  @override
  State<SegmentedButtonExample> createState() => _SegmentedButtonExampleState();
}

class _SegmentedButtonExampleState extends State<SegmentedButtonExample> {

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Properties of SegmentedButton Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.emptySelectionAllowed\n'
                '2.expandedInsets\n'
                '3.multiSelectionEnabled\n'
                '4.onSelectionChanged\n'
                '5.segments\n'
                '6.selected\n'
                '7.showSelectedIcon\n'
                '8.style\n',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            Divider(
              thickness: 2,
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example 1: Single Choice',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                    color: Colors.blue),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: SingleChoice(),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              height: 50,
            ),
            Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example 2: Multiple Choice',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
            SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 18),
                    child: Center(
                      child: MultipleChoice(),
                    ),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
