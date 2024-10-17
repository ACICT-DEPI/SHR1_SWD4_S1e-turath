import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class RamsesScreen extends StatefulWidget {
  const RamsesScreen({super.key});

  @override
  State<RamsesScreen> createState() => _RamsesScreenState();
}

class _RamsesScreenState extends State<RamsesScreen> {
  List<String> images = [
    Assets.imagesRamses,
    Assets.imagesRamses,
    Assets.imagesRamses
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Ramses II",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Ramses II" , history: "1303 BC - 1213 BC", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "ramsis"),
        ],
      ),
    ); 
  }
}