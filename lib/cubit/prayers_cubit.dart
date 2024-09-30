import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakena/cubit/prayers_states.dart';
import 'package:sakena/service/location_service.dart';

class PrayersCubit extends Cubit<PrayersState> {
  PrayerTimes? prayerTime;
  Map<String, dynamic> map = {};
  List<PrayerTimes> prayerTimes = [];
  List<DateTime> dates = [];
  final pageController = PageController(
    initialPage: 5,
  );

  PrayersCubit() : super(PrayersInitialState());

  Future getPrayerTimes() async {
    emit(PrayersLodingState());
    try {
      if (map.isEmpty) {
        map = await LocationService().getUserAddress();
      }

      final myCoordinates = Coordinates(map["latitude"], map["longitude"]);
      final params = CalculationMethod.egyptian.getParameters();
      params.madhab = Madhab.shafi;

      DateTime date = DateTime.now();

      for (int i = -5; i <= 5; i++) {
        final newDate = date.add(Duration(days: i));
        dates.add(newDate);
        prayerTime = PrayerTimes(myCoordinates,
            DateComponents(newDate.year, newDate.month, newDate.day), params);
        prayerTimes.add(prayerTime!);
      }

      emit(PrayersSuccessState());
    } on Exception catch (e) {
      emit(PrayersFailureState(errMsg: e.toString()));
    }
  }
}
