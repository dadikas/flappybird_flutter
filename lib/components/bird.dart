import 'package:flame/components.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/bird_movement.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';

class Bird extends SpriteGroupComponent<bird_movement> with HasGameRef<FlappybirdGame>{
  Bird();
  @override
  Future<void> onLoad() async{
    final birdMidflap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
    size = Vector2(50,40);
    position = Vector2(70, gameRef.size.y/2 -size.y/2);
    current = bird_movement.middle;
    sprites = {
      bird_movement.middle: birdMidflap,
      bird_movement.down:birdDownFlap,
      bird_movement.up:birdUpFlap
    };
  }

}