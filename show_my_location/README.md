# show_my_location

[![中文文档](https://img.shields.io/badge/文档-中文-blue?style=flat-square)](README_ZH.md)

Get location permission and show your location on a map. If the permission is not obtained, the user is reminded to go to the settings page to operate, and the user will be prompted with the operation result after returning to the foreground.

## 特性
- **Get Current Location**: Get the latitude and longitude of the current location
- **Visualization**: The current location will be visualized on the map
- **Alert**: Alerts the user that permission acquisition failed

## 技术栈
- Location plugin: geolocator
- Map-related plugins: flutter_map, latlong2
- Permission Management: permission_handler

## 说明    
- Specific versions of dependencies (see pubspec.yaml for details)
- Location and network permissions for Android and iOS need to be configured