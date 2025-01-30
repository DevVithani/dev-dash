import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ClipOvalWidget extends StatefulWidget {
  const ClipOvalWidget({super.key});

  @override
  State<ClipOvalWidget> createState() => _ClipOvalWidgetState();
}

class _ClipOvalWidgetState extends State<ClipOvalWidget> {

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
          'ClipOval',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/clip_oval_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ClipOvalExample extends StatefulWidget {
          const ClipOvalExample({super.key});
        
          @override
          State<ClipOvalExample> createState() => _ClipOvalExampleState();
        }
        
        class _ClipOvalExampleState extends State<ClipOvalExample> {
        
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
                'Example: ',
                style: TextStyle(fontSize: 17),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18),
            ),
            Center(
              child: ClipOval(
                clipper: MyClip(),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJKncgYFP-O8CwJz4o989Jx1TzcWf82CkRw&s',
                    fit: BoxFit.fill),
              ),
            ),
            // Example 2 Code
            
            Center(
              child: ClipOval(
                clipper: MyCliPer(),
                child: Image.network(
                    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJKncgYFP-O8CwJz4o989Jx1TzcWf82CkRw&s',
                    fit: BoxFit.fill),
              ),
            ),
          ],
        ),
            );
          }
        }
        
        class MyClip extends CustomClipper<Rect> {
          @override
          Rect getClip(Size size) {
            return const Rect.fromLTWH(0, 0, 100, 150);
          }
        
          @override
          bool shouldReclip(oldClipper) {
            return false;
          }
        }
        
        class MyCliPer extends CustomClipper<Rect> {
          @override
          Rect getClip(Size size) {
            return const Rect.fromLTWH(150, 100, 0, 150);
          }
        
          @override
          bool shouldReclip(oldClipper) {
            return false;
          }
        }
        ''',
          child: ClipOvalExample(),
        ),
      ),
    );
  }
}

class ClipOvalExample extends StatefulWidget {
  const ClipOvalExample({super.key});

  @override
  State<ClipOvalExample> createState() => _ClipOvalExampleState();
}

class _ClipOvalExampleState extends State<ClipOvalExample> {

  String url = 'https://www.youtube.com/watch?v=vzWWDO6whIM';

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
              'Properties of ClipOval Widget:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.child\n'
              '2.clipBehavior\n'
              '3.clipper\n',
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
                  color: Colors.blue),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
          ),
          Center(
            child: ClipOval(
              clipper: MyClip(),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJKncgYFP-O8CwJz4o989Jx1TzcWf82CkRw&s',
                  fit: BoxFit.fill),
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
                  color: Colors.blue),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18),
          ),
          Center(
            child: ClipOval(
              clipper: MyClipper(),
              child: Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRdJKncgYFP-O8CwJz4o989Jx1TzcWf82CkRw&s',
                  fit: BoxFit.fill),
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

class MyClip extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 150);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}

class MyClipper extends CustomClipper<Rect> {
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(0, 0, 100, 208);
  }

  @override
  bool shouldReclip(oldClipper) {
    return false;
  }
}
