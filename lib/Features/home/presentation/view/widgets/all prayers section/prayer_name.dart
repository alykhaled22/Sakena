import 'package:flutter/material.dart';

class PrayerName extends StatelessWidget {
  const PrayerName(
      {super.key, required this.prayerName, required this.prayerIcon});

  final String prayerName;
  final Icon prayerIcon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prayerIcon,
        const SizedBox(
          width: 10,
        ),
        Text(
          prayerName,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            fontFamily: 'Poppins',
          ),
        ),
      ],
    );
  }
}
