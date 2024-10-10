import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakena/Features/home/presentation/view/widgets/all%20prayers%20section/all_prayers_section_item.dart';
import 'package:sakena/Features/home/presentation/view/widgets/all%20prayers%20section/prayer_card_swapper.dart';

class AllPrayersSectionList extends StatelessWidget {
  const AllPrayersSectionList(
      {super.key,
      required this.date,
      required this.pageController,
      required this.prayerTimes});

  final DateTime date;
  final PageController pageController;
  final PrayerTimes prayerTimes;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PrayerCardSwapper(
          dateTime: date,
          pageController: pageController,
        ),
        AllPrayerSectionItem(
          prayerName: "Fajr",
          prayerIcon: const Icon(
            Icons.wb_twighlight,
            color: Color.fromARGB(255, 98, 224, 163),
          ),
          time: prayerTimes.fajr,
        ),
        AllPrayerSectionItem(
          prayerName: "Sunrise",
          prayerIcon: const Icon(
            Icons.wb_twilight,
            color: Color.fromARGB(255, 158, 216, 90),
          ),
          time: prayerTimes.sunrise,
          isSunrise: true,
        ),
        AllPrayerSectionItem(
          prayerName: "Dhuhr",
          prayerIcon: const Icon(
            Icons.wb_sunny,
            color: Colors.amber,
          ),
          time: prayerTimes.dhuhr,
        ),
        AllPrayerSectionItem(
          prayerName: "Asr",
          prayerIcon: const Icon(
            Icons.wb_sunny_outlined,
            color: Colors.orange,
          ),
          time: prayerTimes.asr,
        ),
        AllPrayerSectionItem(
          prayerName: "Maghrib",
          prayerIcon: const Icon(
            Icons.sunny_snowing,
            color: Colors.blueAccent,
          ),
          time: prayerTimes.maghrib,
        ),
        AllPrayerSectionItem(
          prayerName: "Isha",
          prayerIcon: const Icon(
            FontAwesomeIcons.solidMoon,
            color: Colors.deepPurpleAccent,
          ),
          time: prayerTimes.isha,
        ),
      ],
    );
  }
}
