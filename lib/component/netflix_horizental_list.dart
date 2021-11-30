import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nextflix_clone/setting/start.dart';
import 'package:nextflix_clone/util/logger/ready.dart';
import 'package:nextflix_clone/util/tmdb/ready.dart';
import 'package:styled_widget/styled_widget.dart';

class NetFliHorizontalList extends StatelessWidget {
  NetFliHorizontalList(
      {Key? key,
      required this.posterUrls,
      required this.height,
      required this.width,
      required this.listLabel})
      : super(key: key);
  List<String> posterUrls;
  double height;
  double width;
  String listLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(listLabel)
            .textStyle(Theme.of(context).textTheme.headline6!)
            .fontWeight(FontWeight.w600)
            .fontSize(22)
            .alignment(Alignment.centerLeft)
            .padding(bottom: 4),
        Container(
          height: height,
          width: double.infinity,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: posterUrls.length,
              itemBuilder: (context, index) {
                return Container(
                    margin: const EdgeInsets.only(right: 8),
                    width: width,
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: DecorationImage(
                          image: CachedNetworkImageProvider(
                              tmdb.images.getUrl(posterUrls[index])!),
                          fit: BoxFit.cover),
                    )).gestures(onTap: (){myLogger.d("hello");});
              }),
        )
      ],
    ).padding(bottom: 20);
  }
}

main() async {
  return await startApp(SafeArea(
      child: Scaffold(
    body: NetFliHorizontalList(
      posterUrls: [
        '/qc9Z2If5kiZeAv1VQW7EhBBGBrG.jpg',
        '/5RsZJfcXUndClV1vaI68V2shJOs.jpg',
        '/fNG7i7RqMErkcqhohV2a6cV1Ehy.jpg',
      ],
      width: 120,
      height: 180, listLabel: "넷플릭스 인기 콘텐츠",
    ),
  )));
}
