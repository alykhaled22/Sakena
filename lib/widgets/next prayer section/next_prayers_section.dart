import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:sakena/widgets/next%20prayer%20section/next_prayer_section_info.dart';
import 'package:sakena/widgets/next%20prayer%20section/next_prayer_section_list.dart';

class NextPrayersSection extends StatelessWidget {
  const NextPrayersSection(
      {super.key, required this.prayerTime, required this.location, required this.tommoroPrayerTime});

  final PrayerTimes prayerTime;
  final PrayerTimes tommoroPrayerTime;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [
            //  Color(0xff1D7373),
            Color(0xff0F5959),
            Color(0xff107361),
          ],
        ),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            NextPrayerSectionInfo(prayerTime: prayerTime, location: location,tomorrowPrayerTime: tommoroPrayerTime,),
            const SizedBox(height: 30),
            NextPrayerSectionList(prayerTime: prayerTime,tomorrowPrayerTime: tommoroPrayerTime,)
          ],
        ),
      ),
    );
  }
}
