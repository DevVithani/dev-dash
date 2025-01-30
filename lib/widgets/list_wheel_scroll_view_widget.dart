import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class ListWheelScrollViewWidget extends StatefulWidget {
  const ListWheelScrollViewWidget({super.key});

  @override
  State<ListWheelScrollViewWidget> createState() =>
      _ListWheelScrollViewWidgetState();
}

class _ListWheelScrollViewWidgetState extends State<ListWheelScrollViewWidget> {

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
          'ListWheel ScrollView',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/list_wheel_scroll_view_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
        
          class ListWheelExample extends StatefulWidget {
          const ListWheelExample({super.key});
        
          @override
          State<ListWheelExample> createState() => _ListWheelExampleState();
        }
        
        class _ListWheelExampleState extends State<ListWheelExample> {
          @override
          Widget build(BuildContext context) {
            return SingleChildScrollView(
        clipBehavior: Clip.none,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
          // Example 1 Code
          
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListWheelScrollView(
                itemExtent: 200,
                diameterRatio: 0.8,
                physics: const FixedExtentScrollPhysics(),
                children: List.generate(
                  15,
                  (index) => Card(
                    child: ListTile(
                      title: Text('item {index + 1}'),   // put dollar symbol before {}
                      onTap: () {},
                      leading: const Icon(Icons.person),
                      trailing: const Icon(Icons.menu),
                    ),
                  ),
                ),
              ),
            ),
            
            // Example 2 Code
            
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: ListWheelScrollView(
                itemExtent: 151,
                diameterRatio: 0.8,
                physics: const FixedExtentScrollPhysics(),
                perspective: 0.003,
                children: List.generate(
                  15,
                  (index) => Card(
                    child: ListTile(
                      title: Text('item {index + 1}'),   // put dollar symbol before {}
                      onTap: () {},
                      leading: const Icon(Icons.person),
                      trailing: const Icon(Icons.menu),
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
          child: ListWheelExample(),
        ),
      ),
    );
  }
}

class ListWheelExample extends StatefulWidget {
  const ListWheelExample({super.key});

  @override
  State<ListWheelExample> createState() => _ListWheelExampleState();
}

class _ListWheelExampleState extends State<ListWheelExample> {

  String url = 'https://youtu.be/dUhmWAz4C7Y';

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
              'Properties of ListWheelScrollView Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.childDelegate\n'
              '2.clipBehavior\n'
              '3.controller\n'
              '4.diameterRatio\n'
              '5.hitTestBehavior\n'
              '6.itemExtent\n'
              '7.magnification\n'
              '8.offAxisFraction\n'
              '9.onSelectedItemChanged\n'
              '10.overAndUnderCenterOpacity\n'
              '11.perspective\n'
              '12.physics\n'
              '13.renderChildrenOutsideViewport\n'
              '14.restorationId\n'
              '15.scrollBehavior\n'
              '16.squeeze\n'
              '17.useMagnifier',
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
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: ListWheelScrollView(
              itemExtent: 200,
              diameterRatio: 0.8,
              physics: const FixedExtentScrollPhysics(),
              children: List.generate(
                15,
                (index) => Card(
                  child: ListTile(
                    title: Text('item ${index + 1}'),
                    onTap: () {},
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.menu),
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
                  color: Colors.blue),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.2,
            child: ListWheelScrollView(
              itemExtent: 151,
              diameterRatio: 0.8,
              physics: const FixedExtentScrollPhysics(),
              perspective: 0.003,
              children: List.generate(
                15,
                (index) => Card(
                  child: ListTile(
                    title: Text('item ${index + 1}'),
                    onTap: () {},
                    leading: const Icon(Icons.person),
                    trailing: const Icon(Icons.menu),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
