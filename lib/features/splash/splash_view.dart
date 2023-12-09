import 'package:booky/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../home/presentation/views/home_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<Offset> imageAnimation;
  late Animation<Offset> textAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(
        seconds: 1,
      ),
    );
    imageAnimation = Tween(
      begin: const Offset(-10, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.linearToEaseOut,
      ),
    );
    textAnimation = Tween(
      begin: const Offset(10, 0),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.bounceIn,
      ),
    );
    animationController.forward();
    // animationController.addListener(() {
    //   setState(() {});
    // });

    Future.delayed(const Duration(seconds: 2), () {
      context.pushReplacement('/$homeViewPath' ,);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          AnimatedBuilder(
            animation: imageAnimation,
            builder: (context, child) {
              return SlideTransition(
                position: imageAnimation,
                child: SvgPicture.asset(
                  logo,
                  height: 60,
                  width: 30,
                ),
              );
            },
          ),
          const SizedBox(
            height: 25,
          ),
          AnimatedBuilder(
            animation: textAnimation,
            builder: (context, _) {
              return SlideTransition(
                position: textAnimation,
                child: const Text(
                  'Welcome to Bookly App',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
