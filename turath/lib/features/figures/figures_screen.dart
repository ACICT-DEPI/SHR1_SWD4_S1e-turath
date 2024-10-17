import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customsearchdelegate.dart';
import 'package:turath/features/components/customveiwcategory.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/adolfhitler_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/genghiskhan_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/juliuscaesar_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/khalidbinalwalid_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/mohamedali_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/napoleon_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/qinshihuang_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/qutuz_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/ramses_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/salaheldin_screen.dart';

class FiguresScreen extends StatefulWidget {
  const FiguresScreen({super.key});

  @override
  State<FiguresScreen> createState() => _FiguresScreenState();
}

class _FiguresScreenState extends State<FiguresScreen> {
  List<CurrentveiwsApp> mainList = [
    CurrentveiwsApp(Assets.imagesRamses, "Ramses II", "(1303 BC - 1213 BC)"),
    CurrentveiwsApp(
        Assets.imagesMohamedAli, "Mohamed Ali", "(1769 AD - 1849 AD)"),
    CurrentveiwsApp(Assets.imagesKhaledibnElwaled, "Khalid ibn al-Walid",
        "(592 AD - 642 AD)"),
    CurrentveiwsApp(
        Assets.imagesSalaheldin, "Salah al-Din", "(1137 AD - 1193 AD)"),
    CurrentveiwsApp(
        Assets.imagesQutz, "Sayf al-Din Qutuz", "(1200 AD - 1260 AD)"),
    CurrentveiwsApp(Assets.imagesNapoleon, "Napoleon", "(1769 AD - 1821 AD)"),
    CurrentveiwsApp(Assets.imagesJulius, "Julius Caesar", "(100 BC - 44 BC)"),
    CurrentveiwsApp(
        Assets.imagesAdolfHitler, "Adolf Hitler", "(1889 AD - 1945 AD)"),
    CurrentveiwsApp(
        Assets.imagesGenghisKhan, "Genghis Khan", "(1162 AD - 1227 AD)"),
    CurrentveiwsApp(
        Assets.imagesQinShiHuang, "Qin Shi Huang", "(259 BC - 210 BC)"),
  ];

  List<dynamic>? filteredcurrentveiw;

  final Map<String, Widget> mainScreens = {
    "Ramses II": const RamsesScreen(),
    "Mohamed Ali": const MohamedaliScreen(),
    "Khalid ibn al-Walid": const KhalidbinalwalidScreen(),
    "Salah al-Din": const SalaheldinScreen(),
    "Sayf al-Din Qutuz": const QutuzScreen(),
    "Napoleon": const NapoleonScreen(),
    "Julius Caesar": const JuliuscaesarScreen(),
    "Adolf Hitler": const AdolfhitlerScreen(),
    "Genghis Khan": const GenghiskhanScreen(),
    "Qin Shi Huang": const QinshihuangScreen(),
  };

  @override
  Widget build(BuildContext context) {
    MainshowSearch mainshowSearch = MainshowSearch(
        mainList: mainList,
        mainScreens: mainScreens,
        filteredcurrentveiw: filteredcurrentveiw ?? []);
    return Customveiwcategory(
        name: "Figures",
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
