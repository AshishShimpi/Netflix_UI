import 'package:Netflix_UI/models/movie_model.dart';
import 'package:Netflix_UI/widgets/circular_clipper.dart';
import 'package:Netflix_UI/widgets/content_scroll.dart';
import 'package:flutter/material.dart';

class MovieScreen extends StatefulWidget {
  final Movie movie;

  MovieScreen({this.movie});
  @override
  State<StatefulWidget> createState() {
    return MovieScreenState();
  }
}

class MovieScreenState extends State<MovieScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                transform: Matrix4.translationValues(0.0, -50, 0.0),
                child: Hero(
                  tag: widget.movie.imageUrl,
                  child: ClipShadowPath(
                    shadow: Shadow(blurRadius: 20.0),
                    clipper: CircularClipper(),
                    child: Image(
                      image: AssetImage(
                        widget.movie.imageUrl,
                      ),
                      height: 400.0,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    tooltip: 'To go on home screen',
                    padding: EdgeInsets.only(left: 30.0),
                    icon: Icon(
                      Icons.arrow_back,
                    ),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Image(
                    image: AssetImage('images/netflix_logo.png'),
                    height: 60.0,
                    width: 150.0,
                  ),
                  IconButton(
                    tooltip: 'Add this to favourite',
                    padding: EdgeInsets.only(right: 30.0),
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                    iconSize: 30.0,
                    color: Colors.black,
                    onPressed: () {
                      print('Add this to favourite');
                    },
                  ),
                ],
              ),
              Positioned.fill(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: RawMaterialButton(
                    elevation: 12.0,
                    shape: CircleBorder(),
                    onPressed: () {
                      print('play video');
                    },
                    child: Icon(
                      Icons.play_arrow,
                      color: Colors.pink,
                      size: 60.0,
                    ),
                    fillColor: Colors.white,
                  ),
                ),
                bottom: 20.0,
              ),
              Positioned(
                bottom: 0.0,
                left: 10.0,
                child: Icon(
                  Icons.add,
                  color: Colors.black,
                  size: 40.0,
                ),
              ),
              Positioned(
                bottom: 0.0,
                right: 10.0,
                child: Icon(
                  Icons.share,
                  color: Colors.black,
                  size: 30.0,
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  widget.movie.title.toUpperCase(),
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 12.0),
                Text(
                  widget.movie.categories,
                  style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 14.0,
                      color: Colors.black54),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18.0),
                Text(
                  '⭐⭐⭐⭐',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 18.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Year',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.year}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Country',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.country}',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          'Length',
                          style: TextStyle(
                            color: Colors.black54,
                          ),
                        ),
                        SizedBox(height: 2.0),
                        Text(
                          '${widget.movie.length} min',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 20.0,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 15.0),
                Container(
                  height: 134.0,
                  child: SingleChildScrollView(
                    child: Text(
                      widget.movie.description,
                      style: TextStyle(color: Colors.black54),
                    ),
                  ),
                ),
              ],
            ),
          ),
          ContentScroll(
            title: 'Screenshots',
            images: widget.movie.screenshots,
            imgheight: 160.0,
            imgwidth: 200.0,
          ),
        ],
      ),
    );
  }
}
