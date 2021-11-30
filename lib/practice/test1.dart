import 'package:flutter/material.dart';
import 'package:nextflix_clone/setting/start.dart';
import 'package:nextflix_clone/util/logger/ready.dart';
import 'package:nextflix_clone/util/tmdb/ready.dart';

class Test1 extends StatefulWidget {
  const Test1({Key? key}) : super(key: key);

  @override
  _Test1State createState() => _Test1State();
}

class _Test1State extends State<Test1> {

  @override
  void initState() {
    test();
    super.initState();
  }

  test() async {
    Map getTopRated = await tmdb.v3.movies.getTopRated(language: 'ko',region: 'KR');
    // myLogger.d(getTopRated);

    Map getPouplar = await tmdb.v3.movies.getPouplar(language: 'ko',region: 'KR');
    // myLogger.d(getPouplar);


    Map queryMovies = await tmdb.v3.search.queryMovies("매트릭스",language: 'ko',region: 'KR');
    // myLogger.d(queryMovies);

    String imageUrl = await tmdb.images.getUrl("/tva2OlLELCagFynFibcefhn2D9i.jpg") ?? "";
    myLogger.d(imageUrl);

    // var getPouplar2 = await MyTMDBApi.to.getPouplar();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


main() async {
  return await startApp(Test1());
}