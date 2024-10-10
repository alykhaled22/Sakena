class PrayersState {}

class PrayersInitialState extends PrayersState {}

class PrayersLodingState extends PrayersState {}

class PrayersSuccessState extends PrayersState {}

class PrayersFailureState extends PrayersState {
  final String errMsg;

  PrayersFailureState({required this.errMsg});
}
