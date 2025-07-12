import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/network/api_endpoint.dart';
import 'package:pagination_loading_demo/models/post.dart';
import 'package:pagination_loading_demo/providers/dio_provider.dart';

class PostsNotifiter extends AsyncNotifier<List<Post>> {
  static const int pageSize = 10;
  int currentPage = 0;
  bool hasMore = true;

  @override
  Future<List<Post>> build() async {
    return [];
  }

  Future<void> loadNextPage() async {
    if(!hasMore || state is AsyncLoading) return;

    currentPage == 0
      ?state = AsyncLoading()
      :await Future.delayed(Duration(seconds: 2));
    
    try{
      final apiService = ref.read(dioProvider);
      final responese = await apiService.get(ApiEndpoint.networkPosts, queryParameters: {
        '_page': currentPage + 1,
        '_limit': pageSize,
      });
      final List<dynamic> data = responese.data;
      final newPosts = data.map((item) => Post.fromJson(item)).toList();

      final totCount = int.parse(responese.headers['x-total-count']?.first ?? '0');
      hasMore = (state.value!.length + newPosts.length) < totCount;
      
      state = AsyncData([...state.value!, ...newPosts]);
      currentPage++;
    }catch(e, stackTrace){
      state = AsyncError(e.toString().replaceFirst('Exception: ', ''), stackTrace);
    }
  }

  Future<void> refresh() async {
    currentPage = 0;
    hasMore = true;
    state = AsyncData([]);
    await loadNextPage();
  }
}