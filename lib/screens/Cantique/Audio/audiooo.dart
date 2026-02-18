import 'package:eccofficiel/screens/Cantique/Audio/playlistprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PlayerPage extends StatelessWidget {
  const PlayerPage({super.key});

  String format(Duration d) =>
      "${d.inMinutes.remainder(60).toString().padLeft(2, '0')}:${d.inSeconds.remainder(60).toString().padLeft(2, '0')}";

  @override
  Widget build(BuildContext context) {
    final audio = Provider.of<AudioProvider>(context);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.black, Colors.deepPurple],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.music_note, size: 120, color: Colors.white),

              const SizedBox(height: 20),

              Text(
                audio.playlist[audio.currentIndex].title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              StreamBuilder<Duration>(
                stream: audio.player.positionStream,
                builder: (_, snapshot) {
                  final pos = snapshot.data ?? Duration.zero;
                  final dur = audio.player.duration ?? Duration.zero;

                  return Column(
                    children: [
                      Slider(
                        min: 0,
                        max: dur.inSeconds.toDouble(),
                        value: pos.inSeconds
                            .clamp(0, dur.inSeconds)
                            .toDouble(),
                        onChanged: (v) =>
                            audio.player.seek(Duration(seconds: v.toInt())),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(format(pos), style: const TextStyle(color: Colors.white)),
                            Text(format(dur), style: const TextStyle(color: Colors.white)),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous, color: Colors.white),
                    iconSize: 48,
                    onPressed: audio.previous,
                  ),
                  IconButton(
                    icon: Icon(
                      audio.player.playing
                          ? Icons.pause_circle
                          : Icons.play_circle,
                      color: Colors.white,
                    ),
                    iconSize: 80,
                    onPressed: audio.playPause,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next, color: Colors.white),
                    iconSize: 48,
                    onPressed: audio.next,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
