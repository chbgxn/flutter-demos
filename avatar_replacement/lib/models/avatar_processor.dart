import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_gallery_saver_plus/image_gallery_saver_plus.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AvatarProcessor {
  Future<String?> cropImage(String path) async {
    try{
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        compressFormat: ImageCompressFormat.jpg,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            toolbarTitle: '裁剪图片',
            toolbarColor: Colors.blue,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: true,
            aspectRatioPresets: [
              CropAspectRatioPreset.square
            ]
          )
          //IOSSetting
          //WebSeeting?
        ]
      );
      return croppedFile?.path;
    } catch(e){
      rethrow;
    }
  }

  Future<XFile?> useCamera() async {
    try{
      var status = await Permission.camera.status;
      if(status.isDenied){
        status = await Permission.camera.request();
      }
      if(status.isPermanentlyDenied){
        await openAppSettings();
        return null;
      }
      if(status.isGranted){
        final picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.camera);
        return image;
      }
      else{
        return null;
      }
    }catch(e){
      rethrow;
    }
  } 

  Future<XFile?> pickImage() async {
    try{
      var status = await Permission.photos.status;
      if(status.isDenied){
        status = await Permission.photos.request();
      }
      if(status.isPermanentlyDenied){
        await openAppSettings();
        return null;
      }
      if(status.isGranted){
        final picker = ImagePicker();
        final image = await picker.pickImage(source: ImageSource.gallery);
        return image;
      }
      else{
        return null;
      }
    } catch(e){
      rethrow;
    }
  }
  
  Future<String?> getPreviousAvatar() async {
    final pref = await SharedPreferences.getInstance();
    final previousAvatarPath = pref.getString('previousAvatarPath');
    return previousAvatarPath;
  }

  Future<bool> savaAvatarToGallery(String path) async {
    try{
      File imageFile = File(path);
      final imageBytes = await imageFile.readAsBytes();

      var status = await Permission.photos.status;
      if(status.isDenied){
        status = await Permission.photos.request();
      }
      if(status.isPermanentlyDenied){
        await openAppSettings();
        return false;
      }
      if(status.isGranted){
        final result = await ImageGallerySaverPlus.saveImage(
         imageBytes,
         quality: 100,
        );
        return result['isSuccess'];
      }
      else{
        return false;
      }
    }catch(e){
      rethrow;
    }
  }
}