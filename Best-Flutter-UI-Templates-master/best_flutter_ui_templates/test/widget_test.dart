// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.
import 'package:best_flutter_ui_templates/model/homelist.dart';
import 'package:best_flutter_ui_templates/loginpage_classes/login_page.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {


  test('test loginpage', () {
    final lgpage = LoginPage();

    var lg = lgpage.createState();
        final Future<dynamic> future = lg.fetchLogin("cjmom@iastate.edu", "cobipw");
        expect(future,  completion(equals(200) )   );

  });



  test('test homelist', () {
    final hmlist = HomeList();

  });






}
