import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird_flutter/components/background.dart';
import 'package:flappybird_flutter/components/bird.dart';
import 'package:flappybird_flutter/components/ground.dart';
import 'package:flappybird_flutter/components/pipe_group.dart';
import 'package:flappybird_flutter/game/configuration.dart';


class FlappybirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  FlappybirdGame();

  late Bird bird;
  late TextComponent score;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = BuildScore()
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }
    TextComponent BuildScore(){
    return TextComponent(
      text: "Score: 0",
      position: Vector2(size.x/2 ,size.y/2 *0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, fontFamily: "Game"
       ),
      )
    );
  }



  @override
  void update(double dt) {
    super.update(dt);

    interval.update(dt);
    score.text = 'score: ${bird.score}';
  }
}
