import 'package:flame/game.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flappybird_flutter/screens/game_over_screen.dart';
import 'package:flappybird_flutter/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlappybirdGame();
  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        MainMenuScreen.id: (context, _) => MainMenuScreen(game: game),
        GameOverScreen.id: (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
