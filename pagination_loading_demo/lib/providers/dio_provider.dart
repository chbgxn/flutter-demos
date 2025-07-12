import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/network/dio_client.dart';

final dioProvider = Provider<DioClient>((ref) => DioClient());