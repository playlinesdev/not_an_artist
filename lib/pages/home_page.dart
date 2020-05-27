import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:not_an_artist/core/naa_game.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Size size;

  @override
  void initState() {
    super.initState();

    //initialize NAA with the screen size
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      setState(() {
        size = Size(context.screenWidth, context.screenHeight);
      });
      print('initializing NAA..');
      NAA.initialize(size);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return Scaffold(
      body: _body,
    );
  }

  get _body => size != null
      ? NAA.instance.widget
      : Center(
          child: Container(
            width: 40,
            height: 40,
            child: CircularProgressIndicator(),
          ),
        );
}
