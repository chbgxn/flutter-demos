import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:my_local_notifications_demo/my_local_notifications_demo.dart';
import 'package:my_local_notifications_demo/services/notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await NotificationService.initNotification();
  await NotificationService.requestExactAlarmPermission();
  runApp(const MyApp());
  EasyLoading.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: EasyLoading.init(),
      home: MyLocalNotificationsDemo()
    );
  }
}