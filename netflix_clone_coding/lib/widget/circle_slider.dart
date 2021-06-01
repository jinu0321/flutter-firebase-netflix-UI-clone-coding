import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_clone_coding/model/model_movie.dart';
import 'package:netflix_clone_coding/screen/detail_screen.dart';

class CircleSlider extends StatelessWidget {
  final List<Movie> movies;

  CircleSlider(this.movies);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(7),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('미리보기'),
              Container(
                  height: 120,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: makeCircleImages(context, movies),
                  ))
            ]));
  }
}

List<Widget> makeCircleImages(BuildContext context, List<Movie> movies) {
  List<Widget> results = [];
  for (var i = 0; i < movies.length; i++) {
    results.add(InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return DetailScreen(movies[i]);
              }));
        },
        child: Container(
            padding: EdgeInsets.only(right: 10),
            child: Align(
                alignment: Alignment.centerLeft,
                child: CircleAvatar(
                    backgroundImage: AssetImage('images/' + movies[i].poster),
                    radius: 48)))));
    // 닫는 괄호를 이렇게 한 번에 모으는 게 나을까, 아니면 하나씩 펼치는 게 나을까?
  }
  return results;
}
