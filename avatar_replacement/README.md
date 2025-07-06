# avatar_replacement

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

Reimplement the WeChat avatar replacement functionality with camera shooting, gallery selection, history preview, image cropping, and save capabilities.

## Features
- **Camera Capture**: Access device camera to take a new avatar
- **Gallery Selection**: Choose an image from the device gallery
- **History Preview**: View and restore a previously used avatar
- **Cropping**: Square crop frame (1:1 ratio) optimized for WeChat avatars
- **Local Storage**: Persist avatar file paths using `shared_preferences`

## Tech Stack
- Image Processing Plugins: image_picker, image_cropper, image_gallery_saver_plus
- Permission Management: permission_handler
- State Management: riverpod
- Toast and Loading：easyloading

## Notes  
- Flutter version 3.29.2
- Android SDK version 35.0.1
- Additional required dependencies (see pubspec.yaml for details)
- Requires Android & iOS permission configuration