import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customcard.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/khalidbinalwalid_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/yarmouk_screen.dart';

class IslamicScreen extends StatefulWidget {
  const IslamicScreen({super.key});

  @override
  State<IslamicScreen> createState() => _IslamicScreenState();
}

class _IslamicScreenState extends State<IslamicScreen> {
  List<String> images = [
    Assets.imagesPexelsPhoto16013193,
    Assets.imagesIslamic3,
    Assets.imagesIslamic2
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Islamic",

      ),
      body: ListView(
        children: [
          Customviewpage(
              name: "Islamic", history: "622 AD - 1924 AD", images: images),
          const Customfirebasedata(collectionName: "civilizations",docsname: "islamic"),
           Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Wars",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
                    Customcard(leading: Image.asset(Assets.imagesBattleofYarmouk,), name: "Yarmouk",
          onTap:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const YarmoukScreen()));
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
            Customcard(leading: Image.asset(Assets.imagesKhaledibnElwaled,), name: "Khalid ibn al-Walid",
          onTap:() {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => const KhalidbinalwalidScreen()));
          },
          ),
          const SizedBox(height: 20,)
        ],
      ),
    );
  }
}
