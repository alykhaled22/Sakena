import 'package:flutter/material.dart';
import 'package:sakena/core/utils/helper.dart';

class PrayerCardSwapper extends StatelessWidget {
  const PrayerCardSwapper(
      {super.key, required this.dateTime, required this.pageController});
  final DateTime dateTime;
  final PageController pageController;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
                onTap: () {
                  pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: const Icon(Icons.arrow_back_ios_new)),
            const SizedBox(
              width: 10,
            ),
            Text(
              DateTime.now().day == dateTime.day
                  ? "Today, ${getHijriDate(dateTime)}"
                  : getHijriDate(dateTime),
              style:
                  const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            if (dateTime.day != DateTime.now().day)
              GestureDetector(
                onTap: () {
                  pageController.animateToPage(pageController.initialPage,
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xff0A3A40),
                      borderRadius: BorderRadius.circular(12)),
                  width: 70,
                  height: 30,
                  child: const Center(
                    child: Text(
                      "Today",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            GestureDetector(
                onTap: () {
                  pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut);
                },
                child: const Icon(Icons.arrow_forward_ios)),
          ],
        )
      ],
    );
  }
}
