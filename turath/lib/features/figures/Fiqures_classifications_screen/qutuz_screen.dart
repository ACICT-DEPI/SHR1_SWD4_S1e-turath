import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class QutuzScreen extends StatefulWidget {
  const QutuzScreen({super.key});

  @override
  State<QutuzScreen> createState() => _QutuzScreenState();
}

class _QutuzScreenState extends State<QutuzScreen> {
  List<String> images = [
    Assets.imagesQutz,
    Assets.imagesQutz,
    Assets.imagesQutz
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Sayf al-Din Qutuz",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Sayf al-Din Qutuz" , history: "1200 AD - 1260 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "qatz"),
        ],
      ),
    ); 
  }
}