
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:best_flutter_ui_templates/loginpage_classes/login_page.dart' as loginpage;
import 'package:http/http.dart' as http;
import 'dart:convert';

String selectedResult;
      var videos = new List<Videos>();
String timeAndDate;

class VideosScreen extends StatefulWidget {
 static List <String> list =["Video 1", "Video 2"];// List.generate(10,(index) => "Texto $index");
  @override
  _VideosScreenState createState() => _VideosScreenState();
}

class RatingBar extends StatefulWidget {
RatingBarWidget createState() => RatingBarWidget();
}

class RatingBarWidget extends State {

double rating = 3 ;
double fiexdRating = 3;
@override
Widget build(BuildContext context) {



return Scaffold(
    body: new Center(
      child: new RaisedButton(
                      onPressed: (){
                        fetchgetVideos(loginpage.globalEmail);
                      },
        child: new Text('watch video'),
      ),
    ),
  
  );



}


}




  Future fetchgetTimeStamp(String email) async {
    String getCarUrl =
        'https://zazgdz4b1l.execute-api.us-east-2.amazonaws.com/default/getVideo?limit=2';
    email = email.trim();
    String json = '{"email": "' + email + '"}';
    print(email);


    final response = await http.post(getCarUrl,     headers: {
      "Content-Type": "application/json; charset=utf-8",
      "Accept": "application/json; charset=utf-8",
    }, body: json);

    Map myMap = jsonDecode(response.body);

    Iterable  convertedDataToJson = myMap['myVideos'];
        videos = convertedDataToJson.map((model) => Videos.fromJson(model)).toList();
      print(videos);



    print(convertedDataToJson);
    var code = response.statusCode;
    if (code == 200) {


      if (selectedResult == "Video 1")
      {
      String url = videos[0].epochTime;
    print(url);
    //display
timeAndDate = url;
        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }

      }

      if (selectedResult == "Video 2")
      {
      String url = videos[1].epochTime;
    print(url);
timeAndDate = url;

        // if (await canLaunch(url)) {
        //   await launch(url);
        // } else {
        //   throw 'Could not launch $url';
        // }

      }

      



    }
    else
    {

    }
    return response.statusCode;
  }





  Future fetchgetVideos(String email) async {
    String getCarUrl =
        'https://zazgdz4b1l.execute-api.us-east-2.amazonaws.com/default/getVideo?limit=2';
    email = email.trim();
    String json = '{"email": "' + email + '"}';
    print(email);


    final response = await http.post(getCarUrl, body: json);

    Map myMap = jsonDecode(response.body);
    Iterable  convertedDataToJson = myMap['myVideos'];        videos = convertedDataToJson.map((model) => Videos.fromJson(model)).toList();
      print(videos);



    print(convertedDataToJson);
    var code = response.statusCode;
    if (code == 200) {


      if (selectedResult == "Video 1")
      {
      String url = videos[0].url;
    print(url);

        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }

      }

      if (selectedResult == "Video 2")
      {
      String url = videos[1].url;
    print(url);

        if (await canLaunch(url)) {
          await launch(url);
        } else {
          throw 'Could not launch $url';
        }

      }

      



    }
    else
    {

    }
    return response.statusCode;
  }



class Videos {
  String url;
  String epochTime;

  Videos(String url, String epochTime) {
    this.url = url;
    this.epochTime = epochTime;
  }

  Videos.fromJson(Map json)
      : url = json['url'],
        epochTime = json['epochTime'];

  Map toJson() {
    return {'url': url, 'epochTime': epochTime};
  }
}





class _VideosScreenState extends State<VideosScreen> {
  Widget screenView;
  DrawerIndex drawerIndex;
  AnimationController sliderAnimationController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showSearch(context: context,delegate: Search(VideosScreen.list));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: ListView.builder(
      itemCount: VideosScreen.list.length,
      itemBuilder: (context,index) => ListTile(
        title:Text(
          VideosScreen.list[index],
        ),
      ),
    ),
  );
 }
}


class Search extends SearchDelegate{

@override 
List<Widget> buildActions(BuildContext context){

  return<Widget>[
    IconButton(
      icon: Icon(Icons.close),
      onPressed: () {
        query = "Search a video here";
      },
    ),
  ];

}

@override 
Widget buildLeading(BuildContext context){


    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );

}

//String selectedResult;

@override 
Widget buildResults(BuildContext context){

if (VideosScreen.list.contains(selectedResult))
{

  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
      appBar: AppBar(title: Text(timeAndDate)),
      body: Center(
        child: RatingBar(),
        ),
      )
      
    );


//  return Container(
//     child: Center(
//       child: Text(selectedResult),
//       ),
//     );
}
else
{
   return Container(
    child: Center(
      child: Text("Unable to find the video"),
      ),
    );
}



}

final List<String> listExample;
Search(this.listExample);
//List<String> recentList = ["recentPlate1", "recentPlate2"];
List<String> recentList = [];


@override 
Widget buildSuggestions(BuildContext context){

  List<String> suggestionList = [];
  query.isEmpty
      ? suggestionList =recentList
      :suggestionList.addAll(listExample.where(

        (element) => element.contains(query),
      ));
  return ListView.builder(
    itemCount: suggestionList.length,
    itemBuilder: (context, index){
      return ListTile(
        title: Text(
          suggestionList[index],
        ),
        onTap: (){
          selectedResult = suggestionList[index];
            fetchgetTimeStamp(loginpage.globalEmail);

         // showResults(context);

 Future.delayed(const Duration(milliseconds: 500), () {

          showResults(context);

   });


        },

      );
    },
  );
}





















}



