import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class Worldwar2Screen extends StatefulWidget {
  const Worldwar2Screen({super.key});

  @override
  State<Worldwar2Screen> createState() => _Worldwar2ScreenState();
}

class _Worldwar2ScreenState extends State<Worldwar2Screen> {
  List<String> images = [
    Assets.imagesWorldwarII,
    Assets.imagesWorldwarII,
    Assets.imagesWorldwarII
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "World War II",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "World War II" , history: "1939 - 1945 AD", images: images),
          const Customfirebasedata(
              collectionName: "wars",docsname: "worldwar2"),
        ],
      ),
    ); 
  }
}