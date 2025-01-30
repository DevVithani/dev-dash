import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SnackBarWidget extends StatefulWidget {
  const SnackBarWidget({super.key});

  @override
  State<SnackBarWidget> createState() => _SnackBarWidgetState();
}

class _SnackBarWidgetState extends State<SnackBarWidget> {

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
          'SnackBar',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/snackbar_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class SnackBarExample extends StatefulWidget {
          const SnackBarExample({super.key});
        
          @override
          State<SnackBarExample> createState() => _SnackBarExampleState();
        }
        
        class _SnackBarExampleState extends State<SnackBarExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [         
            Padding(
              padding: const EdgeInsets.only(top: 25),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    final snackBar = SnackBar(
                      content: const Row(
                        children: [
                          Icon(
                            Icons.thumb_up_alt_rounded,
                            color: Colors.white,
                          ),
                          SizedBox(width: 20),
                          Expanded(
                            child: Text(
                              'Thanks for Rating!',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      action: SnackBarAction(
                        label: 'Undo',
                        onPressed: () {},
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                  child: const Text('Rate 5 star'),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: SnackBarExample(),
        ),
      ),
    );
  }
}

class SnackBarExample extends StatefulWidget {
  const SnackBarExample({super.key});

  @override
  State<SnackBarExample> createState() => _SnackBarExampleState();
}

class _SnackBarExampleState extends State<SnackBarExample> {

  String url = 'https://youtu.be/zpO6n_oZWw0';

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
              'Properties of SnackBar Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.action\n'
              '2.actionOverflowThreshold\n'
              '3.animation\n'
              '4.backgroundColor\n'
              '5.behavior\n'
              '6.clipBehavior\n'
              '7.closeIconColor\n'
              '8.content\n'
              '9.dismissDirection\n'
              '10.duration\n'
              '11.elevation\n'
              '12.hitTestBehavior\n'
              '13.margin\n'
              '14.onVisible\n'
              '15.padding\n'
              '16.shape\n'
              '17.showCloseIcon\n'
              '18.width\n',
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
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 25),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  final snackBar = SnackBar(
                    duration: const Duration(seconds: 1),
                    content: const Row(
                      children: [
                        Icon(
                          Icons.thumb_up_alt_rounded,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Thanks for Rating!',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {},
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Rate 5*'),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 2:  ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: OutlinedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.green,
                    content: Text(
                      'Saved',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Save'),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 3:  ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    duration: Duration(seconds: 1),
                    backgroundColor: Colors.red,
                    content: Text(
                      'Deleted',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                );
              },
              child: const Text('Delete'),
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
