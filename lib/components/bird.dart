import 'package:flame/components.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/bird_movement.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';

class Bird extends SpriteGroupComponent<Bird_movement> with HasGameRef<FlappybirdGame>{
  Bird();
  @override
  Future<void> onLoad() async{
    final birdMidflap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50,40);
    position = Vector2(70, gameRef.size.y/2 -size.y/2);
    current = Bird_movement.middle;
    sprites = {
      Bird_movement.middle: birdMidflap,
      Bird_movement.down:birdDownFlap,
      Bird_movement.up:birdUpFlap
    };
  }

}