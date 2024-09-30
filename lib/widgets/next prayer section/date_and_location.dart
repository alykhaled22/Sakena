import 'package:flutter/material.dart';
import 'package:jhijri/_src/_jHijri.dart';

class DateAndLocation extends StatelessWidget {
  const DateAndLocation({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.access_alarms_rounded,
        ),
        const SizedBox(height: 5),
        Text(
          location,
        ),
        Text(
          getHijriDate(DateTime.now()),
        ),
      ],
    );
  }
}

String getHijriDate(DateTime dateTime) {
  final hijriDate = JHijri(
    fDate: dateTime,
  );

  List<String> hijriMonths = [
    "Muharram",
    "Safar",
    "Rabi' |",
    "Rabi' ||",
    "Jumada |",
    "Jumada ||",
    "Rajab",
    "Sha'ban",
    "Ramadan",
    "Shawwal",
    "Dhu al-Qi'dah",
    "Dhu al-Hijjah"
  ];

  String date =
      '${hijriDate.day} ${hijriMonths[hijriDate.month - 1]} ${hijriDate.year}';

  return date;
}
