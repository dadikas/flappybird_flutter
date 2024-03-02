import 'package:flame/components.dart';
import 'package:flappybird_flutter/components/pipe.dart';
import 'package:flappybird_flutter/game/configuration.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';
import 'package:flappybird_flutter/game/pipe_position.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlappybirdGame> {
  PipeGroup();
  @override
  Future<void> onLoad() async {
    position.x = gameRef.size.x;
    addAll([
      Pipe(pipePosition: PipePosition.top, height: 100),
      Pipe(pipePosition: PipePosition.bottom, height: 200),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;
  }
}
