import 'dart:io';
import 'package:avatar_replacement/providers/avatar_processor_provider.dart';
import 'package:avatar_replacement/providers/avatar_provider.dart';
import 'package:avatar_replacement/screens/previous_avatar_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AvaterEditScreen extends ConsumerWidget {
  const AvaterEditScreen({super.key});

  Future<void> _imageProcess(WidgetRef ref, String from) async {
    final avatarProcessorState = ref.watch(avatarProcessorProvider);
    final avatarNotifier = ref.read(avatarProvider.notifier);
    
    final image = from == 'camera'
      ? await avatarProcessorState.useCamera()
      : await avatarProcessorState.pickImage();
     
    if(image != null){
      final path = await avatarProcessorState.cropImage(image.path);
      if(path != null){
        avatarNotifier.changeAvatarPath(path);
         await EasyLoading.showSuccess('上传头像成功',
          duration: Duration(seconds: 3)
        );
      }
    }
  }

  void showSelections(BuildContext context, WidgetRef ref){
    final avatarProcessorState = ref.watch(avatarProcessorProvider);
    final avatarPath = ref.watch(avatarProvider);
    showModalBottomSheet(
      context: context, 
      builder: (_) => SizedBox(
        height: MediaQuery.of(context).size.height * 0.3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () async {
                Navigator.pop(context);
                await _imageProcess(ref, 'camera');
              } , 
              child: const Text('拍照')
            ),

            TextButton(
              onPressed:() async {
                Navigator.pop(context);
                await _imageProcess(ref, 'gallery');
              } , 
              child: const Text('从相册中选择')
            ),

            TextButton(
              onPressed:() async {
                Navigator.pop(context);
                final previousPath = await avatarProcessorState.getPreviousAvatar();
                if(previousPath != null && context.mounted){
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (_) => PreviousAvatarScreen(path: previousPath))
                  );
                }
                else{
                  await EasyLoading.showError('没有上一张头像',
                    duration: Duration(seconds: 3)
                  );
                }
              } , 
              child: const Text('查看上一张头像')
            ),

            TextButton(
              onPressed:() async {
                Navigator.pop(context);
                final result =  await avatarProcessorState.savaAvatarToGallery(avatarPath);
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
    final avatarPath = ref.watch(avatarProvider);
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        title: const Text('个人头像'),
        actions: [
          IconButton(
            onPressed: () => showSelections(context, ref), 
            icon: Icon(Icons.more_horiz)
          )
        ],
      ),
      body:Center(
        child: Hero(
          tag: 'avatar', 
          child: avatarPath == 'assets/images/default_avatar.png'
            ? Image.asset(
                'assets/images/default_avatar.png',
                width: MediaQuery.of(context).size.width
              )
            : Image.file(File(avatarPath), width: MediaQuery.of(context).size.width)
        ),
      )
    );
  }
}