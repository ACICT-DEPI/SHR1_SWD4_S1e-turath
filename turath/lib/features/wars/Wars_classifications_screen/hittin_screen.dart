import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class HittinScreen extends StatefulWidget {
  const HittinScreen({super.key});

  @override
  State<HittinScreen> createState() => _HittinScreenState();
}

class _HittinScreenState extends State<HittinScreen> {
  List<String> images = [
    Assets.imagesBattleofHattin,
    Assets.imagesBattleofHattin,
    Assets.imagesBattleofHattin
  ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Hittin",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Hittin" , history: "1187 AD", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "hatin"),
        ],
      ),
    ); 
  }
}