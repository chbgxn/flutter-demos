import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/providers/posts_provider.dart';
import 'package:pagination_loading_demo/widgets/posts_error.dart';
import 'package:pagination_loading_demo/widgets/posts_list.dart';
import 'package:pagination_loading_demo/widgets/shimmer_loading.dart';

class PostsScreen extends ConsumerStatefulWidget {
  const PostsScreen({super.key});

  @override
  ConsumerState createState() => _PostsScreenState();
}

class _PostsScreenState extends ConsumerState<PostsScreen> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(postsProvider.notifier).loadNextPage();
    });
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        ref.read(postsProvider.notifier).loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final postsAsync = ref.watch(postsProvider);
    
    return Scaffold(
      appBar: AppBar(title: const Text('分页请求数据')),
      body: postsAsync.when(
        data: (data) => PostsList(data: data, controller: _scrollController),
        error: (e, stack){
          return PostsError(msg: e.toString(), context: context);
        },
        loading: () => ShimmerLoading(),
      ),
    );
  }
}