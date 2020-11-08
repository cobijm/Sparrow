
import 'package:best_flutter_ui_templates/custom_drawer/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class CheckRecordScreen extends StatefulWidget {
 static List <String> list =["PLATE123", "PLATE456", "ABC123"];// List.generate(10,(index) => "Texto $index");
  @override
  _CheckRecordScreenState createState() => _CheckRecordScreenState();
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
  body: SingleChildScrollView(
    child: Center(
    child: Column(
      children: <Widget>[
 
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Initial Rating: ', 
                  style: TextStyle(fontSize: 22))),
 
        SmoothStarRating(
          allowHalfRating: false,
          //unable to change because it is initial rating by all others people
          // onRatingChanged: (value) {
          //   setState(() {
          //     rating = value ;
          //   });
          // },
          starCount: 5,
          rating: fiexdRating,
          size: 40.0,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.0,           
        ),

        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Rating = '+'$fiexdRating', 
                  style: TextStyle(fontSize: 22))),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Rate the driver:', 
                  style: TextStyle(fontSize: 22))),

        //This allows user to rate the drivers
         SmoothStarRating(
          allowHalfRating: false,
          onRatingChanged: (value) {
            setState(() {
              rating = value ;
            });
          },
          starCount: 5,
          rating: rating,
          size: 40.0,
          color: Colors.green,
          borderColor: Colors.green,
          spacing:0.0,           
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text('Rating = '+'$rating', 
                  style: TextStyle(fontSize: 22))),
 
      ],
    ),
  )));
}


}

class _CheckRecordScreenState extends State<CheckRecordScreen> {
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
              showSearch(context: context,delegate: Search(CheckRecordScreen.list));
            },
            icon: Icon(Icons.search),
          )
        ],
        centerTitle: true,
        title: Text('Search Bar'),
      ),
      body: ListView.builder(
      itemCount: CheckRecordScreen.list.length,
      itemBuilder: (context,index) => ListTile(
        title:Text(
          CheckRecordScreen.list[index],
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
        query = "Search a car plate here";
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

String selectedResult;

@override 
Widget buildResults(BuildContext context){

if (CheckRecordScreen.list.contains(selectedResult))
{
  return MaterialApp(
  debugShowCheckedModeBanner: false,
  home: Scaffold(
      appBar: AppBar(title: Text(selectedResult)),
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
      child: Text("Unable to find the plate"),
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
          showResults(context);
        },

      );
    },
  );
}



}



