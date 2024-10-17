import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class HundredyearswarScreen extends StatefulWidget {
  const HundredyearswarScreen({super.key});

  @override
  State<HundredyearswarScreen> createState() => _HundredyearswarScreenState();
}

class _HundredyearswarScreenState extends State<HundredyearswarScreen> {
  List<String> images = [
    Assets.imagesHundredYearWar,
    Assets.imagesHundredYearWar,
    Assets.imagesHundredYearWar
  ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Hundred Years War",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Hundred Years War" , history: "1337 - 1453 AD", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "hundredyear"),
        ],
      ),
    ); 
  }
}