import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_preference_riverpod/models/theme_notifier.dart';

final themeProvider = StateNotifierProvider.family<ThemeNotifier, bool, String>((ref, userId){
  return ThemeNotifier(userId: userId);
});