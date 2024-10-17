import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/chinese_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/greek_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/islamic_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/pharaonic_screen.dart';
import 'package:turath/features/components/customsearchdelegate.dart';
import 'package:turath/features/components/customveiwcategory.dart';

class CivilizationScreen extends StatefulWidget {
  const CivilizationScreen({super.key});

  @override
  State<CivilizationScreen> createState() => _CivilizationScreenState();
}

class _CivilizationScreenState extends State<CivilizationScreen> {
  List<CurrentveiwsApp> mainList = [
    CurrentveiwsApp(
        Assets.imagesPharaonicscreen, "Pharaonic", "(3150 BC - 30 BC)"),
    CurrentveiwsApp(
        Assets.imagesPexelsPhoto16013193, "Islamic", "(622 AD - 1924 AD)"),
    CurrentveiwsApp(Assets.imagesGreekscreen, "Greek", "(1200 BC - 146 BC)"),
    CurrentveiwsApp(
        Assets.imagesChinesescreen, "Chinese", "(2070 BC - 221 BC)"),
  ];

  List<dynamic>? filteredcurrentveiw;

  final Map<String, Widget> mainScreens = {
    "Pharaonic":  PharaonicScreen(),
    "Islamic":  IslamicScreen(),
    "Greek":  GreekScreen(),
    "Chinese": ChineseScreen(),
  };

  @override
  Widget build(BuildContext context) {
    MainshowSearch mainshowSearch = MainshowSearch(
        mainList: mainList,
        mainScreens: mainScreens,
        filteredcurrentveiw: filteredcurrentveiw ?? []);
    return Customveiwcategory(
        name: "Civilizations",
        mainList: mainList,
        mainScreens: mainScreens,
        delegateSearch: mainshowSearch);
  }
}

class CurrentveiwsApp {
  final String imagePath;
  final String name;
  final String history;
  CurrentveiwsApp(this.imagePath, this.name, this.history);
}
