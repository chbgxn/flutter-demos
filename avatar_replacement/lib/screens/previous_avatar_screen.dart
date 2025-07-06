import 'dart:io';
import 'package:avatar_replacement/providers/avatar_processor_provider.dart';
import 'package:avatar_replacement/providers/avatar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PreviousAvatarScreen extends ConsumerWidget {
  final String path;
  const PreviousAvatarScreen({super.key, required this.path});

  void showSelections(BuildContext context, WidgetRef ref){
    final avatarProcessorState = ref.watch(avatarProcessorProvider);
    showModalBottomSheet(
      context: context, 
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.2,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed:() async {
                Navigator.pop(context);
                final result =  await avatarProcessorState.savaAvatarToGallery(path);
                result
                  ? await EasyLoading.showSuccess('保存成功',
                    duration: Duration(seconds: 3)
                  )
                  : await EasyLoading.showError('保存失败',
                    duration: Duration(seconds: 3)
                  );
              } , 
              child: const Text('保存此头像')
            ),
            TextButton(
              onPressed: () => Navigator.pop(context), 
              child: const Text('取消')
            )
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarNotifier = ref.read(avatarProvider.notifier);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('上一张头像'),
        actions: [
          IconButton(
            onPressed: () => showSelections(context, ref),
            icon: Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Center(
        child: path == 'assets/images/default_avatar.png'
          ? Image.asset(
              'assets/images/default_avatar.png',
              width: MediaQuery.of(context).size.width
            )
          : Image.file(File(path), width: MediaQuery.of(context).size.width)
        
      ),
      bottomNavigationBar: SafeArea(
        child: Container(
          height: 80,
          width: MediaQuery.of(context).size.width,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Colors.black45
          ),
          child: GestureDetector(
            onTap: () async {
              await EasyLoading.show(indicator: CircularProgressIndicator());
              await Future.delayed(Duration(seconds: 3));
              await EasyLoading.dismiss();
              avatarNotifier.changeAvatarPath(path);
              if(context.mounted){
                Navigator.pop(context);
              }
            },
            child: Text(
              '使用此头像', 
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),
            )
          ),
        ),
      )
    );
  }
}