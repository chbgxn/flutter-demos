import 'dart:io';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest.dart' as tz;

class NotificationService {
  static final FlutterLocalNotificationsPlugin _notificationPlugin = FlutterLocalNotificationsPlugin();

  static Future<void> initNotification() async {
    const AndroidInitializationSettings initializationSettingsAndroid  
      = AndroidInitializationSettings('@mipmap/ic_launcher');
    const DarwinInitializationSettings initializationSettingsIOS 
       = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true
      );
    const InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS 
    );

    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'Regular Channel',
      'Regular Notification',
      importance: Importance.high,
      description: 'Popup is required / 要弹窗'
    );

    await _notificationPlugin.initialize(
      initializationSettings, 
      // onDidReceiveNotificationResponse: (response) async {
      // }
    );
    
    tz.initializeTimeZones();

    await _notificationPlugin.
      resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);
  }

  static Future<void> requestExactAlarmPermission() async {
    if(Platform.isAndroid){
      await _notificationPlugin.
        resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
        ?.requestExactAlarmsPermission();
    }
  }

  Future<void> sayHello() async {
    const AndroidNotificationDetails androidDetails 
      = AndroidNotificationDetails(
        'Regular Channel1',
        'Regular Notification1',
        channelDescription: 'Hello Flutter Notifications',
        importance: Importance.high,
        priority: Priority.high
      );
    
    const DarwinNotificationDetails iOSDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentBanner: true
    );

    const NotificationDetails platformDetails = NotificationDetails(
      android: androidDetails,
      iOS: iOSDetails
    );

    await _notificationPlugin.show(
      0, 'Hello', 'this is the local_notifications', platformDetails
    );
  }

  Future<void> timedTriggers() async {
    await _notificationPlugin.zonedSchedule(
      1, 
      'Meeting reminders', 
      'The meeting will commence in 10 minutes.', 
      tz.TZDateTime.now(tz.local).add(const Duration(seconds: 5)), 
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'Meeting Channel', 
          'Meeting Notification',
          importance: Importance.max,
          priority: Priority.high
        )
      ), 
      androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
      uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime
    );
  }

  Future<void> customStyleInformation() async {
    await _notificationPlugin.show(
      2,
      'Long Story', 
      'read it >>',
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'Regular Channel2', 
          'Regular Notification2',
          importance: Importance.high,
          priority: Priority.high,
          styleInformation: BigTextStyleInformation(
            'Many years later, as he faced the firing squad, '
            'Colonel Aureliano Buendía was to remember that distant afternoon '
            'when his father took him to discover ice.'
            '------'
            'Many years later, as he faced the firing squad, '
            'Colonel Aureliano Buendía was to remember that distant afternoon '
            'when his father took him to discover ice.'
            '------'
            'Many years later, as he faced the firing squad, '
            'Colonel Aureliano Buendía was to remember that distant afternoon '
            'when his father took him to discover ice.',
            htmlFormatBigText: true,
            contentTitle: 'One Hundred Years of Solitude',
            summaryText: 'abstract',
          )
        )
      )
    );
  }
}