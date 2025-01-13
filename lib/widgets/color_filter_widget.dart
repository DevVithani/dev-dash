import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ColorFilterWidget extends StatefulWidget {
  const ColorFilterWidget({super.key});

  @override
  State<ColorFilterWidget> createState() => _ColorFilterWidgetState();
}

class _ColorFilterWidgetState extends State<ColorFilterWidget> {
  String url = 'https://www.youtube.com/watch?v=F7Cll22Dno8';

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
          'ColorFilter Widget',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
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
              filePath: 'lib/widgets/color_filter_widget.dart',
              iconForegroundColor: Colors.white,
              iconBackgroundColor: Colors.black,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
              
              class ColorFilterExample extends StatefulWidget {
              const ColorFilterExample({super.key});
            
              @override
              State<ColorFilterExample> createState() => _ColorFilterExampleState();
            }
            
            class _ColorFilterExampleState extends State<ColorFilterExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              
                // Example 1 Code
            
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.white, BlendMode.color),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 2 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.green, BlendMode.modulate),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 3 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.deepOrangeAccent, BlendMode.darken),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                //Example 4 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.blueAccent, BlendMode.hue),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 5 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.lightBlue, BlendMode.difference),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 6 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.yellow, BlendMode.luminosity),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                //Example 7 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter:
                          const ColorFilter.mode(Colors.lightBlue, BlendMode.lighten),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 8 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.limeAccent, BlendMode.hardLight),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Exampel 9 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.amberAccent, BlendMode.softLight),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
                
                // Example 10 Code
                
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: ColorFiltered(
                      colorFilter: const ColorFilter.mode(
                          Colors.lightBlue, BlendMode.colorBurn),
                      child: Image.network(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
                    ),
                  ),
                ),
              ],
            ),
                );
              }
            }''',
              child: ColorFilterExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class ColorFilterExample extends StatefulWidget {
  const ColorFilterExample({super.key});

  @override
  State<ColorFilterExample> createState() => _ColorFilterExampleState();
}

class _ColorFilterExampleState extends State<ColorFilterExample> {
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
              'Properties of ColorFilter Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.colorFilter\n'
              '2.child',
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
          const Divider(
            height: 50,
            thickness: 2,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: color BlendMode.',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.white, BlendMode.color),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 2: modulate BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.green, BlendMode.modulate),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 3: darken BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Colors.deepOrangeAccent, BlendMode.darken),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 4: hue BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.blueAccent, BlendMode.hue),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 5: difference BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Colors.lightBlue, BlendMode.difference),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 6: luminosity BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.yellow, BlendMode.luminosity),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 7: lighten BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter:
                    const ColorFilter.mode(Colors.lightBlue, BlendMode.lighten),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 8: hardLight BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Colors.limeAccent, BlendMode.hardLight),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 9: softLight BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Colors.amberAccent, BlendMode.softLight),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
              'Example 10: colorBurn BlendMode.',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ColorFiltered(
                colorFilter: const ColorFilter.mode(
                    Colors.lightBlue, BlendMode.colorBurn),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSzRb6y-IT8X5s6EjKQkHRI9TaVbJHUgqaPRg&s'),
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
