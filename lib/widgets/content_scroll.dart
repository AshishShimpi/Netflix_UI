import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ContentScroll extends StatelessWidget {
  final List<String> images;
  final String title;
  final double imgheight;
  final double imgwidth;

  ContentScroll({this.images, this.title, this.imgheight, this.imgwidth});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 40.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w500),
              ),
              GestureDetector(
                onTap: () {
                  print('My List');
                },
                child: Icon(
                  Icons.arrow_forward,
                  size: 28.0,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Container(
          height: imgheight,
          child: ListView.builder(
            itemCount: images.length,
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            itemBuilder: (BuildContext context, int index) {
              return Container(
                width: imgwidth,
                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black,
                          offset: Offset(0.0, 4.0),
                          blurRadius: 6.0),
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image(
                    image: AssetImage(images[index]),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
