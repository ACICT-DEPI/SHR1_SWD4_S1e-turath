import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class AinjalutScreen extends StatefulWidget {
  const AinjalutScreen({super.key});

  @override
  State<AinjalutScreen> createState() => _AinjalutScreenState();
}

class _AinjalutScreenState extends State<AinjalutScreen> {
  List<String> images = [
    Assets.imagesBattleofAinJalut,
    Assets.imagesBattleofAinJalut,
    Assets.imagesBattleofAinJalut
  ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Ain Jalut",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Ain Jalut" , history: "1260 AD", images: images),
          const Customfirebasedata(
              collectionName: "wars",docsname: "ainjalut"),
        ],
      ),
    ); 
  }
}