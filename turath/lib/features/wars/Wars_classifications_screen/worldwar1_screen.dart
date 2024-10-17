import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class Worldwar1Screen extends StatefulWidget {
  const Worldwar1Screen({super.key});

  @override
  State<Worldwar1Screen> createState() => _Worldwar1ScreenState();
}

class _Worldwar1ScreenState extends State<Worldwar1Screen> {
  List<String> images = [
    Assets.imagesWorldWarI,
    Assets.imagesWorldWarI,
    Assets.imagesWorldWarI
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "World War I",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "World War I" , history: "1914 - 1918 AD", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "worldwar1"),
        ],
      ),
    ); 
  }
}