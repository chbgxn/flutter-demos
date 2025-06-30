import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends StateNotifier<bool> {
  final String userId;

  ThemeNotifier({required this.userId}) : super(true){
    _loadDataFromPref();
  }

  Future<void> _loadDataFromPref() async{
    final pref = await SharedPreferences.getInstance();
    state = pref.getBool('theme_$userId') ?? true;
  }

  Future<void> toLight() async{
    state = true;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('theme_$userId', true);
  }

  Future<void> toDark() async{
    state = false;
    final pref = await SharedPreferences.getInstance();
    pref.setBool('theme_$userId', false);
  }
}