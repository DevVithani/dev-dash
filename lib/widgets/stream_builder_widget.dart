import 'dart:async';

import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class StreamBuilderWidget extends StatefulWidget {
  const StreamBuilderWidget({super.key});

  @override
  _StreamBuilderWidgetState createState() => _StreamBuilderWidgetState();
}

class _StreamBuilderWidgetState extends State<StreamBuilderWidget> {

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
          'StreamBuilder',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/stream_builder_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'dart:async';
          import 'package:flutter/material.dart';
          
          class StreamBuilderExample extends StatefulWidget {
          const StreamBuilderExample({super.key});
        
          @override
          State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
        }
        
        class _StreamBuilderExampleState extends State<StreamBuilderExample> {
          late StreamController<int> _numberStreamController;
        
          @override
          void initState() {
            super.initState();
        
            _numberStreamController = StreamController<int>();
            _startAddingNumbers();
          }
        
          void _startAddingNumbers() {
            for (int i = 0; i < 10; i++) {
        Future.delayed(const Duration(milliseconds: 500));
        _numberStreamController.sink.add(i);
            }
          }
        
          @override
          void dispose() {
            _numberStreamController.close();
            super.dispose();
          }
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: StreamBuilder<int>(
                stream: _numberStreamController.stream,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: {snapshot.error}');    // put dollar symbol before {}
                  } else if (!snapshot.hasData) {
                    return const Text('No data available');
                  } else {
                    return Text(
                      'Latest Number: {snapshot.data}',    // put dollar symbol before {}
                      style: const TextStyle(fontSize: 24),
                    );
                  }
                },
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: StreamBuilderExample(),
        ),
      ),
    );
  }
}

class StreamBuilderExample extends StatefulWidget {
  const StreamBuilderExample({super.key});

  @override
  State<StreamBuilderExample> createState() => _StreamBuilderExampleState();
}

class _StreamBuilderExampleState extends State<StreamBuilderExample> {
  late StreamController<int> _numberStreamController;

    String url = 'https://youtu.be/MkKEWHfy99Y';

    YoutubePlayerController? controller;

  @override
  void initState() {
    super.initState();

    _numberStreamController = StreamController<int>();
    _startAddingNumbers();
  }

  void _startAddingNumbers() {
    for (int i = 0; i < 10; i++) {
      Future.delayed(const Duration(milliseconds: 500));
      _numberStreamController.sink.add(i);
    }


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
    _numberStreamController.close();
    super.dispose();
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
              'Properties of StreamBuilder Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.builder\n'
              '2.initialData\n'
              '3.stream',
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
          Center(
            child: StreamBuilder<int>(
              stream: _numberStreamController.stream,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (!snapshot.hasData) {
                  return const Text('No data available');
                } else {
                  return Text(
                    'Latest Number: ${snapshot.data}',
                    style: const TextStyle(fontSize: 24),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
