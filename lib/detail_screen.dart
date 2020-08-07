import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wisatabandung/model/tourism_place.dart';

class DetailScreen extends StatelessWidget {

  final TourismPlace place;

  DetailScreen({@required this.place});

  var styleFonts = TextStyle(
    fontFamily: 'Quicksand',
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Stack(
                children: <Widget>[
                  Image.asset(place.imageAsset),
                  SafeArea(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(
                            Icons.arrow_back
                          ),
                          onPressed: (){
                            Navigator.pop(context);
                          },
                        ),
                        FavoriteButton(),
                      ],
                    ),
                  ),
                ],
              ),
//              ClipRRect(
//                borderRadius: BorderRadius.only(
//                  topRight: Radius.circular(30.0),
//                  topLeft: Radius.circular(30.0),
//                ),
//                child:Image.asset('images/farm-house.jpg'),
//              ),

              //Image.asset(place.imageAsset),
              Container(
                margin: EdgeInsets.only(top: 16.0),
                child: Text(
                  place.name,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'ConcertOne',
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(height: 8.0),
                        Text(place.openDays, style: styleFonts,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.access_time),
                        SizedBox(height: 8.0),
                        Text(place.openTime, style: styleFonts,),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Icon(Icons.monetization_on),
                        SizedBox(height: 8.0),
                        Text(place.ticketPrice, style: styleFonts,),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16.0),
                child: Text(
                    place.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16.0,
                  fontFamily: 'Quicksand'
                ),
                ),
              ),
              Container(
                height: 150,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: place.imageUrls.map((url){
                    return Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(url),
                      ),
                    );
                  }).toList(),

                ),
              ),
            ]),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget{
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton>{
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return IconButton(
      icon: Icon(
          isFavorite ? Icons.favorite : Icons.favorite_border,
      color: Colors.red,
      ),
      onPressed: (){
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
