# avatar_replacement

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

还原微信头像更换功能，支持相机拍摄、相册选择、历史预览、图片裁剪与保存。

## 特性
- **相机拍摄**: 调用系统相机拍摄新头像
- **相册选择**: 从手机相册选取图片
- **历史预览**: 查看并恢复上一张使用过的头像
- **裁剪**: 正方形裁剪框，适配微信头像比例(1:1)
- **本地保存**: 使用 `shared_preferences` 持久化存储头像文件路径

## 技术栈
- 图片相关插件: image_picker, image_cropper, image_gallery_saver_plus
- 权限管理: permission_handler
- 状态管理: riverpod
- Toast and Loading：easyloading

## 说明    
- Flutter version 3.29.2
- Android SDK version 35.0.1
- 其他必要依赖(详见 pubspec.yaml)
- 需要配置 Android 和 iOS 的权限