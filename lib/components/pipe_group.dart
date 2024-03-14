import 'dart:math';

import 'package:flame/components.dart';
import 'package:flappybird_flutter/components/pipe.dart';
import 'package:flappybird_flutter/game/configuration.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flappybird_flutter/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappybirdGame> {
  PipeGroup();

  final _random = Random();

  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;

    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacingBetweenPipes =
        100 + _random.nextDouble() * (heightMinusGround / 4);
    final centerY = spacingBetweenPipes +
        _random.nextDouble() * (heightMinusGround - spacingBetweenPipes);

    addAll([
      //top pipe
      Pipe(
          pipePosition: PipePosition.top,
          height: (centerY - spacingBetweenPipes / 2)),
      // bottom pipe
      Pipe(
          pipePosition: PipePosition.bottom,
          height: heightMinusGround - (centerY + spacingBetweenPipes / 2)),
    ]);
  }
  void updateScore(){
    gameRef.bird.score += 1;
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -30) {
      removeFromParent();
      updateScore();
    }

    if (gameRef.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }
  void updateScore(){
    gameRef.bird.score += 1;
  }
}
