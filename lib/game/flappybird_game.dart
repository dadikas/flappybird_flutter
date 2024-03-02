import 'package:flame/game.dart';
import 'package:flappybird_flutter/components/background.dart';
import 'package:flappybird_flutter/components/bird.dart';
import 'package:flappybird_flutter/components/ground.dart';
import 'package:flappybird_flutter/components/pipe_group.dart';

class FlappybirdGame extends FlameGame {
  late Bird bird;
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);
  }
}
