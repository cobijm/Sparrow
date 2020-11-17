// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:best_flutter_ui_templates/Mode_Selection/mode_selection_screen.dart';
import 'package:best_flutter_ui_templates/Mode_Selection/navigation_mode_screen.dart';
import 'package:best_flutter_ui_templates/VideosScreen.dart';
import 'package:best_flutter_ui_templates/checkrecord_screen.dart';
import 'package:best_flutter_ui_templates/home_screen.dart';
import 'package:best_flutter_ui_templates/model/homelist.dart';
import 'package:best_flutter_ui_templates/loginpage_classes/login_page.dart';
import 'package:best_flutter_ui_templates/record_buttons/navigation_record_screen.dart';
import 'package:best_flutter_ui_templates/record_buttons/record_button_screen.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('test loginpage', () {
    final lgpage = LoginPage();

    var lg = lgpage.createState();
        final Future<dynamic> future = lg.fetchLogin("cjmom@iastate.edu", "cobipw");

  });



  test('test homelist', () {
    final hm = MyHomePage();
    final temp = hm.createState();
    temp.initState();
   // temp.dispose();
  });



  test('test video screen', () {
    final hm = VideosScreen();
    final temp = hm.createState();
    temp.initState();
  });


  test('test CheckRecordScreen', () {
    final hm = CheckRecordScreen();
    final temp = hm.createState();
    temp.initState();
  });



  test('test NavigationModeScreen', () {
    final hm = NavigationModeScreen();
    final temp = hm.createState();
    temp.initState();
  });



  test('test ModeSelectionScreen', () {
    final hm = ModeSelectionScreen();
    final temp = hm.createState();
    temp.initState();
  });



  test('test NavigationRecordScreen', () {
    final hm = NavigationRecordScreen();
    final temp = hm.createState();
    temp.initState();
  });



  test('test RecordButtonScreen', () {
    final hm = RecordButtonScreen();
    final temp = hm.createState();
    temp.initState();
  });




}
