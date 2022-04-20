// import 'package:base_flutter_project/models/notification_payload.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
//
// class NotificationService {
//   static final NotificationService _notificationService = NotificationService._internal();
//
//   NotificationService._internal();
//
//   factory NotificationService() => _notificationService;
//
//   late AndroidNotificationChannel channel;
//
//   late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
//
//   Future<void> initialize() async {
//     channel = const AndroidNotificationChannel(
//       'high_importance_channel',
//       'High Importance Notifications',
//       description: 'This channel is used for important notifications.',
//       importance: Importance.high,
//     );
//     print(await FirebaseMessaging.instance.getToken());
//
//     flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//     await flutterLocalNotificationsPlugin
//         .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//         ?.createNotificationChannel(channel);
//
//     await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//       alert: true,
//       badge: true,
//       sound: true,
//     );
//
//     FirebaseMessaging.onMessage.listen(
//       (RemoteMessage message) {
//         print("handling message: $message");
//         final notificationPayload =
//             NotificationPayload.fromJson(Map<String, dynamic>.from(message.data));
//         final body = notificationPayload.body;
//         flutterLocalNotificationsPlugin.show(
//           1,
//           notificationPayload.title,
//           body,
//           NotificationDetails(
//             android: AndroidNotificationDetails(
//               channel.id,
//               channel.name,
//               channelDescription: channel.description,
//               channelShowBadge: true,
//               icon: 'launch_background',
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
//
// Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
//   print(FirebaseMessaging.instance.getToken());
//   final channel = const AndroidNotificationChannel(
//     'high_importance_channel',
//     'High Importance Notifications',
//     description: 'This channel is used for important notifications.',
//     importance: Importance.high,
//   );
//
//   final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
//
//   await flutterLocalNotificationsPlugin
//       .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
//       ?.createNotificationChannel(channel);
//
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true,
//   );
//
//   final notificationPayload = NotificationPayload.fromJson(Map<String, dynamic>.from(message.data));
//   final body = notificationPayload.body;
//
//   flutterLocalNotificationsPlugin.show(
//     1,
//     notificationPayload.title,
//     body,
//     NotificationDetails(
//       android: AndroidNotificationDetails(
//         channel.id,
//         channel.name,
//         channelDescription: channel.description,
//         channelShowBadge: true,
//       ),
//     ),
//   );
// }
