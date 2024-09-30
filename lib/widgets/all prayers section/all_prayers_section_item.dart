import 'package:flutter/material.dart';
import 'package:sakena/widgets/all%20prayers%20section/prayer_name.dart';
import 'package:sakena/widgets/all%20prayers%20section/prayer_time.dart';

class AllPrayerSectionItem extends StatelessWidget {
  const AllPrayerSectionItem(
      {super.key,
      required this.prayerName,
      required this.prayerIcon,
      this.isSunrise = false,
      required this.time});

  final String prayerName;
  final Icon prayerIcon;
  final bool isSunrise;
  final DateTime time;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 7),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          PrayerName(
            prayerIcon: prayerIcon,
            prayerName: prayerName,
          ),
          PrayerTime(
            isSunrise: isSunrise,
            time: time,
          ),
        ],
      ),
    );
  }
}
