import 'package:flame/collisions.dart';
import 'package:flame/components.dart';
import 'package:flame/effects.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/bird_movement.dart';
import 'package:flappybird_flutter/game/configuration.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flutter/cupertino.dart';

<<<<<<< HEAD
class Bird extends SpriteGroupComponent<BirdMovement> with
    HasGameRef<FlappybirdGame>, CollisionCallbacks{
=======
class Bird extends SpriteGroupComponent<BirdMovement> with HasGameRef<FlappybirdGame>{
>>>>>>> parent of 280fefe (make clean code to previous commit)
  Bird();
  @override
  Future<void> onLoad() async{
    final birdMidflap = await gameRef.loadSprite(Assets.birdMidFlap);
    final birdUpFlap = await gameRef.loadSprite(Assets.birdUpFlap);
    final birdDownFlap = await gameRef.loadSprite(Assets.birdDownFlap);
<<<<<<< HEAD

    gameRef.bird;

=======
>>>>>>> parent of 280fefe (make clean code to previous commit)
    size = Vector2(50,40);
    position = Vector2(70, gameRef.size.y/2 -size.y/2);
    current = BirdMovement.middle;
    sprites = {
      BirdMovement.middle: birdMidflap,
      BirdMovement.down:birdDownFlap,
      BirdMovement.up:birdUpFlap
    };

    add(CircleHitbox());
  }

 void fly(){
  add(
    MoveByEffect(
      Vector2(0, Config.gravity),
      EffectController(duration: 0.2),
      onComplete: ()=>current = BirdMovement.down
      ),

  );
  current =  BirdMovement.up;
 }
<<<<<<< HEAD
  @override
  void onCollisionStart(Set<Vector2> intersectionPoints,
                        PositionComponent other){

    super.onCollisionStart(intersectionPoints, other);
    debugPrint('collision detected');
    gameOver();
  }
  void gameOver(){
    gameRef.pauseEngine();
  }
=======
>>>>>>> parent of 280fefe (make clean code to previous commit)

  @override
  void update(double dt){
    super.update(dt);
    position.y  += Config.birdVerlocity *  dt;
  }
}