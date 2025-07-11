import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_local_notifications_demo/services/notification_service.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:switcher_button/switcher_button.dart';

class SettingTile extends StatefulWidget {
  final String tileName;
  const SettingTile({super.key, required this.tileName});

  @override
  State<SettingTile> createState() => _SettingTileState();
}

class _SettingTileState extends State<SettingTile> {
  bool on = false;
  final _notificationService = NotificationService();
  late  String _tileName;

  @override
  void initState() {
    super.initState();
    _tileName = widget.tileName;
  }

  Future<bool> _checkExactAlarmPermission() async {
    try{
      var status = await Permission.scheduleExactAlarm.status;
      if(status.isDenied){
        status = await Permission.scheduleExactAlarm.request();
      }
      if(status.isPermanentlyDenied){
        await openAppSettings();
        return false;
      }
      return status.isGranted;
    }catch(e){
      rethrow;
    }
  }

  Future<void> _checkPermission() async {
    try{
      var status = await Permission.notification.status;
      if(status.isDenied){
        status = await Permission.notification.request();
      }
      if(status.isPermanentlyDenied){
        await openAppSettings();
        return;
      }
      if(status.isGranted){
        if(_tileName == 'Say Hello'){
          _notificationService.sayHello();
        }
        else if(await _checkExactAlarmPermission() && _tileName == 'Scheduled Notifications'){
          _notificationService.timedTriggers();
        }
        else if(_tileName == 'Custom styleInformation'){
          _notificationService.customStyleInformation();
        }
      }
      else{
        EasyLoading.showError('ERROR', duration: Duration(seconds: 3));
      }
    } catch(e){
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _tileName,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          ),
          SwitcherButton(
            onColor: Colors.green,
            offColor: Colors.grey,
            value: on,
            onChange: (on) {
              if(on) _checkPermission();
              setState(() => on = !on);
            },
          ),
        ],
      ),
    );
  }
}