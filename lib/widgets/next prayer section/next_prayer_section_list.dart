import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:sakena/widgets/next%20prayer%20section/next_prayer_count_down.dart';

import 'next_prayer_section_item.dart';

class NextPrayerSectionList extends StatefulWidget {
  const NextPrayerSectionList({
    super.key,
    required this.prayerTime,
    required this.tomorrowPrayerTime,
  });

  final PrayerTimes prayerTime;
  final PrayerTimes tomorrowPrayerTime;

  @override
  State<NextPrayerSectionList> createState() => _NextPrayerSectionListState();
}

class _NextPrayerSectionListState extends State<NextPrayerSectionList> {
  @override
  Widget build(BuildContext context) {
    bool isTomorrow = widget.prayerTime.nextPrayer().name == "none";
    DateTime nextPrayerTime = widget.prayerTime
        .timeForPrayer(widget.prayerTime.currentPrayer())!
        .add(Duration(
            minutes: getIqamaTime(widget.prayerTime.currentPrayer().name)));
    if (nextPrayerTime == DateTime.now()) {
      setState(() {});
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        NextPrayerSectionItem(
          hover: (isTomorrow || widget.prayerTime.nextPrayer().name == "fajr"),
          prayerIcon: const Icon(
            Icons.wb_twighlight,
            color: Color.fromARGB(255, 98, 224, 163),
          ),
          prayer: "Fajr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.fajr)
              : convertTo12HourFormat(widget.prayerTime.fajr),
        ),
        NextPrayerSectionItem(
          hover: (widget.prayerTime.nextPrayer().name == "sunrise"),
          prayerIcon: const Icon(
            Icons.wb_twilight,
            color: Color.fromARGB(255, 158, 216, 90),
          ),
          prayer: "Sunrise",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.sunrise)
              : convertTo12HourFormat(widget.prayerTime.sunrise),
        ),
        NextPrayerSectionItem(
          hover: (widget.prayerTime.nextPrayer().name == "dhuhr"),
          prayerIcon: const Icon(
            Icons.wb_sunny,
            color: Colors.amber,
          ),
          prayer: "Dhuhr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.dhuhr)
              : convertTo12HourFormat(widget.prayerTime.dhuhr),
        ),
        NextPrayerSectionItem(
          hover: (widget.prayerTime.nextPrayer().name == "asr"),
          prayerIcon: const Icon(
            Icons.wb_sunny_outlined,
            color: Colors.orange,
          ),
          prayer: "Asr",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.asr)
              : convertTo12HourFormat(widget.prayerTime.asr),
        ),
        NextPrayerSectionItem(
          hover: (widget.prayerTime.nextPrayer().name == "maghrib"),
          prayerIcon: const Icon(
            Icons.sunny_snowing,
            color: Colors.blueAccent,
          ),
          prayer: "Maghrib",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.maghrib)
              : convertTo12HourFormat(widget.prayerTime.maghrib),
        ),
        NextPrayerSectionItem(
          hover: (widget.prayerTime.nextPrayer().name == "isha"),
          prayerIcon: const Icon(FontAwesomeIcons.solidMoon,
              color: Colors.deepPurpleAccent),
          prayer: "Isha",
          prayerTime: isTomorrow
              ? convertTo12HourFormat(widget.tomorrowPrayerTime.isha)
              : convertTo12HourFormat(widget.prayerTime.isha),
        ),
      ],
    );
  }
}

String convertTo12HourFormat(DateTime time) {
  String formattedTime = DateFormat('h:mm').format(time);

  return formattedTime;
}
