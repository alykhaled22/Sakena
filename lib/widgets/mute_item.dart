import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakena/widgets/custom_icon_button.dart';

class MuteItem extends StatelessWidget {
  const MuteItem({super.key, required this.prayerName});

  final String prayerName;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          FontAwesomeIcons.bellSlash,
          color: Colors.white,
          size: 18,
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          prayerName,
          style: const TextStyle(fontSize: 22, ),
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(12)),
          child: Center(
            child: Row(
              children: [
                CustomIconButton(
                  onPressed: () {},
                  icon: FontAwesomeIcons.minus,
                ),
                const SizedBox(width: 13),
                const Text(
                  "5",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 22,
                  ),
                ),
                const SizedBox(width: 13),
                CustomIconButton(
                  onPressed: () {},
                  icon: Icons.add,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
