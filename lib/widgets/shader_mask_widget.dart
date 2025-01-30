import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ShaderMaskWidget extends StatefulWidget {
  const ShaderMaskWidget({super.key});

  @override
  State<ShaderMaskWidget> createState() => _ShaderMaskWidgetState();
}

class _ShaderMaskWidgetState extends State<ShaderMaskWidget> {

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
          'ShaderMask Widget',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/shader_mask_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class ShaderMaskExample extends StatefulWidget {
          const ShaderMaskExample({super.key});
        
          @override
          State<ShaderMaskExample> createState() => _ShaderMaskExampleState();
        }
        
        class _ShaderMaskExampleState extends State<ShaderMaskExample> {
        
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: <Color>[Colors.red, Colors.blue],
                      tileMode: TileMode.mirror,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "ShaderMask Widget",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
            
            // Example 2 Code 
            
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example 2:',
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.topLeft,
                      radius: 1.0,
                      colors: <Color>[Colors.blue, Colors.green],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "DevDash",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
            
            // Example 3 code
            
            Padding(
              padding: const EdgeInsets.all(10),
              child: Center(
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return const RadialGradient(
                      center: Alignment.bottomCenter,
                      radius: 1.0,
                      colors: <Color>[
                        Colors.deepPurpleAccent, Colors.lightBlueAccent],
                      tileMode: TileMode.repeated,
                    ).createShader(bounds);
                  },
                  child: const Text(
                    "DevDash",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ),
              ),
            ),
          ],
        ),
            );
          }
        }''',
          child: ShaderMaskExample(),
        ),
      ),
    );
  }
}

class ShaderMaskExample extends StatefulWidget {
  const ShaderMaskExample({super.key});

  @override
  State<ShaderMaskExample> createState() => _ShaderMaskExampleState();
}

class _ShaderMaskExampleState extends State<ShaderMaskExample> {

  String url = 'https://www.youtube.com/watch?v=7sUL66pTQ7Q';

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
              'Properties of ShaderMask Widget: \n',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.blendMode\n'
              '2.child\n'
              '3.shaderCallback',
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
              'Example 1:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[Colors.red, Colors.blue],
                    tileMode: TileMode.mirror,
                  ).createShader(bounds);
                },
                child: const Text(
                  "DevDash",
                  style: TextStyle(color: Colors.white, fontSize: 35),
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
              'Example 2:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    center: Alignment.topLeft,
                    radius: 1.0,
                    colors: <Color>[Colors.blue, Colors.green],
                    tileMode: TileMode.repeated,
                  ).createShader(bounds);
                },
                child: const Text(
                  "DevDash",
                  style: TextStyle(color: Colors.white, fontSize: 35),
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
              'Example 3:',
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const RadialGradient(
                    center: Alignment.bottomCenter,
                    radius: 1.0,
                    colors: <Color>[
                      Colors.deepPurpleAccent,
                      Colors.lightBlueAccent
                    ],
                    tileMode: TileMode.repeated,
                  ).createShader(bounds);
                },
                child: const Text(
                  "DevDash",
                  style: TextStyle(color: Colors.white, fontSize: 35),
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
