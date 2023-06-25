

import 'package:flutter/material.dart';

class MovieDescription extends StatefulWidget {
  String releaseDate;
  String overView;
  String title;
  String moviePhoto;
  String averageRating;
  
  
 MovieDescription({super.key, required this.releaseDate, required this.overView, required this.title, required this.moviePhoto, required this.averageRating});

  @override
  State<MovieDescription> createState() => _MovieDescriptionState();
}

class _MovieDescriptionState extends State<MovieDescription> {
  @override
  Widget build(BuildContext context) {
    Orientation orientation = MediaQuery.of(context).orientation;
    return Scaffold(

      body: SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8.0, 15.0, 8.0, 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            
            children: [
          
            Stack(children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * .40,
                
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.network(widget.moviePhoto == null? "" : widget.moviePhoto,
                  fit: BoxFit.fill,
                  
                  ),
                )),
          
                Positioned(
                  bottom: 10,
                  left: 10,
                  
                  child: Container(
                  color: Colors.black38,
                child: Text("⭐Average Rating - ${widget.averageRating}", style: TextStyle(fontWeight: FontWeight.bold,
                color: Colors.white),),
                  
          
          
          
                ))
          
            ],
            ),
          
            Text(widget.title, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23.0, fontStyle: FontStyle.italic,
            color: Colors.white
            
            ),),
            Text("Releasing on: ${widget.releaseDate}", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,
            color: Colors.yellow
            ),),
          
           
          
            Container(
              width: double.infinity,
              // height: MediaQuery.of(context).size.height * .20,
              
              child: Text(widget.overView,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
           
              style: TextStyle(
                color: Colors.white,
                fontSize: orientation == Orientation.portrait?17 : 19,
              ),

              // overflow: TextOverflow.ellipsis,
              // maxLines: 2,
           
            
            ),
            
            
            ),
          
          
          
          
          
          
          ],),
        ),
      ),


    );
  }
}