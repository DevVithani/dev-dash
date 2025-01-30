import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class NavigationRailWidget extends StatefulWidget {
  const NavigationRailWidget({super.key});

  @override
  State<NavigationRailWidget> createState() => _NavigationRailWidgetState();
}

class _NavigationRailWidgetState extends State<NavigationRailWidget> {

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
          'Navigation Rail',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/navigation_rail_widget.dart',
          iconForegroundColor: Colors.white,
          iconBackgroundColor: Colors.black,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          
          class NavigationRailExample extends StatefulWidget {
          const NavigationRailExample({super.key});
        
          @override
          State<NavigationRailExample> createState() => _NavigationRailExampleState();
        }
        
        class _NavigationRailExampleState extends State<NavigationRailExample> {
          int _selectedIndex = 0;
          
        Row(
        children: <Widget>[
          NavigationRail(
            trailing: const Icon(Icons.menu),
            selectedIndex: _selectedIndex,
            groupAlignment: -1.0,
            onDestinationSelected: (int index) {
              setState(() {
                _selectedIndex = index;
              });
            },
            labelType: NavigationRailLabelType.selected,
            leading: const Icon(Icons.add),
            destinations: const <NavigationRailDestination>[
              NavigationRailDestination(
                icon: Icon(Icons.favorite_border),
                selectedIcon: Icon(Icons.favorite),
                label: Text('Favorite'),
              ),
              NavigationRailDestination(
                icon: Badge(
                  child: Icon(Icons.bookmark_border),
                ),
                selectedIcon: Badge(
                  child: Icon(Icons.book),
                ),
                label: Text('BookMark'),
              ),
              NavigationRailDestination(
                  icon: Badge(
                    label: Text('4'),
                    child: Icon(Icons.star_border),
                  ),
                  selectedIcon: Badge(
                    label: Text('4'),
                    child: Icon(Icons.star),
                  ),
                  label: Text('Starred')),
            ],
          ),
          const VerticalDivider(
            thickness: 1,
            width: 1,
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 ],
               ),
             ),
           ),
         ],
             );
            } 
          } ''',
          child: NavigationRailExample(),
        ),
      ),
    );
  }
}

class NavigationRailExample extends StatefulWidget {
  const NavigationRailExample({super.key});

  @override
  State<NavigationRailExample> createState() => _NavigationRailExampleState();
}

class _NavigationRailExampleState extends State<NavigationRailExample> {
  int _selectedIndex = 0;

  String url = 'https://youtu.be/y9xchtVTtqQ';

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
    return Row(
      children: <Widget>[
        NavigationRail(
          trailing: const Icon(Icons.menu),
          selectedIndex: _selectedIndex,
          groupAlignment: -1.0,
          onDestinationSelected: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          labelType: NavigationRailLabelType.selected,
          leading: const Icon(Icons.add),
          destinations: const <NavigationRailDestination>[
            NavigationRailDestination(
              icon: Icon(Icons.favorite_border),
              selectedIcon: Icon(Icons.favorite),
              label: Text('Favorite'),
            ),
            NavigationRailDestination(
              icon: Badge(
                child: Icon(Icons.bookmark_border),
              ),
              selectedIcon: Badge(
                child: Icon(Icons.book),
              ),
              label: Text('BookMark'),
            ),
            NavigationRailDestination(
                icon: Badge(
                  label: Text('4'),
                  child: Icon(Icons.star_border),
                ),
                selectedIcon: Badge(
                  label: Text('4'),
                  child: Icon(Icons.star),
                ),
                label: Text('Starred')),
          ],
        ),
        const VerticalDivider(
          thickness: 1,
          width: 1,
        ),
        Expanded(
          child: SingleChildScrollView(
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
                    'Properties of NavigationRail Widget: ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 18, left: 15),
                  child: Text(
                    '1.backgroundColor\n'
                    '2.destination\n'
                    '3.elevation\n'
                    '4.extended\n'
                    '5.groupAlignment\n'
                    '6.indicatorColor\n'
                    '7.indicatorShape\n'
                    '8.labelType\n'
                    '9.leading\n'
                    '10.minExtendedWidth\n'
                    '11.width\n'
                    '12.onDestinationSelected\n'
                    '13.selectedIconTheme\n'
                    '14.selectedIndex\n'
                    '15.selectedLabelTextStyle\n'
                    '16.trailing\n'
                    '17.unselectedIconTheme\n'
                    '18.unselectedLabelTextStyle\n'
                    '19.useIndicator',
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
