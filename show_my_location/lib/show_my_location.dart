import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:show_my_location/main.dart';

class ShowMyLocation extends StatefulWidget {
  const ShowMyLocation({super.key});

  @override
  State<ShowMyLocation> createState() => _ShowMyLocationState();
}

class _ShowMyLocationState extends State<ShowMyLocation> {
  final MapController _mapController = MapController();
  LatLng _currentLoction = LatLng(37.4220, -122.0841);
  late AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(
      onResume: () async {
        if(!await Permission.location.isGranted){
          _showInfoDialog('获取位置权限失败');
        }
      },
    );
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  Future<void> _showInfoDialog(String info) async {
    showDialog(
      context: navigatorKey.currentContext!, 
      builder: (context) => AlertDialog(
        title: const Text('提示'),
        content: Text(info),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('好的'),
          )
        ],
      )
    );
  }
  
  Future<void> _showCustomDialog(String info) async {
    showDialog(
      context: navigatorKey.currentContext!, 
      builder: (context) => AlertDialog(
        title: const Text('提示'),
        content: Text(info),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context), 
            child: const Text('取消')
          ),
          TextButton(
            onPressed: () async{
              Navigator.pop(context);
              await openAppSettings();
            }, 
            child: const Text('前往')
          )
        ],
      ),
    );
  }

  Future<int> _checkLocationPermission() async {
    bool isEnable = await Geolocator.isLocationServiceEnabled(); 
    if(!isEnable) return 0;
    try{
      var permission = await Geolocator.checkPermission();
      if(permission == LocationPermission.denied){
        permission = await Geolocator.requestPermission();
      }
      if(permission == LocationPermission.deniedForever){
        return 2;
      }
      return await Permission.location.isGranted ? 1:3; //获得位置权限: 1
    } catch(e){
      rethrow;
    }
  }

  Future<void> _getCurrentLocation() async {
    int permissionResult = await _checkLocationPermission();
    if(permissionResult == 0){
      await _showCustomDialog('当前定位服务不可用, 去设置界面打开定位开关');
      return;
    }
    else if(permissionResult == 2){
      await _showCustomDialog('定位权限被拒绝, 去设置界面授予定位权限');
      return;
    }
    else if(permissionResult == 1){
      Position position = await Geolocator.getCurrentPosition();
      setState(() {
        _currentLoction = LatLng(position.latitude, position.altitude);
        _mapController.move(_currentLoction, 13.0);
      });
    }
  }

  void _resetLocation(){
    setState(() {
      _currentLoction = LatLng(37.4220, -122.0841);
      _mapController.move(_currentLoction, 13.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('我的位置')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 8,
        children: [ 
          Text('我的经纬度: ${_currentLoction.latitude}, ${_currentLoction.longitude}'),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width,
            child: FlutterMap(
              mapController: _mapController,
              options: MapOptions(
                initialCenter: _currentLoction,
                initialZoom: 13.0,
                minZoom: 10.0,
                maxZoom: 16.0
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://example.map.com', //your map server url [ZH]你的地图服务链接
                  userAgentPackageName: 'com.example.app', //your userAgentPackageName [ZH]你的用户代理包名称
                ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentLoction,
                      child: const Icon(Icons.person_pin_circle, size: 40),
                    ),
                  ],
                )
              ]
            )
          ),
          ElevatedButton(
            onPressed: _getCurrentLocation, 
            child: const Text('获取我的位置')
          ),
          ElevatedButton(
            onPressed: _resetLocation, 
            child: const Text('重置')
          ),
          ElevatedButton(
            onPressed: () async {
              await openAppSettings();
            }, 
            child: const Text('打开设置界面')
          )
        ]
      )
    );
  }
}