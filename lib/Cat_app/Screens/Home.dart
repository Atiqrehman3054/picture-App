import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:picture_app/Cat_app/Widget/cat.dart';

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  Animation<double> catAnimation;
  AnimationController catController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    catController = AnimationController(
        duration: Duration(seconds: 2),
        vsync: this
    );
    catAnimation = Tween(begin: 0.0, end: 100.0).animate(
      CurvedAnimation(parent: catController, curve: Curves.easeIn),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold(
      appBar: AppBar(
        title: Text('animation'),

      ),
      body: BuildWidget(),
    ),);
  }

  Widget BuildWidget() {
    return AnimatedBuilder(animation: catAnimation, builder: (context,child){

    },
        child: Cat(),
    );

  }

}
