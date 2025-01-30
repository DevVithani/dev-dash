import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


enum ColorLabel {
  blue('Blue', Colors.blue),
  pink('Pink', Colors.pink),
  green('Green', Colors.green),
  yellow('Orange', Colors.orange),
  purple('Purple', Colors.purple),
  grey('Grey', Colors.grey);

  const ColorLabel(this.label, this.color);
  final String label;
  final Color color;
}

enum IconLabel {
  smile('Smile', Icons.sentiment_satisfied_outlined),
  cloud(
    'Cloud',
    Icons.cloud_outlined,
  ),
  brush('Brush', Icons.brush_outlined),
  heart('Heart', Icons.favorite);

  const IconLabel(this.label, this.icon);
  final String label;
  final IconData icon;
}

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({super.key});

  @override
  State<DropDownMenuWidget> createState() => _DropDownMenuWidgetState();
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {


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
          'DropDown Menu',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/drop_down_menu_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          enum ColorLabel {
          blue('Blue', Colors.blue),
          pink('Pink', Colors.pink),
          green('Green', Colors.green),
          yellow('Orange', Colors.orange),
          purple('Purple', Colors.purple),
          grey('Grey', Colors.grey);
        
          const ColorLabel(this.label, this.color);
          final String label;
          final Color color;
        }
        
        enum IconLabel {
          smile('Smile', Icons.sentiment_satisfied_outlined),
          cloud(
            'Cloud',
            Icons.cloud_outlined,
          ),
          brush('Brush', Icons.brush_outlined),
          heart('Heart', Icons.favorite);
        
          const IconLabel(this.label, this.icon);
          final String label;
          final IconData icon;
        }
        
          class DropDownMenuExample extends StatefulWidget {
          const DropDownMenuExample({super.key});
        
          @override
          State<DropDownMenuExample> createState() => _DropDownMenuExampleState();
        }
        
        class _DropDownMenuExampleState extends State<DropDownMenuExample> {
          final TextEditingController colorController = TextEditingController();
          final TextEditingController iconController = TextEditingController();
          ColorLabel? selectedColor;
          IconLabel? selectedIcon;
        
          @override
          Widget build(BuildContext context) {
            return SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        DropdownMenu<ColorLabel>(
                          initialSelection: ColorLabel.green,
                          controller: colorController,
                          requestFocusOnTap: true,
                          label: const Text('Color'),
                          onSelected: (ColorLabel? color) {
                            setState(() {
                              selectedColor = color;
                            });
                          },
                          dropdownMenuEntries: ColorLabel.values
                              .map<DropdownMenuEntry<ColorLabel>>(
                                  (ColorLabel color) {
                            return DropdownMenuEntry<ColorLabel>(
                              value: color,
                              label: color.label,
                              enabled: color.label != 'Grey',
                              style: MenuItemButton.styleFrom(
                                foregroundColor: color.color,
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(width: 24),
                        DropdownMenu<IconLabel>(
                          controller: iconController,
                          enableFilter: true,
                          requestFocusOnTap: true,
                          leadingIcon: const Icon(Icons.search),
                          label: const Text('Icon'),
                          inputDecorationTheme: const InputDecorationTheme(
                            filled: true,
                            contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                          ),
                          onSelected: (IconLabel? icon) {
                            setState(() {
                              selectedIcon = icon;
                            });
                          },
                          dropdownMenuEntries:
                              IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                            (IconLabel icon) {
                              return DropdownMenuEntry<IconLabel>(
                                value: icon,
                                label: icon.label,
                                leadingIcon: Icon(icon.icon),
                              );
                            },
                          ).toList(),
                        ),
                      ],
                    ),
                  ),
                  if (selectedColor != null && selectedIcon != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                            'You selected a {selectedColor?.label} {selectedIcon?.label}'), // put dollar symbol before {}
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Icon(
                            selectedIcon?.icon,
                            color: selectedColor?.color,
                          ),
                        )
                      ],
                    )
                  else
                    const Text('Please select a color and an icon.')
                ],
              ),
            ],
          ),
        ),
            );
          }
        }''',
          child: DropDownMenuExample(),
        ),
      ),
    );
  }
}

class DropDownMenuExample extends StatefulWidget {
  const DropDownMenuExample({super.key});

  @override
  State<DropDownMenuExample> createState() => _DropDownMenuExampleState();
}

class _DropDownMenuExampleState extends State<DropDownMenuExample> {
  final TextEditingController colorController = TextEditingController();
  final TextEditingController iconController = TextEditingController();
  ColorLabel? selectedColor;
  IconLabel? selectedIcon;

  String url = 'https://www.youtube.com/watch?v=giV9AbM2gd8';

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
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
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
                'Properties of DropDownMenu Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.controller\n'
                '2.dropdownMenuEntries\n'
                '3.enabled\n'
                '4.enableFilter\n'
                '5.enableSearch\n'
                '6.errorText\n'
                '7.expandedInsets\n'
                '8.filterCallback\n'
                '9.focusNode\n'
                '10.helperText\n'
                '11.hintText\n'
                '12.initialSection\n'
                '13.inputDecorationTheme\n'
                '14.inputFormatters\n'
                '15.label\n'
                '16.leadingIcon\n'
                '17.menuHeight\n'
                '18.menuStyle\n'
                '19.onSelected\n'
                '20.requestFocusOnTap\n'
                '21.searchCallback\n'
                '22.selectedTrailingIcon\n'
                '23.textAlign\n'
                '24.textStyle\n'
                '25.trailingIcon\n'
                '26.width',
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
            Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      DropdownMenu<ColorLabel>(
                        initialSelection: ColorLabel.green,
                        controller: colorController,
                        requestFocusOnTap: true,
                        label: const Text('Color'),
                        onSelected: (ColorLabel? color) {
                          setState(() {
                            selectedColor = color;
                          });
                        },
                        dropdownMenuEntries: ColorLabel.values
                            .map<DropdownMenuEntry<ColorLabel>>(
                                (ColorLabel color) {
                          return DropdownMenuEntry<ColorLabel>(
                            value: color,
                            label: color.label,
                            enabled: color.label != 'Grey',
                            style: MenuItemButton.styleFrom(
                              foregroundColor: color.color,
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(width: 24),
                      DropdownMenu<IconLabel>(
                        controller: iconController,
                        enableFilter: true,
                        requestFocusOnTap: true,
                        leadingIcon: const Icon(Icons.search),
                        label: const Text('Icon'),
                        inputDecorationTheme: const InputDecorationTheme(
                          filled: true,
                          contentPadding: EdgeInsets.symmetric(vertical: 5.0),
                        ),
                        onSelected: (IconLabel? icon) {
                          setState(() {
                            selectedIcon = icon;
                          });
                        },
                        dropdownMenuEntries:
                            IconLabel.values.map<DropdownMenuEntry<IconLabel>>(
                          (IconLabel icon) {
                            return DropdownMenuEntry<IconLabel>(
                              value: icon,
                              label: icon.label,
                              leadingIcon: Icon(icon.icon),
                            );
                          },
                        ).toList(),
                      ),
                    ],
                  ),
                ),
                if (selectedColor != null && selectedIcon != null)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          'You selected a ${selectedColor?.label} ${selectedIcon?.label}'),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: Icon(
                          selectedIcon?.icon,
                          color: selectedColor?.color,
                        ),
                      )
                    ],
                  )
                else
                  const Text('Please select a color and an icon.')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
