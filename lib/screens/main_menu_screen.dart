import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MainMenuScreen extends StatelessWidget {
  final FlappybirdGame game;
  static const String id = 'mainMenu';

  const MainMenuScreen({super.key, required this.game});

  // remove this overlays and start the game
  void clickToMainMenu() {
    game.overlays.remove(id);
    game.resumeEngine();
  }

  @override
  Widget build(BuildContext context) {
    game.pauseEngine();

    return Scaffold(
      body: GestureDetector(
        onTap: clickToMainMenu,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.menu),
              fit: BoxFit.cover,
            ),
          ),
          child: Image.asset(Assets.message),
        ),
      ),
    );
  }
}
