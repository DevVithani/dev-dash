import 'package:flutter/material.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FractionallySizedBoxWidget extends StatefulWidget {
  const FractionallySizedBoxWidget({super.key});

  @override
  State<FractionallySizedBoxWidget> createState() => _FractionallySizedBoxWidgetState();
}

class _FractionallySizedBoxWidgetState extends State<FractionallySizedBoxWidget> {

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
          'Fractionally SizedBox',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/fractionally_sized_box_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class FractionallyExample extends StatefulWidget {
          const FractionallyExample({super.key});
        
          @override
          State<FractionallyExample> createState() => _FractionallyExampleState();
        }
        
        class _FractionallyExampleState extends State<FractionallyExample> {
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.5,
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                alignment: FractionalOffset.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.blue,
                      width: 4,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: FractionallyExample(),
        ),
      ),
    );
  }
}

class FractionallyExample extends StatefulWidget {
  const FractionallyExample({super.key});

  @override
  State<FractionallyExample> createState() => _FractionallyExampleState();
}

class _FractionallyExampleState extends State<FractionallyExample> {

  String url = 'https://youtu.be/PEsY654EGZ0';

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
      clipBehavior: Clip.none,
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
              'Properties of FractionallySizedBox Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.child\n'
              '3.heightFactor\n'
              '4.widthFactor',
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
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.5,
                alignment: FractionalOffset.center,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                ),
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
              'Example 2: ',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Center(
              child: FractionallySizedBox(
                widthFactor: 0.5,
                heightFactor: 0.3,
                alignment: FractionalOffset.bottomRight,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 5,
                    ),
                  ),
                ),
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
