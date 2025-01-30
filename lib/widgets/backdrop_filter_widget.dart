import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class BackDropFilterWidget extends StatefulWidget {
  const BackDropFilterWidget({super.key});

  @override
  State<BackDropFilterWidget> createState() => _BackDropFilterWidgetState();
}

class _BackDropFilterWidgetState extends State<BackDropFilterWidget> {

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
          'BackDrop Filter',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/backdrop_filter_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class BackDropExample extends StatefulWidget {
          const BackDropExample({super.key});
        
          @override
          State<BackDropExample> createState() => _BackDropExampleState();
        }
        
        class _BackDropExampleState extends State<BackDropExample> {
          @override
          Widget build(BuildContext context) {
            return Center(
          child: Stack(
            children: [
              Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR6-pi_C1eqMmirL7ajU2BHtCat0tIMTCVrvw&s',
                fit: BoxFit.cover,
              ),
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                    sigmaY: 5,
                    sigmaX: 5,
                  ),
                  child: Container(
                    color: Colors.black.withOpacity(0),
                  ),
                ),
              ),
              const Text(
                'Earth',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                  color: Colors.white,
                ),
             ),
          ],
        ),
            );
          }
        }''',
          child: BackDropExample(),
        ),
      ),
    );
  }
}

class BackDropExample extends StatefulWidget {
  const BackDropExample({super.key});

  @override
  State<BackDropExample> createState() => _BackDropExampleState();
}

class _BackDropExampleState extends State<BackDropExample> {

  String url = 'https://youtu.be/dYRs7Q1vfYI';

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
              'Properties of BackdropFilter Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.blendMode\n'
              '2.child\n'
              '3.filter',
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
              'Example: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Image.asset('assets/backdrop.png'),
        ],
      ),
    );
  }
}
