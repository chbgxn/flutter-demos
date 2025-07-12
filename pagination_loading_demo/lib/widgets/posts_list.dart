import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/models/post.dart';
import 'package:pagination_loading_demo/providers/posts_provider.dart';

class PostsList extends ConsumerWidget {
  final List<Post> data;
  final ScrollController controller;

  const PostsList({super.key, required this.data, required this.controller});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsAsyncNotifier = ref.read(postsProvider.notifier);

    return RefreshIndicator(
      onRefresh: () => postsAsyncNotifier.refresh(),
      child: ListView.builder(
        controller: controller,
        itemCount: data.length + (postsAsyncNotifier.hasMore ? 1 : 0),
        itemBuilder: (BuildContext context, int index) {
          if(index == data.length && postsAsyncNotifier.hasMore){
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Center(child: CircularProgressIndicator()),
            );
          }
          return Container(
            alignment: Alignment.center,
            margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
            height: 80,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(8)
            ),
            child: ListTile(
              leading: Image.asset('assets/images/default_img.png', height: 30),
              title: Text(
                data[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              subtitle: Text((index+1).toString()),
            ),
          );
        },
      ),
    );
  }
}