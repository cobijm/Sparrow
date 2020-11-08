import 'package:best_flutter_ui_templates/record_buttons/navigation_record_screen.dart';
import '../checkrecord_screen.dart';
import '../VideosScreen.dart';

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
      imagePath: 'assets/mode_pictures/viewVideos.png',
      navigateScreen: VideosScreen(),
    ),
    ModeList(
      imagePath: 'assets/mode_pictures/licenseLookup.png',
      navigateScreen: CheckRecordScreen(),
    ),
  ];

}
