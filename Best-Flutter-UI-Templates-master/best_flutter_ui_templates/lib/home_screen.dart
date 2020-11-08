import 'package:best_flutter_ui_templates/app_theme.dart';
import 'package:flutter/material.dart';
import 'model/homelist.dart';
import 'package:best_flutter_ui_templates/loginpage_classes/login_page.dart' as loginpage;
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:best_flutter_ui_templates/navigation_home_screen.dart';

String globalMake;
String carInfo;


class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  List<HomeList> homeList = HomeList.homeList;
  AnimationController animationController;
  bool multiple = true;
  final _formKey = GlobalKey<FormState>();
  final makeController = TextEditingController();
  final modelController = TextEditingController();
  final yearController = TextEditingController();
  final plateController = TextEditingController();




  @override
  void initState() {
    animationController = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    super.initState();
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 0));
    return true;
  }

  @override
  void dispose() {
    animationController.dispose();
    makeController.dispose();
    modelController.dispose();
        yearController.dispose();
            plateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.white,
      body: FutureBuilder<bool>(
        future: getData(),
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (!snapshot.hasData) {
            return const SizedBox();
          } else {
            return Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,

                children: <Widget>[
                  appBar(),
                  Expanded(
                    child: FutureBuilder<bool>(
                      future: getData(),
                      builder:
                          (BuildContext context, AsyncSnapshot<bool> snapshot) {
                        if (!snapshot.hasData) {
                          return const SizedBox();
                        } else {
                          return GridView(
                            padding: const EdgeInsets.only(
                                top: 0, left: 12, right: 12),
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            children: List<Widget>.generate(
                              homeList.length,
                              (int index) {
                                final int count = homeList.length;
                                final Animation<double> animation =
                                    Tween<double>(begin: 0.0, end: 1.0).animate(
                                  CurvedAnimation(
                                    parent: animationController,
                                    curve: Interval((1 / count) * index, 1.0,
                                        curve: Curves.fastOutSlowIn),
                                  ),
                                );
                                animationController.forward();
                                return HomeListView(
                                  animation: animation,
                                  animationController: animationController,
                                  listData: homeList[index],
                                  callBack: () {
                                    Navigator.push<dynamic>(
                                      context,
                                      MaterialPageRoute<dynamic>(
                                        builder: (BuildContext context) =>
                                            homeList[index].navigateScreen,
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: multiple ? 2 : 1,
                              mainAxisSpacing: 12.0,
                              crossAxisSpacing: 12.0,
                              childAspectRatio: 1.5,
                            ),
                          );
                        }
                      },
                    ),
                  ),


            Expanded(

                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: RaisedButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    content: Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned(
                          right: -40.0,
                          top: -40.0,
                          child: InkResponse(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: CircleAvatar(
                              child: Icon(Icons.close),
                              backgroundColor: Colors.red,
                            ),
                          ),
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: makeController,
                                  decoration: InputDecoration(
                                  labelText: 'Make *',
                                  ),
                                ),

                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: modelController,

                                  decoration: const InputDecoration(
                                  labelText: 'Model *',
                                  ),

                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: yearController,

                                  decoration: const InputDecoration(
                                  labelText: 'Year *',
                                  ),

                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: TextFormField(
                                  controller: plateController,

                                  decoration: const InputDecoration(
                                  labelText: 'License Plate *',
                                  ),

                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RaisedButton(
                                  child: Text("Add Car"),
                                  onPressed: () {

                                      fetchAddCar( loginpage.globalEmail,makeController.text, modelController.text,yearController.text,plateController.text );

                                    if (_formKey.currentState.validate()) {
                                      _formKey.currentState.save();

                                    }
                                  },

                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                });
          },
                    child: const Text('Add Car', style: TextStyle(fontSize: 20)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,
                  ),
                  ),
                ),

            Expanded(
                  child: Align(
                    alignment: Alignment.topCenter ,
                    child: RaisedButton(
                      onPressed: (){


                        fetchgetCar(loginpage.globalEmail);


                      },
                    child: const Text('Car Info', style: TextStyle(fontSize: 20)),
                    color: Colors.blue,
                    textColor: Colors.white,
                    elevation: 5,

                    ),
                  ),
                ),

                ],
                
              ),




            );
          }
        },
      ),
    );
  }

  Widget appBar() {
    return SizedBox(
      height: AppBar().preferredSize.height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, left: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
            ),
          ),
          Expanded(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  'Sparrow',
                  style: TextStyle(
                    fontSize: 22,
                    color: AppTheme.darkText,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8),
            child: Container(
              width: AppBar().preferredSize.height - 8,
              height: AppBar().preferredSize.height - 8,
              color: Colors.white,
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius:
                      BorderRadius.circular(AppBar().preferredSize.height),
                  child: Icon(
                    multiple ? Icons.dashboard : Icons.view_agenda,
                    color: AppTheme.dark_grey,
                  ),
                  onTap: () {
                    setState(() {
                      multiple = !multiple;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future fetchAddCar(String email,String make, String model, String modelYear, String licensePlate) async {
    String addCarUrl =
        'https://zazgdz4b1l.execute-api.us-east-2.amazonaws.com/addcar';
    email = email.trim();
    make = make.trim();
    model = model.trim();
    modelYear = modelYear.trim();
    licensePlate = licensePlate.trim();

    print(email);
    print(make);
    print(model);
    print(modelYear);
    print(licensePlate);

    String json = '{"email":' + '"' + email + '"' + ', "make":' + '"' + make +'"'
    + ', "model":' + '"' + model  + '"' +  ', "modelYear":' + '"' +  modelYear + '"' 
    + ', "licensePlate":' + '"' + licensePlate +'"'
    + '}';
    

    final response = await http.post(addCarUrl, body: json);

    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    var code = response.statusCode;
    if (code == 200) {
      // String carMake = 'Make: ${convertedDataToJson['make']}';
      // String carModel = 'Model: ${convertedDataToJson['model']}';
      // String carYear = 'Year: ${convertedDataToJson['modelYear']}';
      // String carPlate = 'License Plate: ${convertedDataToJson['licensePlate']}';
      //carInfo = carMake + '\n' + carModel + '\n' + carYear + '\n' + carPlate;

        Navigator.push(context,
            MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
    }
    else
    {
      showDialog(
      context: context ,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("add Car Failed"),
          content: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    }
    return response.statusCode;
  }




  Future fetchgetCar(String email) async {
    String getCarUrl =
        'https://zazgdz4b1l.execute-api.us-east-2.amazonaws.com/default/getusercars';
    email = email.trim();
    String json = '{"email": "' + email + '"}';
    

    final response = await http.post(getCarUrl, body: json);

    var convertedDataToJson = jsonDecode(response.body);
    print(convertedDataToJson);
    var code = response.statusCode;
    if (code == 200) {
      String carMake = 'Make: ${convertedDataToJson['make']}';
      String carModel = 'Model: ${convertedDataToJson['model']}';
      String carYear = 'Year: ${convertedDataToJson['modelYear']}';
      String carPlate = 'License Plate: ${convertedDataToJson['licensePlate']}';

      carInfo = carMake + '\n' + carModel + '\n' + carYear + '\n' + carPlate;



      showDialog(
      context: context ,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Info"),
          content: new Text(carInfo),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );




      //  Navigator.push(context,
      //      MaterialPageRoute(builder: (context) => NavigationHomeScreen()));
    }
    else
    {
      showDialog(
      context: context ,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("get Car Failed"),
          content: new Text(""),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );

    }
    return response.statusCode;
  }












}

class HomeListView extends StatelessWidget {
  const HomeListView(
      {Key key,
      this.listData,
      this.callBack,
      this.animationController,
      this.animation})
      : super(key: key);

  final HomeList listData;
  final VoidCallback callBack;
  final AnimationController animationController;
  final Animation<dynamic> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget child) {
        return FadeTransition(
          opacity: animation,
          child: Transform(
            transform: Matrix4.translationValues(
                0.0, 50 * (1.0 - animation.value), 0.0),
            child: AspectRatio(
              aspectRatio: 1.5,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: <Widget>[
                    Image.asset(
                      listData.imagePath,
                      fit: BoxFit.cover,
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: Colors.grey.withOpacity(0.2),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(4.0)),
                        onTap: () {
                          callBack();
                        },
                      ),
                    ),

                  Align(
                    alignment: FractionalOffset.bottomLeft ,
                    child: FlatButton(
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onPressed: (){},
                      child: Text(
                        listData.myText,
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontFamily: "WorkSansSemiBold"),
                            ),
                    ),
                  ),


                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}























class RowsAndColumns extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 100.0),
      child: IntrinsicHeight(
        child: Row(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          Expanded(
            child: Column(children: [
              Container(height: 120.0, color: Colors.yellow),
              Container(height: 100.0, color: Colors.cyan),
            ]),
          ),
          Expanded(child: Container(color: Colors.amber)),
        ]),
      ),
    );
  }
}