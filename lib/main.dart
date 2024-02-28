import 'package:flame/game.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flutter/material.dart';

void main(){
  final game = FlappybirdGame();
  runApp(
    GameWidget(game: game),
  );
}