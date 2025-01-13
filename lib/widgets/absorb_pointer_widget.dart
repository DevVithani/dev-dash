import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class AbsorbPointerWidget extends StatefulWidget {
  const AbsorbPointerWidget({super.key});

  @override
  State<AbsorbPointerWidget> createState() => _AbsorbPointerWidgetState();
}

class _AbsorbPointerWidgetState extends State<AbsorbPointerWidget> {
  final url = 'https://www.youtube.com/watch?v=65HoWqBboI8';

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
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.black,
        title: const Text(
          'Absorb Pointer',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
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
              filePath: 'lib/widgets/absorb_pointer_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class AbsorbPointerExample extends StatefulWidget {
              const AbsorbPointerExample({super.key});
            
              @override
              State<AbsorbPointerExample> createState() => _AbsorbPointerExampleState();
            }
            
            class _AbsorbPointerExampleState extends State<AbsorbPointerExample> {
            
              @override
              Widget build(BuildContext context) {
                return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: Center(
                    child: ElevatedButton(
                      child: const Text("Normal Button"),
                      onPressed: () {
                        final snackBar = SnackBar(
                          content: const Row(
                            children: [
                              Icon(
                                Icons.thumb_up,
                                color: Colors.white,
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Text(
                                  'Thanks for Rating!',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
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
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: AbsorbPointer(
                      child: ElevatedButton(
                        child: const Text("Absorb Pointer Button"),
                        onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}''',
              child: AbsorbPointerExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class AbsorbPointerExample extends StatefulWidget {
  const AbsorbPointerExample({super.key});

  @override
  State<AbsorbPointerExample> createState() => _AbsorbPointerExampleState();
}

class _AbsorbPointerExampleState extends State<AbsorbPointerExample> {
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
              'Properties of Absorb Pointer:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.bool absorbing\n'
              '2.Widget child\n',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example: ',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: ElevatedButton(
                child: const Text("Normal Button"),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          color: Colors.white,
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Text(
                            'Thanks for Rating!',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
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
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Center(
              child: AbsorbPointer(
                child: ElevatedButton(
                  child: const Text("Absorb Pointer Button"),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
