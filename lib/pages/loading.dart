import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Fade();
}

class _Fade extends State<Loading> with TickerProviderStateMixin {
  AnimationController? animation;
  Animation<double>? _fadeInFadeOut;

  @override
  void initState() {
    animation = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );
    _fadeInFadeOut = Tween<double>(begin: 1, end: 0).animate(animation!);

    animation?.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animation?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        animation?.forward();
      }
    });
    animation?.forward();
    super.initState();
  }

  @override
  dispose() {
    animation?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: FadeTransition(
              opacity: _fadeInFadeOut!,
              child: Container(
                color: Colors.white,
                child: Center(
                    child: SpinKitChasingDots(
                  color: Colors.red,
                  size: 50.0,
                )),
              )),
        ),
      ),
    );
  }
}
