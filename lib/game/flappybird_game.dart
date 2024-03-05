import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flappybird_flutter/components/background.dart';
import 'package:flappybird_flutter/components/bird.dart';
import 'package:flappybird_flutter/components/ground.dart';
import 'package:flappybird_flutter/components/pipe_group.dart';
import 'package:flappybird_flutter/game/configuration.dart';

class FlappybirdGame extends FlameGame with TapDetector {
  FlappybirdGame();

  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);

  @override
  Future<void> onLoad() async {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }
  @override
  void onTap(){
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);

    interval.update(dt);
  }
}
