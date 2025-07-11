import 'package:flutter/material.dart';
import 'package:my_local_notifications_demo/setting_tile.dart';

class MyLocalNotificationsDemo extends StatelessWidget {
  const MyLocalNotificationsDemo({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text('Settings')),
      body: SafeArea(
        child: Column(
          spacing: 8,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SettingTile(tileName: 'Say Hello'),
            SettingTile(tileName: 'Scheduled Notifications'),
            SettingTile(tileName: 'Custom styleInformation'),
          ],
        )
      ),
    );
  }
}