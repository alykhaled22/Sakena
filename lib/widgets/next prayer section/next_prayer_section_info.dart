import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:sakena/widgets/next%20prayer%20section/date_and_location.dart';
import 'package:sakena/widgets/next%20prayer%20section/next_prayer_count_down.dart';

class NextPrayerSectionInfo extends StatelessWidget {
  const NextPrayerSectionInfo(
      {super.key, required this.prayerTime, required this.location, required this.tomorrowPrayerTime});

  final PrayerTimes prayerTime;
  final PrayerTimes tomorrowPrayerTime;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NextPrayerCountDown(prayerTime: prayerTime,tomorrowPrayerTime: tomorrowPrayerTime,),
        DateAndLocation(location: location),
      ],
    );
  }
}
