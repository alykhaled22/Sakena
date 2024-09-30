import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakena/cubit/prayers_cubit.dart';
import 'package:sakena/views/home_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const Sakena());
}

class Sakena extends StatelessWidget {
  const Sakena({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PrayersCubit>(
      create: (context) => PrayersCubit()..getPrayerTimes(),
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomeView(),
      ),
    );
  }
}
