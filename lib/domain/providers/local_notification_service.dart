// ignore_for_file: depend_on_referenced_packages

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class LocalNotificationService {
  String? selectedNotificationPayload;
  static String navigationActionId = 'id_3';

  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize(BuildContext context) {
    const DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(requestSoundPermission: true
            /* notificationCategories: [
         DarwinNotificationCategory(
          'demoCategory',
         actions: <DarwinNotificationAction>[
            IOSNotificationAction('id_1', 'Action 1'),
            IOSNotificationAction(
              'id_2',
              'Action 2',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.destructive,
              },
            ),
            DarwinNotificationAction(
              'id_3',
              'Action 3',
              options: <DarwinNotificationActionOption>{
                DarwinNotificationActionOption.foreground,
              },
            ),
          ],
          options: <DarwinNotificationCategoryOption>{
            DarwinNotificationCategoryOption.hiddenPreviewShowTitle,
          },
        )

      ],*/
            );
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings("@mipmap/ic_launcher"),
            iOS: initializationSettingsDarwin);

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse:
          (NotificationResponse notificationResponse) {
        switch (notificationResponse.notificationResponseType) {
          case NotificationResponseType.selectedNotification:

            // if (notificationResponse.payload) {
            //
            // }

            //this is the data {orderId: 637e24b7493add0a6bd86cd4, userId: 634eb65f228d6c78937d9037, user: Customer}
            // Get.toNamed(Routes.notifications);

            break;
          case NotificationResponseType.selectedNotificationAction:
            if (notificationResponse.actionId == navigationActionId) {
              // selectNotificationSubject.add(notificationResponse.payload);
            }
            break;
        }
      },
      onDidReceiveBackgroundNotificationResponse: notificationTapBackground,
    );
  }

  static void notificationTapBackground(
      NotificationResponse notificationResponse) {
    // ignore: avoid_print
    print('notification(${notificationResponse.id}) action tapped: '
        '${notificationResponse.actionId} with'
        ' payload: ${notificationResponse.payload}');
    if (notificationResponse.input?.isNotEmpty ?? false) {
      // ignore: avoid_print
      print(
          'notification action tapped with input: ${notificationResponse.input}');
    }
  }

  static void display(RemoteMessage message) async {
    String sound = 'under_bottle.mp3';
    var soundFile = sound.replaceAll('.mp3', '');

// #2
    final notificationSound =
        sound == '' ? null : RawResourceAndroidNotificationSound(soundFile);

    final iosDetail = sound == ''
        ? const DarwinNotificationDetails()
        : DarwinNotificationDetails(presentSound: true, sound: sound);

    // final iosDetail = DarwinNotificationDetails();

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          iOS: iosDetail,
          android: AndroidNotificationDetails(
            message.notification!.title!,
            message.notification!.title!,
            channelDescription: "this is our foodelo",
            importance: Importance.max,
            priority: Priority.high,
            sound: notificationSound,
            playSound: true,
          ));

      debugPrint(" this is the data ${message.data}");

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        //payload: message.data["userId"],
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  static void vendorDisplay(RemoteMessage message) async {
    String sound = 'under_bottle.mp3';
    var soundFile = sound.replaceAll('.mp3', '');

// #2
    final notificationSound =
        sound == '' ? null : RawResourceAndroidNotificationSound(soundFile);

    final iosDetail = sound == ''
        ? const DarwinNotificationDetails()
        : DarwinNotificationDetails(presentSound: true, sound: sound);

    // final iosDetail = DarwinNotificationDetails();

    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      final NotificationDetails notificationDetails = NotificationDetails(
          iOS: iosDetail,
          android: AndroidNotificationDetails(
            message.notification!.title!,
            message.notification!.title!,
            channelDescription: "this is our foodelo",
            importance: Importance.max,
            priority: Priority.high,
            sound: notificationSound,
            playSound: true,
            additionalFlags: Int32List.fromList(<int>[4]),
          ));

      debugPrint(" this is the data ${message.data}");

      await _notificationsPlugin.show(
        id,
        message.notification!.title,
        message.notification!.body,
        notificationDetails,
        //payload: message.data["userId"],
      );
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  /*static void onDidReceiveLocalNotification(
      int? id, String? title, String? body, String? payload) async {
    // display a dialog with the notification details, tap ok to go to another page
    showDialog(
      context: Get.context!,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(title??''),
        content: Text(body??''),
        actions: [
          CupertinoDialogAction(
            isDefaultAction: true,
            child: Text('Ok'),
            onPressed: () async {
              Navigator.of(context, rootNavigator: true).pop();
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => SecondScreen(payload),
                ),
              );
            },
          )
        ],
      ),
    );
  }*/

}
