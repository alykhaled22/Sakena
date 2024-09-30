import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

class NextPrayerCountDown extends StatefulWidget {
  const NextPrayerCountDown({super.key, required this.prayerTime});

  final PrayerTimes prayerTime;

  @override
  State<NextPrayerCountDown> createState() => _NextPrayerCountDownState();
}

class _NextPrayerCountDownState extends State<NextPrayerCountDown> {
  bool iqama = false;
  bool duha = false;
  @override
  Widget build(BuildContext context) {
    String nextPrayer = widget.prayerTime.nextPrayer().name[0].toUpperCase() +
        widget.prayerTime.nextPrayer().name.substring(1);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: iqama
                    ? "Iqama"
                    : duha
                        ? "Duha"
                        : widget.prayerTime.nextPrayer().name == "none"
                            ? "Fajr"
                            : nextPrayer,
                style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const TextSpan(
                text: "   in",
                style: TextStyle(
                  fontSize: 18,
                ),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        TimerCountdown(
          onEnd: () {
            if (widget.prayerTime.currentPrayer().name == 'sunrise') {
              duha = true;
            } else {
              iqama = true;
            }
            TimerCountdown(
              onEnd: () {
                duha = false;
                iqama = false;
                setState(() {});
              },
              endTime: getIqamaTime(widget.prayerTime.currentPrayer().name),
              format: CountDownTimerFormat.minutesSeconds,
              enableDescriptions: false,
              spacerWidth: 5,
              timeTextStyle:
                  const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            );
            setState(() {});
          },
          endTime:
              widget.prayerTime.timeForPrayer(widget.prayerTime.nextPrayer()) ??
                  widget.prayerTime.fajr,
          format: CountDownTimerFormat.hoursMinutesSeconds,
          spacerWidth: 5,
          enableDescriptions: false,
          timeTextStyle:
              const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}

DateTime getIqamaTime(String prayer) {
  DateTime date = DateTime.now();

  switch (prayer) {
    case 'dhuhr':
    case 'asr':
    case 'isha':
      return date.add(const Duration(minutes: 15));
    case 'maghrib':
      return date.add(const Duration(minutes: 10));
    default:
      return date.add(const Duration(minutes: 20));
  }
}
