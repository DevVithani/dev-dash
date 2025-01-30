import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class SliverAppBarWidget extends StatefulWidget {
  const SliverAppBarWidget({super.key});

  @override
  State<SliverAppBarWidget> createState() => _SliverAppBarWidgetState();
}

class _SliverAppBarWidgetState extends State<SliverAppBarWidget> {

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: Expanded(
          flex: 1,
          child: WidgetWithCodeView(
            filePath: 'lib/widgets/silver_appbar_widget.dart',
            iconBackgroundColor: Colors.black,
            iconForegroundColor: Colors.white,
            codeLinkPrefix: 'https://google.com?q=',
            codeContent: '''
            import 'package:flutter/material.dart';
          
            class SliverAppbarExample extends StatefulWidget {
            const SliverAppbarExample({super.key});
          
            @override
            State<SliverAppbarExample> createState() => _SliverAppbarExampleState();
          }
          
          class _SliverAppbarExampleState extends State<SliverAppbarExample> {
            
            @override
            Widget build(BuildContext context) {
              return CustomScrollView(
                slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text(
                "Sliver AppBar",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              background: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTkwS4plhmRHFyTuBM5LcRE92T1nGUwGun4w&s',
          
                fit: BoxFit.cover,
              ),
            ),
            expandedHeight: 230,
            backgroundColor: Colors.black,
            leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.menu),
              tooltip: 'Menu',
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.comment),
                tooltip: 'Comment icon',
                onPressed: () {},
              ),
              IconButton(
                color: Colors.white,
                icon: const Icon(Icons.settings),
                tooltip: 'Setting Icon',
                onPressed: () {},
              ),
            ],
          ),
                ],
              );
            }
          }''',
            child: SliverAppbarExample(),
          ),
        ),
      ),
    );
  }
}

class SliverAppbarExample extends StatefulWidget {
  const SliverAppbarExample({super.key});

  @override
  State<SliverAppbarExample> createState() => _SliverAppbarExampleState();
}

class _SliverAppbarExampleState extends State<SliverAppbarExample> {

  String url = 'https://youtu.be/R9C5KMJKluE';

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
        captionLanguage: 'hi',
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
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          pinned: true,
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: const Text(
              "Sliver AppBar",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            background: Image.network(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTkwS4plhmRHFyTuBM5LcRE92T1nGUwGun4w&s',
              fit: BoxFit.cover,
            ),
          ),
          expandedHeight: 230,
          backgroundColor: Colors.black,
          leading: IconButton(
            color: Colors.white,
            icon: const Icon(Icons.menu),
            tooltip: 'Menu',
            onPressed: () {},
          ),
          actions: <Widget>[
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.comment),
              tooltip: 'Comment icon',
              onPressed: () {},
            ),
            IconButton(
              color: Colors.white,
              icon: const Icon(Icons.settings),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ),
          ],
        ),
        SliverToBoxAdapter(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                YoutubePlayer(
                  controller: controller!,
                  showVideoProgressIndicator: true,
                  progressColors: const ProgressBarColors(
                    backgroundColor: Colors.white,
                    handleColor: Colors.black,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    'properties of SliverAppbar Widget:',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    '1.actions\n'
                    '2.actionsIconTheme\n'
                    '3.automaticallyImplyLeading\n'
                    '4.backgroundColor\n'
                    '5.bottom\n'
                    '6.centerTitle\n'
                    '7.clipBehavior\n'
                    '8.collapsedHeight\n'
                    '9.elevation\n'
                    '10.excludeHeaderSemantics\n'
                    '11.expandedHeight\n'
                    '12.flexibleSpace\n'
                    '13.floating\n'
                    '14.forceElevated\n'
                    '15.forceMaterialTransparency\n'
                    '16.foregroundColor\n'
                    '17.iconTheme\n'
                    '18.leading\n'
                    '19.leadingWidth\n'
                    '20.onStretchTrigger\n'
                    '21.pinned\n'
                    '22.primary\n'
                    '23.scrolledUnderElevation\n'
                    '24.shadowColor\n'
                    '25.shape\n'
                    '26.snap\n'
                    '27.stretch\n'
                    '28.stretchTriggerOffset\n'
                    '29.surfaceTintColor\n'
                    '30.systemOverlayStyle\n'
                    '31.title\n'
                    '32.titleSpacing\n'
                    '33.titleTextStyle\n'
                    '34.toolbarHeight\n'
                    '35.toolbarTextStyle',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    'Example: black or image Appbar',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                        color: Colors.blue),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
