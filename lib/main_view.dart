import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sakena/Features/home/presentation/view/home_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white.withOpacity(0.9),
        selectedItemColor: const Color(0xff0F5959),
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        onTap: (index) {

        },
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.mosque),
            label: "Prayer times",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.bellSlash),
            label: "Sakena",
          )
        ],
      ),
      body: const HomeViewBody(),
    );
  }
}



// Color getThemeColor(String prayer) {
//   switch (prayer) {
//     case 'Duhr':
//     case 'Asr':
//       return const Color(0xffC47157);
//     case 'fajr':
//       return const Color(0xff0F5959);
//     default:
//       return Colors.white;
//   }
// }
