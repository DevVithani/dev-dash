import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class HeroWidget extends StatefulWidget {
  const HeroWidget({super.key});

  @override
  State<HeroWidget> createState() => _HeroWidgetState();
}

class _HeroWidgetState extends State<HeroWidget> {

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
          'Hero',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/hero_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class BoxWidget extends StatelessWidget {
          const BoxWidget({super.key, required this.size});
        
          final Size size;
        
          @override
          Widget build(BuildContext context) {
            return Container(
        width: size.width,
        height: size.height,
        color: Colors.blue,
            );
          }
        }
        
        class HeroExample extends StatefulWidget {
          const HeroExample({super.key});
        
          @override
          State<HeroExample> createState() => _HeroExampleState();
        }
        
        class _HeroExampleState extends State<HeroExample> {
          
          @override
          Widget build(BuildContext context) {
            return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const SizedBox(height: 20.0),
          ListTile(
            leading: const Hero(
              tag: 'hero-rectangle',
              child: BoxWidget(size: Size(50.0, 50.0)),
            ),
            onTap: () => _gotoDetailsPage(context),
            title: const Text(
              'Tap on the icon to view hero animation transition.',
            ),
          ),
        ],
            );
          }
        
          void _gotoDetailsPage(BuildContext context) {
            Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (BuildContext context) => Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.black,
              title: const Text(
                'Second Page',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            body: const Center(
              child: Hero(
                tag: 'hero-rectangle',
                child: BoxWidget(
                  size: Size(200.0, 200.0),
                ),
              ),
            ),
          ),
        ),
            );
          }
        }
        class BoxWidget extends StatelessWidget {
          const BoxWidget({super.key, required this.size});
        
          final Size size;
        
          @override
          Widget build(BuildContext context) {
            return Container(
        width: size.width,
        height: size.height,
        color: Colors.blue,
            );
          }
        }''',
          child: HeroExample(),
        ),
      ),
    );
  }
}

class BoxWidget extends StatelessWidget {
  const BoxWidget({super.key, required this.size});

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width,
      height: size.height,
      color: Colors.blue,
    );
  }
}

class HeroExample extends StatefulWidget {
  const HeroExample({super.key});

  @override
  State<HeroExample> createState() => _HeroExampleState();
}

class _HeroExampleState extends State<HeroExample> {

  String url = 'https://youtu.be/Be9UH1kXFDw';

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
              'Properties of Hero Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.createRectTween\n'
              '3.flightShuttleBuilder\n'
              '4.placeholderBuilder\n'
              '5.tag\n'
              '6.transitionOnUserGesture',
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
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const SizedBox(height: 20.0),
                ListTile(
                  leading: const Hero(
                    tag: 'hero-rectangle',
                    child: BoxWidget(
                      size: Size(50.0, 50.0),
                    ),
                  ),
                  onTap: () => _gotoDetailsPage(context),
                  title: const Text(
                    'Tap on the icon to view hero animation transition.',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _gotoDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (BuildContext context) => Scaffold(
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Colors.black,
            title: const Text(
              'Second Page',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body: const Center(
            child: Hero(
              tag: 'hero-rectangle',
              child: BoxWidget(
                size: Size(200.0, 200.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
