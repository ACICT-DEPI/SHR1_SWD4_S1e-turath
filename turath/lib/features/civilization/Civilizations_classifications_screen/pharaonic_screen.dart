import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customcard.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/ramses_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/pharaonicliberationwars_screen.dart';

// ignore: must_be_immutable
class PharaonicScreen extends StatefulWidget {
  PharaonicScreen({super.key});
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  State<PharaonicScreen> createState() => _PharaonicScreenState();
}

class _PharaonicScreenState extends State<PharaonicScreen> {
  List<String> images = [
    Assets.imagesPharaonicscreen,
    Assets.imagesPharaonic2,
    Assets.imagesPharaonic3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Pharaonic",
      ),
      body: ListView(
        children: [
          Customviewpage(
            name: "Pharaonic",
            history: "3150 BC - 30 BC",
            images: images,
          ),
          const Customfirebasedata(
            collectionName: "civilizations",
            docsname: "pharaonic",
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Wars",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
          Customcard(
            leading: Image.asset(Assets.imagesPharaonicLiberation),
            name: "Pharaonic liberation",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PharaonicliberationwarsScreen()));
            },
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Figures",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
          Customcard(
            leading: Image.asset(Assets.imagesRamses),
            name: "Ramses II",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const RamsesScreen()));
            },
          ),
          const SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}
