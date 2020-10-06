import 'package:best_flutter_ui_templates/Mode_Selection/mode_selection_screen.dart';
import 'package:best_flutter_ui_templates/Mode_Selection/navigation_mode_screen.dart';
import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<HomeList> homeList = [
    HomeList(
      imagePath: 'assets/car_pictures/car1.png', 
      navigateScreen: NavigationModeScreen(),
    ),
    HomeList(
      imagePath: 'assets/car_pictures/car2.png',
      navigateScreen: NavigationModeScreen(),
    ),
    HomeList(
      imagePath: 'assets/car_pictures/car3.png',
      navigateScreen: NavigationModeScreen(),
    ),
  ];
}
