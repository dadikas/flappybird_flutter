import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GameOverScreen extends StatelessWidget {
  final FlappybirdGame game;
  static const String id = 'gameOver';

  const GameOverScreen({super.key, required this.game});

  void onRestartGame() {
    game.bird.reset();
    game.overlays.remove(id);
    game.resumeEngine();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black38,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(Assets.gameOver),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: onRestartGame,
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateColor.resolveWith((states) => Colors.orange),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    const RoundedRectangleBorder(
                      side: BorderSide(color: Colors.orange),
                      borderRadius: BorderRadius.zero,
                    ),
                  ),
                ),
                child: const Text(
                  'RESTART',
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
