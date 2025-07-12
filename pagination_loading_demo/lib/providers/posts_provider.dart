import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/models/posts_notifiter.dart';
import 'package:pagination_loading_demo/models/post.dart';

final postsProvider = AsyncNotifierProvider<PostsNotifiter, List<Post>>(() => PostsNotifiter());