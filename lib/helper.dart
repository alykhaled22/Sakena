import 'package:intl/intl.dart';
import 'package:jhijri/_src/_jHijri.dart';

int getIqamaTime(String prayer) {
  switch (prayer) {
    case 'dhuhr':
    case 'asr':
    case 'isha':
      return 15;
    case 'maghrib':
      return 10;
    default:
      return 20;
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

String convertTo12HourFormatA(DateTime time) {
  String formattedTime = DateFormat('h:mm a').format(time);

  return formattedTime;
}


String convertTo12HourFormat(DateTime time) {
  String formattedTime = DateFormat('h:mm').format(time);

  return formattedTime;
}
