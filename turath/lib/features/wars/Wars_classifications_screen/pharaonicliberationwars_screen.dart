import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class PharaonicliberationwarsScreen extends StatefulWidget {
  const PharaonicliberationwarsScreen({super.key});

  @override
  State<PharaonicliberationwarsScreen> createState() =>
      _PharaonicliberationwarsScreenState();
}

class _PharaonicliberationwarsScreenState
    extends State<PharaonicliberationwarsScreen> {
  List<String> images = [
    Assets.imagesPharaonicLiberation,
    Assets.imagesPharaonicLiberation,
    Assets.imagesPharaonicLiberation
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Pharaonic liberation",
      ),
      body: ListView(
        children: [
          Customviewpage(
        name: "Pharaonic liberation", history: "1550 BC", images: images),
         const Customfirebasedata(
              collectionName: "wars",docsname: "pharaonic liberation"),
        ],
      ),
    ); 
  }
}
