import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:theme_preference_riverpod/models/user.dart';

class UserNotifier extends StateNotifier<User> {
  UserNotifier() :super(User());

  void login(User user){
    state = user;
  }

  void logOut(){
    state = User();
  }
}