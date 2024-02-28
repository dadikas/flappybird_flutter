import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/parallax.dart';
import 'package:flappybird_flutter/game/assets.dart';
import 'package:flappybird_flutter/game/configuration.dart';
import 'package:flappybird_flutter/game/flappybird_game.dart';

class Ground extends ParallaxComponent<FlappybirdGame> {
  Ground();

  @override
  Future<void> onLoad() async {
    final ground = await Flame.images.load(Assets.ground);

    parallax = Parallax([
      ParallaxLayer(
        ParallaxImage(
          ground,
          fill: LayerFill.none,
        ),
      ),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);

    parallax?.baseVelocity.x = Config.gameSpeed;
  }
}
