import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_font_icons/flutter_font_icons.dart';
import 'package:icofont_flutter/icofont_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../setting/start.dart';
import 'home.dart';

class BottomNavi extends StatefulWidget {
  const BottomNavi({Key? key}) : super(key: key);

  @override
  _BottomNavi createState() => _BottomNavi();
}

class _BottomNavi extends State<BottomNavi> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black.withOpacity(0.9), //textTheme.bodyText1!.color!,
        selectedItemColor: Theme.of(context).textTheme.bodyText1!.color!,
        unselectedItemColor: Colors.grey.shade700,
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _selectedIndex,
        selectedLabelStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
        unselectedLabelStyle: Theme.of(context).textTheme.caption!.copyWith(fontSize: 10),
        //현재 선택된 Index
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: '홈',
            icon: Icon(Icons.home),
            activeIcon: Icon(Icons.home,color: Theme.of(context).textTheme.bodyText1!.color!,),
          ),
          BottomNavigationBarItem(
            label: 'NEW & HOT',
            icon: Icon(MaterialCommunityIcons.play_box_multiple_outline),
            activeIcon: Icon(MaterialCommunityIcons.play_box_multiple_outline,color: Theme.of(context).textTheme.bodyText1!.color!,),
          ),
          BottomNavigationBarItem(
            label: '검색',
            icon: Icon(EvaIcons.search),
            activeIcon: Icon(EvaIcons.search,color: Theme.of(context).textTheme.bodyText1!.color!,),
          ),
          BottomNavigationBarItem(
            label: '저장한 콘텐츠',
            icon: Icon(MdiIcons.arrowDownCircleOutline),
            activeIcon: Icon(MdiIcons.arrowDownCircleOutline,color: Theme.of(context).textTheme.bodyText1!.color!,),
          ),
        ],
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }

  final List _widgetOptions = [
    Home(),
    Text(
      'Music',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'Places',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
    Text(
      'News',
      style: TextStyle(fontSize: 30, fontFamily: 'DoHyeonRegular'),
    ),
  ];
}

main() async {
  return await startApp(BottomNavi());
}
