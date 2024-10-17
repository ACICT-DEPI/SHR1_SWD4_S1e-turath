import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class NapoleonScreen extends StatefulWidget {
  const NapoleonScreen({super.key});

  @override
  State<NapoleonScreen> createState() => _NapoleonScreenState();
}

class _NapoleonScreenState extends State<NapoleonScreen> {
  List<String> images = [
    Assets.imagesNapoleon,
    Assets.imagesNapoleon,
    Assets.imagesNapoleon
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Napoleon",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Napoleon" , history: "1769 AD - 1821 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "napleon"),
        ],
      ),
    ); 
  }
}