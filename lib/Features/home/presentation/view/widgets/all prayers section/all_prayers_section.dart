import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:sakena/Features/home/presentation/view/widgets/all%20prayers%20section/all_prayers_section_list.dart';

class AllPrayersSection extends StatelessWidget {
  const AllPrayersSection({
    super.key,
    required this.prayerTimes,
    required this.date,
    required this.pageController,
  });

  final PrayerTimes prayerTimes;
  final DateTime date;
  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: const LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff1D7373),
              Color(0xff0F5959),
            ],
          ),
        ),
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: AllPrayersSectionList(
          date: date,
          pageController: pageController,
          prayerTimes: prayerTimes,
        ));
  }
}
