import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ValueListEnableBuilderWidget extends StatefulWidget {
  const ValueListEnableBuilderWidget({super.key});

  @override
  State<ValueListEnableBuilderWidget> createState() =>
      _ValueListEnableBuilderWidgetState();
}

class _ValueListEnableBuilderWidgetState
    extends State<ValueListEnableBuilderWidget> {

  String url = 'https://youtu.be/s-ZG-jS5QHQ';

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
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text(
          'ValueListEnable Builder',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
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
              filePath: 'lib/widgets/value_list_enable_builder_widget.dart',
              iconBackgroundColor: Colors.black,
              iconForegroundColor: Colors.white,
              codeLinkPrefix: 'https://google.com?q=',
              codeContent: '''
              import 'package:flutter/material.dart';
            
              class ValueListExample extends StatefulWidget {
              const ValueListExample({super.key});
            
              @override
              State<ValueListExample> createState() => _ValueListExampleState();
            }
            
            class _ValueListExampleState extends State<ValueListExample> {
              final ValueNotifier<int> _counter = ValueNotifier<int>(0);
            
              @override
              Widget build(BuildContext context) {
                return Scaffold(
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text('You have pushed the button this many times:'),
                  ValueListenableBuilder<int>(
                    builder: (BuildContext context, int value, Widget? child) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CountDisplay(count: value),
                          child!,
                        ],
                      );
                    },
                    valueListenable: _counter,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: SizedBox(
                        width: 40,
                        height: 40,
                        child: FlutterLogo(size: 40),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              child: const Icon(Icons.plus_one),
              onPressed: () => _counter.value += 1,
            ),
                );
              }
            }
            
            class CountDisplay extends StatelessWidget {
              const CountDisplay({super.key, required this.count});
            
              final int count;
            
              @override
              Widget build(BuildContext context) {
                return Container(
            width: 100,
            height: 100,
            padding: const EdgeInsetsDirectional.all(10),
            child: Text('count', style: Theme.of(context).textTheme.headlineMedium), // put dollar symbol before count
                );
              }
            }''',
              child: ValueListExample(),
            ),
          ),
        ],
      ),
    );
  }
}

class CountDisplay extends StatelessWidget {
  const CountDisplay({super.key, required this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      padding: const EdgeInsetsDirectional.all(10),
      child: Text('$count', style: Theme.of(context).textTheme.headlineMedium),
    );
  }
}

class ValueListExample extends StatefulWidget {
  const ValueListExample({super.key});

  @override
  State<ValueListExample> createState() => _ValueListExampleState();
}

class _ValueListExampleState extends State<ValueListExample> {
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Properties of ValueListEnableBuilder Widget: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                '1.builder\n'
                '2.child\n'
                '3.valueListenable',
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, left: 15),
              child: Text(
                'Example: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                  color: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('You have pushed the button this many times:'),
                    ValueListenableBuilder<int>(
                      builder:
                          (BuildContext context, int value, Widget? child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            CountDisplay(count: value),
                            child!,
                          ],
                        );
                      },
                      valueListenable: _counter,
                      child: const Padding(
                        padding: EdgeInsets.all(10.0),
                        child: SizedBox(
                          width: 40,
                          height: 40,
                          child: FlutterLogo(size: 40),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.plus_one),
        onPressed: () => _counter.value += 1,
      ),
    );
  }
}
