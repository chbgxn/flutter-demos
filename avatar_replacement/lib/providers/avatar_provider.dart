import 'package:avatar_replacement/models/avater_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final avatarProvider = StateNotifierProvider<AvatarNotifier, String>((ref) => AvatarNotifier());