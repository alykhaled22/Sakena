import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:sakena/widgets/next%20prayer%20section/date_and_location.dart';
import 'package:sakena/widgets/next%20prayer%20section/next_prayer_count_down.dart';

class NextPrayerSectionInfo extends StatelessWidget {
  const NextPrayerSectionInfo(
      {super.key, required this.prayerTime, required this.location});

  final PrayerTimes prayerTime;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NextPrayerCountDown(prayerTime: prayerTime),
        DateAndLocation(location: location),
      ],
    );
  }
}
