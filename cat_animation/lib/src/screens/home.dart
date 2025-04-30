import 'package:flutter/material.dart';
import '../widgets/cat.dart';
import 'dart:math' as math;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController catController;
  late Animation<double> catAnimation;

  late Animation<double> boxAnimation;
  late AnimationController boxController;

  @override
  void initState() {
    super.initState();

    boxController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    boxAnimation = Tween(
      // Angles as Radians.
      begin: math.pi * 0.6,
      end: math.pi * 0.65,
    ).animate(
      CurvedAnimation(
        parent: boxController,
        curve: Curves.easeOut,
      ),
    );

    applyBoxAnimationStatusListener(boxAnimation);

    // Start / play the Cardboard Box animation.
    boxController.forward();

    catController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    catAnimation = Tween(begin: -35.0, end: -80.0).animate(
      CurvedAnimation(
        parent: catController,
        curve: Curves.easeIn,
      ),
    );

    // Start / play the animation.
    catController.forward();
  }

  void applyBoxAnimationStatusListener(Animation<double> inputBoxAnimation) {
    inputBoxAnimation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        // Reverse the animation.
        boxController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        // Forward the animation.
        boxController.forward();
      }
    });
  }

  void onTapGesture() {
    if (catController.status == AnimationStatus.completed) {
      boxController.forward();
      // Reverse the animation.
      catController.reverse();
    } else if (catController.status == AnimationStatus.dismissed) {
      boxController.stop();
      // Forward the animation.
      catController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'AppBar: Animation!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: GestureDetector(
        onTap: onTapGesture,
        child: Center(
          child: Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            children: [
              buildCatAnimation(),
              buildBox(),
              buildLeftFlap(),
              buildRightFlap(),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildCatAnimation() {
    return AnimatedBuilder(
        animation: catAnimation,
        builder: (context, child) {
          return Positioned(
            top: catAnimation.value,
            right: 0.0,
            left: 0.0,
            child: const Cat(),
          );
        });
  }

  Widget buildBox() {
    return Container(
      width: 200.0,
      height: 200.0,
      color: Colors.brown,
    );
  }

  Widget buildLeftFlap() {
    return Positioned(
      // Make the cardboard flap appear like it is connected to the
      // main box (rather than a sub-1-pixel corner-connection).
      left: 3.0,
      top: 0.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          width: 125.0,
          height: 10.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          // Rotations occur around the center-point of the Widget, by default.
          return Transform.rotate(
            // Change the pivot point to top-left corner of the rectangle.
            alignment: Alignment.topLeft,
            angle: boxAnimation.value,
            // The rectangle Container.
            child: child,
          );
        },
      ),
    );
  }

  Widget buildRightFlap() {
    return Positioned(
      right: 3.0,
      top: 0.0,
      child: AnimatedBuilder(
        animation: boxAnimation,
        child: Container(
          width: 125.0,
          height: 10.0,
          color: Colors.brown,
        ),
        builder: (context, child) {
          // Rotations occur around the center-point of the Widget, by default.
          return Transform.rotate(
            // Change the pivot point to top-right corner of the rectangle.
            alignment: Alignment.topRight,
            angle: boxAnimation.value * -1,
            // The rectangle Container.
            child: child,
          );
        },
      ),
    );
  }
}
