import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_preference_riverpod/models/user.dart';
import 'package:theme_preference_riverpod/models/user_notifier.dart';

final userProvider = StateNotifierProvider<UserNotifier, User>((ref){
  return UserNotifier();
});