import 'package:flutter/material.dart';
import 'package:flutter_volume_controller/flutter_volume_controller.dart';

class SakenaView extends StatelessWidget {
  SakenaView({super.key});

  dynamic volume;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () async {
              volume = await FlutterVolumeController.getVolume();
              FlutterVolumeController.setMute(true);
            },
            icon: const Icon(Icons.volume_off_rounded),
            iconSize: 50,
          ),
          const SizedBox(
            height: 100,
          ),
          IconButton(
            onPressed: () {
              FlutterVolumeController.setVolume(volume);
            },
            icon: const Icon(Icons.volume_up_rounded),
            iconSize: 50,
          ),
        ],
      ),
    );
  }
}
