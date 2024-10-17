import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class MohamedaliScreen extends StatefulWidget {
  const MohamedaliScreen({super.key});

  @override
  State<MohamedaliScreen> createState() => _MohamedaliScreenState();
}

class _MohamedaliScreenState extends State<MohamedaliScreen> {
  List<String> images = [
    Assets.imagesMohamedAli,
    Assets.imagesMohamedAli,
    Assets.imagesMohamedAli
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Mohamed Ali",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Mohamed Ali" , history: "1769 AD - 1849 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "mohamedali"),
        ],
      ),
    ); 
  }
}