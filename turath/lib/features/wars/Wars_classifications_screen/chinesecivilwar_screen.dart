import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class ChinesecivilwarScreen extends StatefulWidget {
  const ChinesecivilwarScreen({super.key});

  @override
  State<ChinesecivilwarScreen> createState() => _ChinesecivilwarScreenState();
}

class _ChinesecivilwarScreenState extends State<ChinesecivilwarScreen> {
  List<String> images = [
    Assets.imagesChineseCivilWar,
    Assets.imagesChineseCivilWar,
    Assets.imagesChineseCivilWar
  ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Chinese Civil War",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Chinese Civil War" , history: "1927 - 1949 AD", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "chinesecivil"),
        ],
      ),
    ); 
  }
}