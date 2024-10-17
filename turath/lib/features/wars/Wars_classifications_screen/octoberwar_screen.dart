import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class OctoberwarScreen extends StatefulWidget {
  const OctoberwarScreen({super.key});

  @override
  State<OctoberwarScreen> createState() => _OctoberwarScreenState();
}

class _OctoberwarScreenState extends State<OctoberwarScreen> {
  List<String> images = [
    Assets.images6OctoberWar,
    Assets.images6OctoberWar,
    Assets.images6OctoberWar
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "October 6 War",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "October 6 War" , history: "1973 AD", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "6_october"),
        ],
      ),
    ); 
  }
}