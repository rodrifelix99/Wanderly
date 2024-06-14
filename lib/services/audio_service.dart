import 'package:just_audio/just_audio.dart';

class AudioService {
  final _player = AudioPlayer();

  Future<void> playAudio(String path)  async {
    if (_player.playing) {
      await _player.stop();
    }
    await _player.setAsset(path);
    await _player.play();
  }

  Future<void> pauseAudio() async {
    await _player.pause();
  }

  Future<void> stopAudio() async {
    await _player.stop();
  }

  Future<void> dispose() async {
    await _player.dispose();
  }

  Future<void> seekAudio(Duration position) async {
    await _player.seek(position);
  }

  Stream<Duration?> get durationStream => _player.durationStream;
  Stream<Duration?> get positionStream => _player.positionStream;
  Stream<PlayerState> get playerStateStream => _player.playerStateStream;
}