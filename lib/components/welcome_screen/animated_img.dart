import 'package:flutter/material.dart';

class AnimatedImage extends StatefulWidget {
  @override
  _AnimatedImageState createState() => _AnimatedImageState();
}

class _AnimatedImageState extends State<AnimatedImage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller = AnimationController(
    vsync: this,
    duration: Duration(seconds: 5),
  )..repeat(reverse: true);

  late Animation<Offset> _cloudAnimation = Tween(
    begin: Offset(-0.01, 0),
    end: Offset(0.01, 0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  late Animation<Offset> _cloudAnimation1 = Tween(
    begin: Offset(0.01, 0),
    end: Offset(-0.01, 0),
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      SlideTransition(
        position: _cloudAnimation1,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('images/welcome_img_stack/clouds1.png'),
          height: 200,
        ),
      ),
      SlideTransition(
        position: _cloudAnimation,
        child: Container(
          alignment: Alignment.center,
          child: Image.asset('images/welcome_img_stack/clouds.png'),
          height: 200,
        ),
      ),
    ]);
  }
}
