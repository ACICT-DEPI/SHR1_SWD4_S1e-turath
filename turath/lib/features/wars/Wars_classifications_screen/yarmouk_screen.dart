import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class YarmoukScreen extends StatefulWidget {
  const YarmoukScreen({super.key});

  @override
  State<YarmoukScreen> createState() => _YarmoukScreenState();
}

class _YarmoukScreenState extends State<YarmoukScreen> {
  List<String> images = [
    Assets.imagesBattleofYarmouk,
    Assets.imagesBattleofYarmouk,
    Assets.imagesBattleofYarmouk
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Yarmouk",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Yarmouk" , history: "636 AD", images: images),
          const Customfirebasedata(
              collectionName: "wars",docsname: "yarmouk"),
        ],
      ),
    );
  }
}