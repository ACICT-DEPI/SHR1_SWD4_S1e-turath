import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customsearchdelegate.dart';
import 'package:turath/features/components/customveiwcategory.dart';
import 'package:turath/features/wars/Wars_classifications_screen/ainjalut_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/chinesecivilwar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/grecopersianwars_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/hittin_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/hundredyearswar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/octoberwar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/pharaonicliberationwars_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/worldwar1_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/worldwar2_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/yarmouk_screen.dart';

class WarsScreen extends StatefulWidget {
  const WarsScreen({super.key});

  @override
  State<WarsScreen> createState() => _WarsScreenState();
}

class _WarsScreenState extends State<WarsScreen> {
  List<CurrentveiwsApp> mainList = [
    CurrentveiwsApp(Assets.imagesPharaonicLiberation,
        "Pharaonic liberation Wars", "(1550 BC)"),
    CurrentveiwsApp(Assets.imagesBattleofYarmouk, "Yarmouk", "(636 AD)"),
    CurrentveiwsApp(Assets.imagesBattleofHattin, "Hittin", "(1187 AD)"),
    CurrentveiwsApp(Assets.imagesBattleofAinJalut, "Ain Jalut", "(1260 AD)"),
    CurrentveiwsApp(Assets.images6OctoberWar, "October 6 War", "(1973 AD)"),
    CurrentveiwsApp(
        Assets.imagesGrecoPersianWars, "Greco-Persian Wars", "(499 - 449 BC)"),
    CurrentveiwsApp(
        Assets.imagesHundredYearWar, "Hundred Years War", "(1337 - 1453 AD)"),
    CurrentveiwsApp(Assets.imagesWorldWarI, "World War I", "(1914 - 1918 AD)"),
    CurrentveiwsApp(
        Assets.imagesWorldwarII, "World War II", "(1939 - 1945 AD)"),
    CurrentveiwsApp(
        Assets.imagesChineseCivilWar, "Chinese Civil War", "(1927 - 1949 AD)"),
  ];

  List<dynamic>? filteredcurrentveiw;

  final Map<String, Widget> mainScreens = {
    "Pharaonic liberation Wars": const PharaonicliberationwarsScreen(),
    "Yarmouk": const YarmoukScreen(),
    "Hittin": const HittinScreen(),
    "Ain Jalut": const AinjalutScreen(),
    "October 6 War": const OctoberwarScreen(),
    "Greco-Persian Wars": const GrecopersianwarsScreen(),
    "Hundred Years War": const HundredyearswarScreen(),
    "World War I": const Worldwar1Screen(),
    "World War II": const Worldwar2Screen(),
    "Chinese Civil War": const ChinesecivilwarScreen(),
  };

  @override
  Widget build(BuildContext context) {
    MainshowSearch mainshowSearch = MainshowSearch(
        mainList: mainList,
        mainScreens: mainScreens,
        filteredcurrentveiw: filteredcurrentveiw ?? []);
    return Customveiwcategory(
        name: "Wars",
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
