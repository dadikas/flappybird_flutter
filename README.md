# flappybird_flutter

# Issues
- Cannot import FLAME
    - Reasons: SDK version is imcompatible with this app
    - Solutions:
        - upgrade SDK version with a command: **flutter upgrade**
        - then, use the FLAME dependency with a command: **flutter pub get**

- Cannot show images
    - Reasons: flutter cannot find images
    - Solutions:
        - add an 'assets' into 'flutter' of pubspec.yaml file
        ```
            flutter:
                assets:
                - assets/images/
                - assets/audio/

                fonts:
                    - family: Game     
                    fonts:
                        - asset: assets/fonts/Game.ttf
        ```