import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class PhysicalModelWidget extends StatefulWidget {
  const PhysicalModelWidget({super.key});

  @override
  State<PhysicalModelWidget> createState() => _PhysicalModelWidgetState();
}

class _PhysicalModelWidgetState extends State<PhysicalModelWidget> {

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
          'Physical Model',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/physical_model_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class PhysicalModelExample extends StatefulWidget {
          const PhysicalModelExample({super.key});
        
          @override
          State<PhysicalModelExample> createState() => _PhysicalModelExampleState();
        }
        
        class _PhysicalModelExampleState extends State<PhysicalModelExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 code
          
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: PhysicalModel(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            
            // Example 2 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: PhysicalModel(
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            
            // Example 3 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: PhysicalModel(
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
           ),
            
            // Example 4 code
            
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: PhysicalModel(
                  shape: BoxShape.circle,
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
            
            // Example 5 code
                
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: PhysicalModel(
                  shadowColor: Colors.black,
                  elevation: 25,
                  color: Colors.black,
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: PhysicalModelExample(),
        ),
      ),
    );
  }
}

class PhysicalModelExample extends StatefulWidget {
  const PhysicalModelExample({super.key});

  @override
  State<PhysicalModelExample> createState() => _PhysicalModelExampleState();
}

class _PhysicalModelExampleState extends State<PhysicalModelExample> {

  String videoURL = 'https://www.youtube.com/watch?v=XgUOSS30OQk';

  YoutubePlayerController? controller;

  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(videoURL);

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
              'Properties of PhysicalModel Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.borderRadius\n'
              '2.child\n'
              '3.clipBehavior\n'
              '4.color\n'
              '5.elevation\n'
              '6.shadowColor\n'
              '7.shape',
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
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 1: borderRadius',
              style: TextStyle(
                fontSize: 17,
                color: Colors.blue,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 18),
            child: Center(
              child: PhysicalModel(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black,
                child: const SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 2: child',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: PhysicalModel(
                color: Colors.black,
                child: SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 3: color',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: PhysicalModel(
                color: Colors.black,
                child: SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 4: shape',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: PhysicalModel(
                shape: BoxShape.circle,
                color: Colors.black,
                child: SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text(
              'Example 5: shadowColor',
              style: TextStyle(
                  fontSize: 17,
                  color: Colors.blue,
                  fontWeight: FontWeight.w600),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
            child: Center(
              child: PhysicalModel(
                shadowColor: Colors.black,
                elevation: 25,
                color: Colors.black,
                child: SizedBox(
                  height: 100,
                  width: 100,
                ),
              ),
            ),
          ),
          const Divider(
            thickness: 2,
            height: 50,
          )
        ],
      ),
    );
  }
}
