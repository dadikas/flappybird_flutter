import 'package:flame/game.dart';
import 'package:flappybird_flutter/components/background.dart';
import 'package:flappybird_flutter/components/ground.dart';

class FlappybirdGame extends FlameGame {
  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
    ]);
  }
}
