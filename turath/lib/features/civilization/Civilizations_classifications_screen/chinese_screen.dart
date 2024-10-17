import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customcard.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/qinshihuang_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/chinesecivilwar_screen.dart';

class ChineseScreen extends StatefulWidget {
  ChineseScreen({super.key});

  @override
  State<ChineseScreen> createState() => _ChineseScreenState();
}

class _ChineseScreenState extends State<ChineseScreen> {
  List<String> images = [
    Assets.imagesChinesescreen,
    Assets.imagesChina2,
    Assets.imagesChina3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Chinese",
      ),
      body: ListView(
        children: [
          Customviewpage(
              name: "Chinese", history: "2070 BC - 221 BC", images: images),
          const Customfirebasedata(collectionName: "civilizations",docsname: "chinese"),
           Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Wars",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
          Customcard(
            leading: Image.asset(
              Assets.imagesChineseCivilWar,
            ),
            name: "Chinese Civil War",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const ChinesecivilwarScreen()));
            },
          ),
           Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Figures",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
          Customcard(
            leading: Image.asset(
              Assets.imagesQinShiHuang,
            ),
            name: "Qin Shi Huang",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const QinshihuangScreen()));
            },
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
