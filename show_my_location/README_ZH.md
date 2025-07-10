# show_my_location

[![English Docs](https://img.shields.io/badge/Docs-English-green?style=flat-square)](README.md)

获取位置权限，并在地图上展示自己的定位。若获取权限失败，提醒用户前往设置界面进行操作，用户返回前台后提示操作结果。

## 特性
- **获取位置**: 获取当前位置的经纬度
- **可视化**: 将获取的当前位置在地图可视化
- **提醒**: 提醒用户权限获取失败

## 技术栈
- 位置插件: geolocator
- 地图相关插件: flutter_map, latlong2
- 权限管理: permission_handler

## 说明    
- 具体依赖版本(详见 pubspec.yaml )
- 需要配置 Android 和 iOS 的位置和网络权限