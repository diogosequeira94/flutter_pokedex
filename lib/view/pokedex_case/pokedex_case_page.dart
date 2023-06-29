import 'package:flutter/material.dart';

class PokedexPageCase extends StatefulWidget {
  const PokedexPageCase({Key? key}) : super(key: key);

  @override
  State<PokedexPageCase> createState() => _PokedexPageCaseState();
}

class _PokedexPageCaseState extends State<PokedexPageCase> with TickerProviderStateMixin {
  late AnimationController topAnimationController;
  late AnimationController bottomAnimationController;
  late Animation<Offset> topOffsetAnimation;
  late Animation<Offset> bottomOffsetAnimation;

  @override
  void initState() {
    super.initState();
    topAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    bottomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    topOffsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: topAnimationController, curve: Curves.easeIn),
    );
    bottomOffsetAnimation = Tween<Offset>(begin: const Offset(1.0, 0.0), end: Offset.zero).animate(
      CurvedAnimation(parent: bottomAnimationController, curve: Curves.easeIn),
    );
  }

  @override
  void dispose() {
    topAnimationController.dispose();
    bottomAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () {
          topAnimationController.forward();
          bottomAnimationController.forward();
        },
        child: Stack(
          fit: StackFit.expand,
          children: [
            SlideTransition(
              position: topOffsetAnimation,
              child: Image.asset(
                'assets/pokedex-upper.png',
                fit: BoxFit.fill,
              ),
            ),
            SlideTransition(
              position: bottomOffsetAnimation,
              child: Image.asset(
                'assets/pokedex-lower.png',
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
