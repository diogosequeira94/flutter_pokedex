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
  var wasTapped = false;

  @override
  void initState() {
    super.initState();
    topAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );
    bottomAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    topOffsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, -1.0)).animate(
      CurvedAnimation(parent: topAnimationController, curve: Curves.easeIn),
    );
    bottomOffsetAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0.0, 1.0)).animate(
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
            setState(() {
              wasTapped = true;
              topAnimationController.forward();
              bottomAnimationController.forward().whenComplete(() {
                Navigator.of(context).pushReplacementNamed('/home');
              });
            });
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              const Center(child: CircularProgressIndicator()),
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
              Padding(
                padding: const EdgeInsets.only(top: 40.0),
                child: AnimatedOpacity(
                  opacity: wasTapped ? 0.0 : 1.0,
                  duration: const Duration(milliseconds: 500),
                  child: const Center(
                    child: Text(
                      'Tap to open Pokédex',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}
