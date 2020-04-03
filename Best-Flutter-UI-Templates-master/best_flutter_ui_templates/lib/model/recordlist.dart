import 'package:best_flutter_ui_templates/design_course/home_design_course.dart';
import 'package:best_flutter_ui_templates/fitness_app/fitness_app_home_screen.dart';
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:flutter/widgets.dart';

class RecordList {
  RecordList({
    this.navigateScreen,
    this.imagePath = '',
  });

  Widget navigateScreen;
  String imagePath;

  static List<RecordList> recordList = [
    RecordList(
      imagePath: 'assets/button_pictures/play.JPG', 
      navigateScreen: DesignCourseHomeScreen(),
    ),
    RecordList(
      imagePath: 'assets/button_pictures/pause.JPG',
      navigateScreen: FitnessAppHomeScreen(),
    ),
    RecordList(
      imagePath: 'assets/button_pictures/stop.JPG',
      navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
