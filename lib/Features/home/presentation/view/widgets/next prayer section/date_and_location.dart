import 'package:flutter/material.dart';
import 'package:sakena/core/utils/helper.dart';

class DateAndLocation extends StatelessWidget {
  const DateAndLocation({super.key, required this.location});

  final String location;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const Icon(
          Icons.access_alarms_rounded,
        ),
        const SizedBox(height: 5),
        Text(
          location,
        ),
        Text(
          getHijriDate(DateTime.now()),
        ),
      ],
    );
  }
}
