import 'package:flutter/material.dart';

class HomeBottomNavBarItem extends BottomNavigationBarItem {
  HomeBottomNavBarItem({
    required String label,
    required String activeAsset,
    required String inactiveAsset,
    double iconWodth = 18,
    double iconHeight = 18,
    double marginTop = 20,
  }) : super(
         label: label,
         icon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),
           child: Image.asset(
             inactiveAsset,
             width: iconWodth,
             height: iconHeight,
           ),
         ),
         activeIcon: Container(
           margin: EdgeInsets.only(top: marginTop, bottom: 5),
           child: Image.asset(
             activeAsset,
             width: iconWodth,
             height: iconHeight,
           ),
         ),
       );
}
