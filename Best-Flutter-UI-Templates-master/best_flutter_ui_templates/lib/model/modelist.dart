
import 'package:best_flutter_ui_templates/hotel_booking/hotel_home_screen.dart';
import 'package:best_flutter_ui_templates/record_buttons/navigation_record_screen.dart';
import '../checkrecord_screen.dart';
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
      navigateScreen: CheckRecordScreen(),
    ),
    ModeList(
      imagePath: 'assets/mode_pictures/licenseLookup.png',
     // navigateScreen: DesignCourseHomeScreen(),
    ),
  ];
}
