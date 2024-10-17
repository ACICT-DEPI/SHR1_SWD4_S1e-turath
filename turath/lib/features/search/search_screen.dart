import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/chinese_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/greek_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/islamic_screen.dart';
import 'package:turath/features/civilization/Civilizations_classifications_screen/pharaonic_screen.dart';
import 'package:turath/features/components/customsearchdelegate.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/salaheldin_screen.dart';
import 'package:turath/features/search/customcategoriescard.dart';
import 'package:turath/features/wars/Wars_classifications_screen/pharaonicliberationwars_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/ainjalut_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/chinesecivilwar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/grecopersianwars_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/hittin_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/hundredyearswar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/octoberwar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/worldwar1_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/worldwar2_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/yarmouk_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/adolfhitler_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/genghiskhan_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/juliuscaesar_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/khalidbinalwalid_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/mohamedali_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/napoleon_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/qinshihuang_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/qutuz_screen.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/ramses_screen.dart';

// import 'nav_bar.dart';

class Searchscreen extends StatefulWidget {
  @override
  State<Searchscreen> createState() => _SearchscreenState();
}

class _SearchscreenState extends State<Searchscreen> {
  List images = [
    'assets/images/sug1.jpg',
    'assets/images/sug2.jpg',
    'assets/images/sug3.jpg',
  ];

  List names = ["Great Wall of China", "Easter Island", "Pyramids of Giza"];

  List<CurrentveiwsApp> mainList = [
    CurrentveiwsApp("Pharaonic"),
    CurrentveiwsApp(
      "Islamic",
    ),
    CurrentveiwsApp(
      "Greek",
    ),
    CurrentveiwsApp(
      "Chinese",
    ),
    CurrentveiwsApp(
      "Pharaonic liberation Wars",
    ),
    CurrentveiwsApp(
      "Yarmouk",
    ),
    CurrentveiwsApp(
      "Hittin",
    ),
    CurrentveiwsApp(
      "Ain Jalut",
    ),
    CurrentveiwsApp(
      "October 6 War",
    ),
    CurrentveiwsApp(
      "Greco-Persian Wars",
    ),
    CurrentveiwsApp(
      "Hundred Years War",
    ),
    CurrentveiwsApp(
      "World War I",
    ),
    CurrentveiwsApp(
      "World War II",
    ),
    CurrentveiwsApp(
      "Chinese Civil War",
    ),
    CurrentveiwsApp(
      "Ramses II",
    ),
    CurrentveiwsApp(
      "Mohamed Ali",
    ),
    CurrentveiwsApp(
      "Khalid ibn al-Walid",
    ),
    CurrentveiwsApp(
      "Salah al-Din",
    ),
    CurrentveiwsApp(
      "Sayf al-Din Qutuz",
    ),
    CurrentveiwsApp("Napoleon"),
    CurrentveiwsApp("Julius Caesar"),
    CurrentveiwsApp(
      "Adolf Hitler",
    ),
    CurrentveiwsApp(
      "Genghis Khan",
    ),
    CurrentveiwsApp(
      "Qin Shi Huang",
    ),
  ];

  List<dynamic>? filteredcurrentveiw;

  final Map<String, Widget> mainScreens = {
    "Pharaonic": PharaonicScreen(),
    "Islamic": const IslamicScreen(),
    "Greek": const GreekScreen(),
    "Chinese": ChineseScreen(),
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

    return Padding(
      padding: const EdgeInsets.all(30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20),
            padding: const EdgeInsets.all(5),
            height: 50,
            width: MediaQuery.of(context).size.width / 1.13,
            decoration: BoxDecoration(
              color: AppColors.textColorPrimary,
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              onTap: () {
                showSearch(context: context, delegate: mainshowSearch);
              },
              cursorColor: AppColors.primaryColor,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  Icons.mic_none,
                  color: AppColors.primaryColor,
                  size: 30,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
                border: InputBorder.none,
                labelText: "Search",
                labelStyle: TextStyle(
                  fontSize: 16,
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Categories',
            style: const TextStyle(
                color: const Color.fromARGB(255, 237, 228, 221),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Customcategoriescard(
                  name: "Bazaar",
                  image: 'assets/images/imicon3-removebg-preview (1).png',
                  onTap: () {
                    Navigator.of(context).pushNamed("bazar");
                  },
                ),

                Customcategoriescard(
                  name: "Figures",
                  image: 'assets/images/imcon1-removebg-preview.png',
                  onTap: () {
                    Navigator.of(context).pushNamed("figures");
                  },
                ),

                Customcategoriescard(
                  name: "Civilizations",
                  image: 'assets/images/persons.png',
                  onTap: () {
                    Navigator.of(context).pushNamed("civilizations");
                  },
                ),

                Customcategoriescard(
                  name: "Wars",
                  image: 'assets/images/shield-removebg-preview.png',
                  onTap: () {
                    Navigator.of(context).pushNamed("wars");
                  },
                ),

                //
              ],
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'Suggested places',
            style: const TextStyle(
                color: Color.fromARGB(255, 237, 228, 221),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: 3,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 30),
                  child: Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage(
                              images[index],
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: Text(
                          names[index],
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color.fromARGB(255, 237, 228, 221),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
    // ////////////////////////////////////////
    // bottomNavigationBar: NavBar(),
  }
}

class CurrentveiwsApp {
  final String name;
  CurrentveiwsApp(
    this.name,
  );
}
