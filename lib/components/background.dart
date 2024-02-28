import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlappybirdGame> {
  Background();

  @override
  Future<void> onLoad() async {
    final background = await Flame.images.load(Assets.background);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
