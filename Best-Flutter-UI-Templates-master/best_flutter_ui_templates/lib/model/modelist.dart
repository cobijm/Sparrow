import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/record_buttons/navigation_record_screen.dart';
import 'package:best_flutter_ui_templates/record_buttons/record_button_screen.dart';
import 'package:flutter/widgets.dart';

class ModeList {
  ModeList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<ModeList> modeList = [
    ModeList(
      imagePath: 'assets/mode_pictures/drive.png', 
      navigateScreen: NavigationRecordScreen(),
    ),
    ModeList(
      imagePath: 'assets/mode_pictures/checkRecords.png',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    ModeList(
      imagePath: 'assets/mode_pictures/licenseLookup.png',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
