import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class QinshihuangScreen extends StatefulWidget {
  const QinshihuangScreen({super.key});

  @override
  State<QinshihuangScreen> createState() => _QinshihuangScreenState();
}

class _QinshihuangScreenState extends State<QinshihuangScreen> {
  List<String> images = [
    Assets.imagesQinShiHuang,
    Assets.imagesQinShiHuang,
    Assets.imagesQinShiHuang
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Qin Shi Huang",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Qin Shi Huang" , history: "259 BC - 210 BC", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "qinshihuang"),
         
 
        ],
      ),
    ); 
}}