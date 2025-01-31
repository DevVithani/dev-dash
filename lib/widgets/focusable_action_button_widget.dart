import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:dev_dash/ui/packages/lib/widget_with_codeview.dart';


class FadButton extends StatefulWidget {
  const FadButton({
    super.key,
    required this.onPressed,
    required this.child,
  });

  final VoidCallback onPressed;
  final Widget child;

  @override
  State<FadButton> createState() => _FadButtonState();
}

class _FadButtonState extends State<FadButton> {
  bool _focused = false;
  bool _hovering = false;
  bool _on = false;
  late final Map<Type, Action<Intent>> _actionMap;
  final Map<ShortcutActivator, Intent> _shortcutMap =
      const <ShortcutActivator, Intent>{
    SingleActivator(LogicalKeyboardKey.keyX): ActivateIntent(),
  };

  @override
  void initState() {
    super.initState();
    _actionMap = <Type, Action<Intent>>{
      ActivateIntent: CallbackAction<Intent>(
        onInvoke: (Intent intent) => _toggleState(),
      ),
    };
  }

  Color get color {
    Color baseColor = Colors.lightBlue;
    if (_focused) {
      baseColor = Color.alphaBlend(Colors.black, baseColor);
    }
    if (_hovering) {
      baseColor = Color.alphaBlend(Colors.black, baseColor);
    }
    return baseColor;
  }

  void _toggleState() {
    setState(() {
      _on = !_on;
    });
  }

  void _handleFocusHighlight(bool value) {
    setState(() {
      _focused = value;
    });
  }

  void _handleHoveHighlight(bool value) {
    setState(() {
      _hovering = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleState,
      child: FocusableActionDetector(
        actions: _actionMap,
        shortcuts: _shortcutMap,
        onShowFocusHighlight: _handleFocusHighlight,
        onShowHoverHighlight: _handleHoveHighlight,
        child: Row(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(10.0),
              color: color,
              child: widget.child,
            ),
            Container(
              width: 30,
              height: 30,
              margin: const EdgeInsets.all(10.0),
              color: _on ? Colors.red : Colors.transparent,
            ),
          ],
        ),
      ),
    );
  }
}

class FocusableActionButtonWidget extends StatefulWidget {
  const FocusableActionButtonWidget({super.key});

  @override
  State<FocusableActionButtonWidget> createState() =>
      _FocusableActionButtonWidgetState();
}

class _FocusableActionButtonWidgetState
    extends State<FocusableActionButtonWidget> {


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
          'FocusableAction Detector',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: const Expanded(
        flex: 1,
        child: WidgetWithCodeView(
          filePath: 'lib/widgets/focusable_action_button_widget.dart',
          iconBackgroundColor: Colors.black,
          iconForegroundColor: Colors.white,
          codeLinkPrefix: 'https://google.com?q=',
          codeContent: '''
          import 'package:flutter/material.dart';
          import 'package:flutter/services.dart';
          
          class FadButton extends StatefulWidget {
          const FadButton({
            super.key,
            required this.onPressed,
            required this.child,
          });
        
          final VoidCallback onPressed;
          final Widget child;
        
          @override
          State<FadButton> createState() => _FadButtonState();
        }
        
        class _FadButtonState extends State<FadButton> {
          bool _focused = false;
          bool _hovering = false;
          bool _on = false;
          late final Map<Type, Action<Intent>> _actionMap;
          final Map<ShortcutActivator, Intent> _shortcutMap =
        const <ShortcutActivator, Intent>{
            SingleActivator(LogicalKeyboardKey.keyX): ActivateIntent(),
          };
        
          @override
          void initState() {
            super.initState();
            _actionMap = <Type, Action<Intent>>{
        ActivateIntent: CallbackAction<Intent>(
          onInvoke: (Intent intent) => _toggleState(),
        ),
            };
          }
        
          Color get color {
            Color baseColor = Colors.lightBlue;
            if (_focused) {
        baseColor = Color.alphaBlend(Colors.black.withOpacity(0.25), baseColor);
            }
            if (_hovering) {
        baseColor = Color.alphaBlend(Colors.black.withOpacity(0.1), baseColor);
            }
            return baseColor;
          }
        
          void _toggleState() {
            setState(() {
        _on = !_on;
            });
          }
        
          void _handleFocusHighlight(bool value) {
            setState(() {
        _focused = value;
            });
          }
        
          void _handleHoveHighlight(bool value) {
            setState(() {
        _hovering = value;
            });
          }
        
          @override
          Widget build(BuildContext context) {
            return GestureDetector(
        onTap: _toggleState,
        child: FocusableActionDetector(
          actions: _actionMap,
          shortcuts: _shortcutMap,
          onShowFocusHighlight: _handleFocusHighlight,
          onShowHoverHighlight: _handleHoveHighlight,
          child: Row(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.all(10.0),
                color: color,
                child: widget.child,
              ),
              Container(
                width: 30,
                height: 30,
                margin: const EdgeInsets.all(10.0),
                color: _on ? Colors.red : Colors.transparent,
              ),
            ],
          ),
        ),
            );
          }
        }''',
          child: FocusableExample(),
        ),
      ),
    );
  }
}

class FocusableExample extends StatefulWidget {
  const FocusableExample({super.key});

  @override
  State<FocusableExample> createState() => _FocusableExampleState();
}

class _FocusableExampleState extends State<FocusableExample> {

  String url = 'https://youtu.be/R84AGg0lKs8';

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
              'Properties of FocusableAction Detector Widget: ',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 18, left: 15),
            child: Text(
              '1.actions\n'
              '2.autofocus\n'
              '3.child\n'
              '4.descendantsAreFocusable\n'
              '4.descendantsAreTraversable\n'
              '5.enabled\n'
              '6.focusNode\n'
              '7.includeFocusSemantics\n'
              '8.mouseCursor\n'
              '9.onFocusChange\n'
              '10.onShowFocusHighlight\n'
              '11.onShowHoverHighlight\n'
              '12.shortcuts',
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
                  fontSize: 17,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextButton(
                    onPressed: () {},
                    child: const Text('Press Here'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadButton(
                    onPressed: () {},
                    child: const Text('And Here'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
