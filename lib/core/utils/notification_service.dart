import 'dart:async';
import 'package:adhan/adhan.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sakena/core/utils/helper.dart';

class NotificationService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future init() async {
    const InitializationSettings settings = InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    await flutterLocalNotificationsPlugin.initialize(settings);
  }

  static Future<void> requestNotificationPermission() async {
    if (await Permission.notification.isDenied) {
      await Permission.notification.request();
    }
  }

  static void showBasicNotification(
      PrayerTimes prayerTime, PrayerTimes tomorrowPTime) async {
    String prayerName = getCurrentPrayerName(prayerTime);
    DateTime nextPrayerTime = getNextPrayerDateTime(prayerTime, tomorrowPTime);
    String date = getHijriDate(DateTime.now());
    String nextPrayerStringTime = getNextPrayerStringTime(nextPrayerTime);

    Timer.periodic(const Duration(seconds: 1), (timer) {
      Duration remaining = getRemainingTime(nextPrayerTime);

      if (remaining.isNegative || remaining.inSeconds == 0) {
        date = getHijriDate(DateTime.now());
        prayerName = getCurrentPrayerName(prayerTime);
        nextPrayerTime = getNextPrayerDateTime(prayerTime, tomorrowPTime);
        remaining = getRemainingTime(nextPrayerTime);
        nextPrayerStringTime = getNextPrayerStringTime(nextPrayerTime);
      }

      updateNotification(remaining, prayerName, date, nextPrayerStringTime);
    });
  }

  static Future<void> updateNotification(Duration remaining, String nextPrayer,
      String date, String nextPrayerTime) async {
    String formattedTime = formatDuration(remaining);

    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails(
        channelShowBadge: false,
        "id_1",
        "basic_notification",
        importance: Importance.max,
        onlyAlertOnce: true,
        priority: Priority.high,
        playSound: false,
        autoCancel: false,
        enableVibration: false,
        ongoing: true,
        showWhen: false,
      ),
    );

    await flutterLocalNotificationsPlugin.show(
      0,
      "$nextPrayer $nextPrayerTime",
      "adhan in $formattedTime",
      details,
    );
  }

  static Duration getRemainingTime(DateTime nextPrayerTime) {
    DateTime now = DateTime.now();
    return nextPrayerTime.difference(now);
  }

  static String getCurrentPrayerName(PrayerTimes prayerTime) {
    return prayerTime.currentPrayer().name == "none"
        ? "Fajr"
        : prayerTime.currentPrayer().name;
  }

  static String getNextPrayerStringTime(DateTime nextPrayerDateTime) {
    return convertTo12HourFormatA(nextPrayerDateTime);
  }

  static DateTime getNextPrayerDateTime(
      PrayerTimes prayerTime, PrayerTimes tomorrowPTime) {
    return prayerTime.currentPrayer().name == "none"
        ? tomorrowPTime.fajr
        : prayerTime.timeForPrayer(prayerTime.nextPrayer())!;
  }

  static String formatDuration(Duration duration) {
    return "${duration.inHours.remainder(24)}:${duration.inMinutes.remainder(60)}:${duration.inSeconds.remainder(60)}";
  }
}
