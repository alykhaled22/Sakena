import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import 'package:sakena/core/utils/helper.dart';

class NextPrayerCountDown extends StatefulWidget {
  const NextPrayerCountDown(
      {super.key, required this.prayerTime, required this.tomorrowPrayerTime});

  final PrayerTimes prayerTime;
  final PrayerTimes tomorrowPrayerTime;

  @override
  State<NextPrayerCountDown> createState() => _NextPrayerCountDownState();
}

class _NextPrayerCountDownState extends State<NextPrayerCountDown> {
  bool iqama = false;
  bool duha = false;
  DateTime? nextPrayerTime;

  @override
  void initState() {
    super.initState();
    // NotificationService.showBasicNotification(
    //     widget.prayerTime, widget.tomorrowPrayerTime);

    if (widget.prayerTime.currentPrayer().name == "none") {
      iqama = false;
      duha = false;
      nextPrayerTime =
          widget.prayerTime.timeForPrayer(widget.prayerTime.nextPrayer()) ??
              widget.tomorrowPrayerTime.fajr;
    } else {
      DateTime time = widget.prayerTime
          .timeForPrayer(widget.prayerTime.currentPrayer())!
          .add(Duration(
              minutes: getIqamaTime(widget.prayerTime.currentPrayer().name)));
      if (time.compareTo(DateTime.now()) > 0) {
        if (widget.prayerTime.currentPrayer().name == 'sunrise') {
          duha = true;
        } else {
          iqama = true;
        }
        nextPrayerTime = time;
      } else {
        iqama = false;
        duha = false;
        nextPrayerTime =
            widget.prayerTime.timeForPrayer(widget.prayerTime.nextPrayer()) ??
                widget.tomorrowPrayerTime.fajr;
      }
    }
  }

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
        (nextPrayerTime == null)
            ? const Text("00:00:00",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold))
            : TimerCountdown(
                endTime: nextPrayerTime!,
                format: (duha || iqama)
                    ? CountDownTimerFormat.minutesSeconds
                    : CountDownTimerFormat.hoursMinutesSeconds,
                enableDescriptions: false,
                spacerWidth: 5,
                timeTextStyle:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                onTick: (remainingTime) {
                  if (remainingTime.inSeconds == 1) {
                    if (duha || iqama) {
                      duha = false;
                      iqama = false;
                      nextPrayerTime = widget.prayerTime
                              .timeForPrayer(widget.prayerTime.nextPrayer()) ??
                          widget.tomorrowPrayerTime.fajr;
                    } else {
                      if (widget.prayerTime.nextPrayer().name == 'sunrise') {
                        duha = true;
                        nextPrayerTime = widget.prayerTime.sunrise
                            .add(const Duration(minutes: 20));
                      } else {
                        iqama = true;
                        nextPrayerTime = widget.prayerTime
                            .timeForPrayer(widget.prayerTime.nextPrayer())!
                            .add(Duration(
                                minutes: getIqamaTime(
                                    widget.prayerTime.nextPrayer().name)));
                      }
                    }
                  }
                  if (remainingTime.inSeconds == 0) {
                    setState(() {});
                  }
                },
              )
      ],
    );
  }
}
