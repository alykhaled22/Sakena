import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakena/Features/home/manager/prayers_cubit/prayers_cubit.dart';
import 'package:sakena/main_view.dart';
import 'package:sakena/Features/sakena/presentation/view/sakena.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await NotificationService.init();
  //await NotificationService.requestNotificationPermission(); // Request permission for notifications
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
