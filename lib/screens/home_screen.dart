import 'package:Netflix_UI/models/movie_model.dart';
import 'package:Netflix_UI/screens/movie_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:Netflix_UI/widgets/content_scroll.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 1, viewportFraction: 0.8);
  }

  _movieSelector(int index) {
    return AnimatedBuilder(
      animation: _pageController,
      builder: (BuildContext context, Widget widget) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: [
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      offset: Offset(0.0, 4.0),
                      blurRadius: 10.0),
                ],
              ),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MovieScreen(movie: movies[index]),
                    ),
                  );
                },
                child: Center(
                  child: Hero(
                    tag: movies[index].imageUrl,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image(
                        image: AssetImage(movies[index].imageUrl),
                        height: 220.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 25.0,
              bottom: 40.0,
              child: Container(
                width: 260.0,
                child: Text(
                  movies[index].title,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w900,
                      fontSize: 17.0),
                ),
              ))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Padding(
          padding: EdgeInsets.only(left: 70.0),
          child: Image(
            image: AssetImage('images/netflix_logo.png'),
            width: 150.0,
          ),
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: 30.0),
          onPressed: () {
            print('menu pressed');
          },
          splashRadius: 30.0,
          icon: Icon(
            Icons.menu_rounded,
            size: 30.0,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            padding: EdgeInsets.only(right: 30.0),
            splashRadius: 30.0,
            onPressed: () {
              print('serched');
            },
            icon: Icon(
              Icons.search_rounded,
              size: 30.0,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: ListView(
        children: [
          Container(
            height: 280.0,
            width: double.infinity,
            child: PageView.builder(
                controller: _pageController,
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index) {
                  return _movieSelector(index);
                }),
          ),
          Container(
            height: 90.0,
            // color: Colors.black,
            child: ListView.builder(
                itemCount: labels.length,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 20.0),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: 160.0,
                    margin: EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.red[500],
                          Colors.red[700],
                          Colors.red[900]
                        ],
                      ),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.red[400],
                            offset: Offset(0.0, 3.0),
                            blurRadius: 6.0)
                      ],
                    ),
                    child: Center(
                      child: Text(
                        labels[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16.0,
                            letterSpacing: 1.8),
                      ),
                    ),
                  );
                }),
          ),
          SizedBox(height: 10.0),
          ContentScroll(
            title: 'My List',
            images: myList,
            imgheight: 250,
            imgwidth: 150.0,
          ),
          ContentScroll(
            title: 'Popular',
            images: popular,
            imgheight: 250,
            imgwidth: 150.0,
          ),
        ],
      ),
    );
  }
}
