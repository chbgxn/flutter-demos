import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pagination_loading_demo/providers/posts_provider.dart';
import 'package:pagination_loading_demo/utils/show_toast.dart';

class PostsError extends ConsumerStatefulWidget {
  final String msg;
  final BuildContext context;
  const PostsError({super.key, required this.msg, required this.context});

  @override
  ConsumerState createState() => _PostsErrorState();
}

class _PostsErrorState extends ConsumerState<PostsError> {
  late final String _msg;
  late final BuildContext _context;

  @override
  void initState() {
    super.initState();
    _msg = widget.msg;
    _context = widget.context;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await showToast(_context, _msg);
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
 
  @override
  Widget build(BuildContext context) {
    final postsAsyncNotifier = ref.read(postsProvider.notifier);
    return RefreshIndicator(
      onRefresh: () => postsAsyncNotifier.refresh(),
      child: ListView(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height/3),
          const Text('出错了', textAlign: TextAlign.center,),
          TextButton(
            onPressed: () async {
              await postsAsyncNotifier.refresh();
            }, 
            child: const Text('重试')
          )
        ],
      ),
    );
  }
}