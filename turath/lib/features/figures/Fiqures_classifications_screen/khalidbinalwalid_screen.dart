import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class KhalidbinalwalidScreen extends StatefulWidget {
  const KhalidbinalwalidScreen({super.key});

  @override
  State<KhalidbinalwalidScreen> createState() => _KhalidbinalwalidScreenState();
}

class _KhalidbinalwalidScreenState extends State<KhalidbinalwalidScreen> {
  List<String> images = [
    Assets.imagesKhaledibnElwaled,
    Assets.imagesKhaledibnElwaled,
    Assets.imagesKhaledibnElwaled
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Khalid ibn al-Walid",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Khalid ibn al-Walid", history: "592 AD - 642 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "khaledbnwaled"),
        ],
      ),
    ); 
  }
}