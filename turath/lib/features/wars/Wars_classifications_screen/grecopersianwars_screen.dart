import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class GrecopersianwarsScreen extends StatefulWidget {
  const GrecopersianwarsScreen({super.key});

  @override
  State<GrecopersianwarsScreen> createState() => _GrecopersianwarsScreenState();
}

class _GrecopersianwarsScreenState extends State<GrecopersianwarsScreen> {
  List<String> images = [
    Assets.imagesGrecoPersianWars,
    Assets.imagesGrecoPersianWars,
    Assets.imagesGrecoPersianWars
  ];
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Greco-Persian Wars",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Greco-Persian Wars" , history: "499 - 449 BC", images: images),
           const Customfirebasedata(
              collectionName: "wars",docsname: "greco-persian"),
        ],
      ),
    ); 
  }
}