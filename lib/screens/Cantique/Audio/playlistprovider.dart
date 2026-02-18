import 'package:eccofficiel/models/audio.dart';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

class AudioProvider extends ChangeNotifier {
  final AudioPlayer player = AudioPlayer();

  final List<Song> playlist = [
    Song(
      title: "Cantique de louange",
      artist: "Chorale",
      asset: "assets/audios/cantique1.mp3",
    ),
    Song(
      title: "Adoration",
      artist: "Groupe",
      asset: "assets/audios/cantique2.mp3",
    ),
  ];

  int currentIndex = 0;

  Future<void> init() async {
    await player.setAudioSource(
      ConcatenatingAudioSource(
        children: playlist
            .map(
              (song) => AudioSource.asset(
                song.asset,
                tag: MediaItem(
                  id: song.asset,
                  title: song.title,
                  artist: song.artist,
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  void playPause() {
    player.playing ? player.pause() : player.play();
    notifyListeners();
  }

  void next() => player.seekToNext();
  void previous() => player.seekToPrevious();
}
