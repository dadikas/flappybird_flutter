import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flappybird_flutter/game/pipe_position.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/configuration.dart';

class Pipe extends SpriteComponent with HasGameRef<FlappybirdGame> {
  @override
  final double height;
  final PipePosition pipePosition;

  Pipe({
    required this.height,
    required this.pipePosition,
  });

  @override
  Future<void> onLoad() async {
    final pipe = await Flame.images.load(Assets.pipe);
    final pipeRotated = await Flame.images.load(Assets.pipeRotated);
    size = Vector2(50, height);

    switch (pipePosition) {
      case PipePosition.top:
        position.y = 0;
        sprite = Sprite(pipeRotated);
        break;
      case PipePosition.bottom:
        position.y = gameRef.size.y - size.y - Config.groundHeight;
        sprite = Sprite(pipe);
        break;
    }
    add(RectangleHitbox());
  }
}
