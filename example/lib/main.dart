import 'package:emoji_chooser/emoji_chooser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.blue,
      ),
      themeMode: ThemeMode.system,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  EmojiData? _emojiData;
  double _chooserWidthPercent = 1.0;
  double _chooserHeightPercent = 1.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emojis'),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30.0, left: 30.0, right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    _emojiData == null
                        ? 'No emoji selected'
                        : 'Selected ${_emojiData?.char}',
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: 'Apple Color Emoji',
                    ),
                  ),
                  Slider(
                    value: _chooserWidthPercent,
                    label: 'Width',
                    onChanged: (double value) {
                      setState(() {
                        _chooserWidthPercent = value;
                      });
                    },
                  ),
                  Slider(
                    value: _chooserHeightPercent,
                    label: 'Height',
                    onChanged: (double value) {
                      setState(() {
                        _chooserHeightPercent = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: Builder(
                builder: (context) {
                  final size = MediaQuery
                      .of(context)
                      .size;

                  return Center(
                    child: SizedBox(
                      width: size.width * _chooserWidthPercent,
                      height: size.height * _chooserHeightPercent,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          border: Border.fromBorderSide(
                            BorderSide(color: Colors.white),
                          ),
                        ),
                        child: EmojiChooser(
                          onSelected: (emoji) {
                            setState(() {
                              _emojiData = emoji;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
