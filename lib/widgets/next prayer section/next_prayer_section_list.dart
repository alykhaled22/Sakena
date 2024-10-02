import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';

import 'next_prayer_section_item.dart';

class NextPrayerSectionList extends StatelessWidget {
  const NextPrayerSectionList({
    super.key,
    required this.prayerTime,
    required this.tomorrowPrayerTime,
  });

  final PrayerTimes prayerTime;
  final PrayerTimes tomorrowPrayerTime;

  @override
  Widget build(BuildContext context) {
    bool isTomorrow = prayerTime.nextPrayer().name == "none";
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NextPrayerSectionItem(
          hover: (isTomorrow || prayerTime.nextPrayer().name == "fajr"),
          prayerIcon: const Icon(
            Icons.wb_twighlight,
            color: Color.fromARGB(255, 98, 224, 163),
          ),
          prayer: "Fajr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.fajr)
              : convertTo12HourFormat(prayerTime.fajr),
        ),
        NextPrayerSectionItem(
          hover: (prayerTime.nextPrayer().name == "sunrise"),
          prayerIcon: const Icon(
            Icons.wb_twilight,
            color: Color.fromARGB(255, 158, 216, 90),
          ),
          prayer: "Sunrise",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.sunrise)
              : convertTo12HourFormat(prayerTime.sunrise),
        ),
        NextPrayerSectionItem(
          hover: (prayerTime.nextPrayer().name == "dhuhr"),
          prayerIcon: const Icon(
            Icons.wb_sunny,
            color: Colors.amber,
          ),
          prayer: "Dhuhr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.dhuhr)
              : convertTo12HourFormat(prayerTime.dhuhr),
        ),
        NextPrayerSectionItem(
          hover: (prayerTime.nextPrayer().name == "asr"),
          prayerIcon: const Icon(
            Icons.wb_sunny_outlined,
            color: Colors.orange,
          ),
          prayer: "Asr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.asr)
              : convertTo12HourFormat(prayerTime.asr),
        ),
        NextPrayerSectionItem(
          hover: (prayerTime.nextPrayer().name == "maghrib"),
          prayerIcon: const Icon(
            Icons.sunny_snowing,
            color: Colors.blueAccent,
          ),
          prayer: "Maghrib",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.maghrib)
              : convertTo12HourFormat(prayerTime.maghrib),
        ),
        NextPrayerSectionItem(
          hover: (prayerTime.nextPrayer().name == "isha"),
          prayerIcon: const Icon(FontAwesomeIcons.solidMoon,
              color: Colors.deepPurpleAccent),
          prayer: "Isha",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(tomorrowPrayerTime.isha)
              : convertTo12HourFormat(prayerTime.isha),
        ),
      ],
    );
  }
}

String convertTo12HourFormat(DateTime time) {
  String formattedTime = DateFormat('h:mm').format(time);

  return formattedTime;
}
