import 'package:dashboard_book_land/src/page/home/widget/aircraft_cars_mechanics_and_physics.dart';
import 'package:dashboard_book_land/src/page/home/widget/coming_book.dart';
import 'package:dashboard_book_land/src/page/home/widget/custom_app_bar.dart';
import 'package:dashboard_book_land/src/page/home/widget/psychology_human_mind_and_behaviour.dart';
import 'package:dashboard_book_land/src/page/home/widget/recommended_book.dart';
import 'package:dashboard_book_land/src/page/home/widget/trending.dart';
import 'package:dashboard_book_land/src/page/home/widget/divers_book.dart';
import 'package:dashboard_book_land/src/settings/settings_controller.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final SettingsController settingsController;
  const HomePage({Key? key, required this.settingsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          CustomAppBar(settingsController: settingsController),
          ComingBook(),
          RecommendedBook(),
          Trending1Book(),
          PsychologyBook(),
          AircraftBook(),
          DiversBooks(),
        ],
      ),
      /*
      bottomNavigationBar: _buildBottomNavigation(),
      */
    );
  }


/*
  BottomNavigationBar _buildBottomNavigation() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      selectedItemColor: Color(0xFF6741FF),
      items: const [
        BottomNavigationBarItem(
          label: 'Home',
          icon: Icon(Icons.home_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Book',
          icon: Icon(Icons.menu_book_rounded),
        ),
        BottomNavigationBarItem(
          label: 'Column',
          icon: Icon(Icons.view_week_outlined),
        ),
        BottomNavigationBarItem(
          label: 'Person',
          icon: Icon(Icons.person_outline),
        )
      ],
    );
  }

  */
}
