import 'dart:async';

import 'package:get/get.dart';
import 'package:nextflix_clone/util/tmdb/api.dart';
import 'package:nextflix_clone/util/tmdb/model/movie.dart';

class HomeViewModel extends GetxController {
  static HomeViewModel get to => Get.find();

  List<String> posterUrls1 = [
    '/qc9Z2If5kiZeAv1VQW7EhBBGBrG.jpg',
    '/5RsZJfcXUndClV1vaI68V2shJOs.jpg',
    '/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg',
  ].obs;

  List<String> posterUrls2 = [
    '/qc9Z2If5kiZeAv1VQW7EhBBGBrG.jpg',
    '/5RsZJfcXUndClV1vaI68V2shJOs.jpg',
    '/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg',
  ].obs;

  List<String> posterUrls3 = [
    '/qc9Z2If5kiZeAv1VQW7EhBBGBrG.jpg',
    '/5RsZJfcXUndClV1vaI68V2shJOs.jpg',
    '/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg',
  ].obs;

  @override
  void onInit() {
    Timer(Duration(seconds: 1), () {
      getMoviePosterList();
    });

    super.onInit();
  }

  getMoviePosterList() async {
    List<Movie> topRateMovie = await MyTMDBApi.to.getMovieTopRated();

    posterUrls1 = [];
    for (var element in topRateMovie) {
      posterUrls1.add(element.posterPath);
    }

    List<Movie> popuplarMovie = await MyTMDBApi.to.getPouplar();
    posterUrls2 = [];
    for (var element in popuplarMovie) {
      posterUrls2.add(element.posterPath);
    }

    List<Movie> weekTrendingMovie = await MyTMDBApi.to.getWeekTrending();
    posterUrls3 = [];
    for (var element in weekTrendingMovie) {
      posterUrls3.add(element.posterPath);
    }

    update();
  }
}
