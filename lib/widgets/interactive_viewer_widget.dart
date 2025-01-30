import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class InteractiveViewerWidget extends StatefulWidget {
  const InteractiveViewerWidget({super.key});

  @override
  State<InteractiveViewerWidget> createState() =>
      _InteractiveViewerWidgetState();
}

class _InteractiveViewerWidgetState extends State<InteractiveViewerWidget> {

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
          'Interactive Viewer',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/interactive_viewer_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class InteractiveExample extends StatefulWidget {
          const InteractiveExample({super.key});
        
          @override
          State<InteractiveExample> createState() => _InteractiveExampleState();
        }
        
        class _InteractiveExampleState extends State<InteractiveExample> {
        
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
                child: InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20.0),
                  minScale: 0.1,
                  maxScale: 1.6,
                  child: Container(
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: <Color>[Colors.orange, Colors.red],
                        stops: <double>[0.0, 1.0],
                      ),
                    ),
                  ),
                ),
              ),
            
            // Example 2 Code
            
            Center(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 1.6,
                child: Container(
                  height: 700,
                  width: 500,
                  // Using image from local storage
                  child: Image.network(
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRatVzDGmEFyVULU8VupVmqasEG7Ia7fJxTcw&s",
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: InteractiveExample(),
        ),
      ),
    );
  }
}

class InteractiveExample extends StatefulWidget {
  const InteractiveExample({super.key});

  @override
  State<InteractiveExample> createState() => _InteractiveExampleState();
}

class _InteractiveExampleState extends State<InteractiveExample> {

  String url = 'https://www.youtube.com/watch?v=zrn7V3bMJvg';

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
              'Properties of InteractiveViewer Widget: ',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.alignment\n'
              '2.boundaryMargin\n'
              '3.builder\n'
              '4.child\n'
              '5.clipBehavior\n'
              '6.constrained\n'
              '7.interactionEndFrictionCoefficient\n'
              '8.maxScale\n'
              '9.minScale\n'
              '10.onInteractionEnd\n'
              '11.onInteractionStart\n'
              '12.onInteractionUpdate\n'
              '13.panAxis\n'
              '14.panEnabled\n'
              '15.scaleEnabled\n'
              '16.scaleFactor\n'
              '17.trackpadScrollCausesScale\n'
              '18.transformationController',
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              'Example 1: Widget',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.5,
            child: Center(
              child: InteractiveViewer(
                boundaryMargin: const EdgeInsets.all(20.0),
                minScale: 0.1,
                maxScale: 1.6,
                child: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[Colors.orange, Colors.red],
                      stops: <double>[0.0, 1.0],
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
              'Example 2: Image',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
                color: Colors.blue,
              ),
            ),
          ),
          Center(
            child: InteractiveViewer(
              boundaryMargin: const EdgeInsets.all(20.0),
              minScale: 0.1,
              maxScale: 1.6,
              child: Container(
                height: 700,
                width: 500,
                // Using image from local storage
                child: Image.network(
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRatVzDGmEFyVULU8VupVmqasEG7Ia7fJxTcw&s",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
