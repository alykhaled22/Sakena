import 'package:flutter/material.dart';

class NextPrayerSectionItem extends StatelessWidget {
  const NextPrayerSectionItem({
    super.key,
    required this.prayerIcon,
    required this.prayer,
    required this.prayerTime,
    this.hover = false,
  });

  final Icon prayerIcon;
  final String prayer;
  final String prayerTime;
  final bool hover;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: hover ? 55 : null,
      decoration: BoxDecoration(
        color: hover ? Colors.grey.withOpacity(0.3) : Colors.transparent,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          prayerIcon,
          const SizedBox(
            height: 5,
          ),
          Text(
            prayer,
            style: const TextStyle(
              fontFamily: "Poppins",
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            prayerTime,
            style: const TextStyle(
              fontFamily: "Open Sans",
            ),
          ),
        ],
      ),
    );
  }
}
