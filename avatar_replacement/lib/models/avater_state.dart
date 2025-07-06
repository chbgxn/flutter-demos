import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarNotifier extends StateNotifier<String> {
  AvatarNotifier():super('assets/images/default_avatar.png'){
    _readAvatarPath();
  }

  Future<void> _readAvatarPath() async {
    final perf = await SharedPreferences.getInstance();
    state = perf.getString('avatarPath') ?? 'assets/images/default_avatar.png';
  }

  Future<void> changeAvatarPath(String newPath) async{
    final perf = await SharedPreferences.getInstance();
    String? previousAvatarPath = perf.getString('avatarPath');
    perf.setString('previousAvatarPath', previousAvatarPath ?? 'assets/images/default_avatar.png');
    perf.setString('avatarPath', newPath);
    state = newPath;
  }
}