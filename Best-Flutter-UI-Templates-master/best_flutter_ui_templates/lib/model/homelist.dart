import 'dart:convert';
import 'package:best_flutter_ui_templates/Mode_Selection/navigation_mode_screen.dart';
import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import '../navigation_home_screen.dart';
import 'package:path/path.dart' as Path;
import 'package:best_flutter_ui_templates/loginpage_classes/login_page.dart' as loginpage;

class HomeList {
  HomeList({
    this.navigateScreen,
    this.imagePath = '',
    this.myText = "",
  });

  Widget navigateScreen;
  String imagePath;
  String myText;

  static List<HomeList> homeList = [
    HomeList(
      //myText: loginpage.carInfo,
      imagePath: 'assets/car_pictures/car1.png', 
      navigateScreen: NavigationModeScreen(),
    ),
    // HomeList(
    //   imagePath: 'assets/car_pictures/car2.png',
    //   navigateScreen: NavigationModeScreen(),
    // ),
    // HomeList(
    //   imagePath: 'assets/car_pictures/car3.png',
    //   navigateScreen: NavigationModeScreen(),
    // ),
  ];



}
