import 'package:flutter/material.dart';
import 'package:sakena/core/utils/helper.dart';

class PrayerTime extends StatefulWidget {
  const PrayerTime({super.key, this.isSunrise = false, required this.time});

  final bool isSunrise;
  final DateTime time;

  @override
  State<PrayerTime> createState() => _PrayerTimeState();
}

class _PrayerTimeState extends State<PrayerTime> {
  bool isMuted = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          convertTo12HourFormatA(widget.time),
          style: const TextStyle(fontSize: 16,fontFamily: "Open Sans"),
        ),
        const SizedBox(
          width: 10,
        ),
        GestureDetector(
          onTap: () {
            isMuted = !isMuted;
            setState(() {});
          },
          child: Icon(
            widget.isSunrise
                ? Icons.volume_off_outlined
                : isMuted
                    ? Icons.volume_off_outlined
                    : Icons.volume_up_outlined,
            color: widget.isSunrise
                ? Colors.grey
                : isMuted
                    ? Colors.grey
                    : Colors.white,
          ),
        ),
      ],
    );
  }
}

