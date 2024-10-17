import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class AdolfhitlerScreen extends StatefulWidget {
  const AdolfhitlerScreen({super.key});

  @override
  State<AdolfhitlerScreen> createState() => _AdolfhitlerScreenState();
}

class _AdolfhitlerScreenState extends State<AdolfhitlerScreen> {
  List<String> images = [
    Assets.imagesAdolfHitler,
    Assets.imagesAdolfHitler,
    Assets.imagesAdolfHitler
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Adolf Hitler",
      ),
      body: ListView(
        children: [
          Customviewpage(
              name: "Adolf Hitler",
              history: "1889 AD - 1945 AD",
              images: images),
              const Customfirebasedata(
              collectionName: "figures",docsname: "adolfhitler"),
        ],
      ),
    );
  }
}
