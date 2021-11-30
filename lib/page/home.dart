import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:nextflix_clone/component/netflix_horizental_list.dart';
import 'package:nextflix_clone/page/vm.dart';
import 'package:nextflix_clone/setting/constant.dart';
import 'package:nextflix_clone/setting/start.dart';
import 'package:nextflix_clone/util/tmdb/ready.dart';
import 'package:styled_widget/styled_widget.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: Colors.black,
            body: GetBuilder<HomeViewModel>(
              builder: (viewModel) => SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container()
                            .backgroundImage(DecorationImage(
                            image: CachedNetworkImageProvider(
                                tmdb.images.getUrl('wv22frLmCpXDRjKj4MWFwa4eTOK.jpg')!),
                            fit: BoxFit.cover))
                            .height(480),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.black.withOpacity(1),
                              Colors.black.withOpacity(0.0),
                              Colors.black.withOpacity(0.25),
                              Colors.black.withOpacity(1),
                            ], end: Alignment.topCenter, begin: Alignment.bottomCenter),
                          ),
                        ).height(480),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container()
                                    .backgroundImage(DecorationImage(
                                    image: CachedNetworkImageProvider(netflixIconUrl),
                                    fit: BoxFit.contain))
                                    .height(30)
                                    .width(30)
                                    .opacity(0.9),
                                Icon(FontAwesomeIcons.chromecast).iconSize(26).opacity(0.7),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text("TV프로그램"),
                                Text("영화"),
                                Text("카테고리"),
                              ],
                            ).opacity(0.8),
                          ],
                        ).padding(left: 6,right: 10 , vertical: 15),
                        Column(
                          children: [
                            SizedBox(
                              height: 440,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("긴장감 넘치는").textStyle(Theme.of(context).textTheme.bodyText1!)
                                    .alignment(Alignment.center)
                                    .opacity(0.9),
                                Icon(Entypo.dot_single).iconColor(Colors.red).iconSize(18),
                                Text("액션스릴러").textStyle(Theme.of(context).textTheme.bodyText1!)
                                    .alignment(Alignment.center)
                                    .opacity(0.9),
                              ],),


                            SizedBox(height: 13,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(children: [
                                  Icon(Icons.add).iconSize(30),
                                  SizedBox(height: 2,),
                                  Text("내가 찜한 콘텐츠")
                                ],).expanded(),
                                Container(
                                  child: Row(children: [
                                    Icon(FontAwesomeIcons.play).iconSize(14).iconColor(Theme.of(context).backgroundColor),
                                    SizedBox(width: 5,),
                                    Text("재생").textColor(Theme.of(context).backgroundColor).fontWeight(FontWeight.bold)
                                  ],).padding(horizontal: 30,vertical: 8),
                                  decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .color!,
                                      borderRadius:
                                      BorderRadius.all(Radius.circular(3))),
                                ),
                                Column(children: [
                                  Icon(Icons.info_outline).iconSize(30),
                                  SizedBox(height: 2,),
                                  Text("정보")
                                ],).expanded(),
                              ],).opacity(0.8),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(height: 20,),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls1,
                      width: 110,
                      height: 170, listLabel: "넷플릭스 인기 콘텐츠",
                    ),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls2,
                      width: 110,
                      height: 170, listLabel: "지금 뜨는 콘텐츠",
                    ),
                    NetFliHorizontalList(
                      posterUrls: viewModel.posterUrls3,
                      width: 170,
                      height: 250, listLabel: "오직 넷플릭스에서",
                    ),
                  ],
                ),
              ),
            )));
  }
}

main() async {
  return await startApp(Home());
}
