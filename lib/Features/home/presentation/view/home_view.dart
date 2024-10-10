import 'package:adhan/adhan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakena/Features/home/manager/prayers_cubit/prayers_cubit.dart';
import 'package:sakena/Features/home/manager/prayers_cubit/prayers_states.dart';
import 'package:sakena/Features/home/presentation/view/widgets/all%20prayers%20section/all_prayers_section.dart';
import 'package:sakena/Features/home/presentation/view/widgets/next%20prayer%20section/next_prayers_section.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PrayersCubit, PrayersState>(
      builder: (context, state) {
        if (state is PrayersSuccessState) {
          List<PrayerTimes> prayerTimes =
              BlocProvider.of<PrayersCubit>(context).prayerTimes;
          List<DateTime> dates = BlocProvider.of<PrayersCubit>(context).dates;
          String location =
              BlocProvider.of<PrayersCubit>(context).map["location"];
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  // Color(0xff217373),
                  Color(0xff0A3A40),
                  Color(0xff172026),
                ],
              ),
            ),
            child: SafeArea(
              child: Center(
                child: Column(
                  children: [
                    NextPrayersSection(
                      tommoroPrayerTime: prayerTimes[6],
                      prayerTime: prayerTimes[5],
                      location: location,
                    ),
                    SizedBox(
                      height: 430,
                      width: double.infinity,
                      child: PageView.builder(
                        controller: BlocProvider.of<PrayersCubit>(context)
                            .pageController,
                        itemCount: prayerTimes.length,
                        itemBuilder: (context, index) {
                          return AllPrayersSection(
                            pageController:
                                BlocProvider.of<PrayersCubit>(context)
                                    .pageController,
                            prayerTimes: prayerTimes[index],
                            date: dates[index],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else if (state is PrayersFailureState) {
          return Center(
            child: Text(state.errMsg),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
