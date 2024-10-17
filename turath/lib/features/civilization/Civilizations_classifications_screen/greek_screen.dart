import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customcard.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';
import 'package:turath/features/figures/Fiqures_classifications_screen/juliuscaesar_screen.dart';
import 'package:turath/features/wars/Wars_classifications_screen/grecopersianwars_screen.dart';

class GreekScreen extends StatefulWidget {
  const GreekScreen({super.key});

  @override
  State<GreekScreen> createState() => _GreekScreenState();
}

class _GreekScreenState extends State<GreekScreen> {
  List<String> images = [
    Assets.imagesGreekscreen,
    Assets.imagesGreek2,
    Assets.imagesGreek3
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Greek",
      ),
      body: ListView(
        children: [
          Customviewpage(
              name: "Greek", history: "1200 BC - 146 BC", images: images),
          const Customfirebasedata(collectionName: "civilizations",docsname: "greek"),
           Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 5, left: 20),
            child: Text(
              "Suggested Wars",
              style: AppTextStyle.headLineW800S24
                  .copyWith(color: AppColors.textColorPrimary),
            ),
          ),
          Customcard(
            leading: Image.asset(
              Assets.imagesGrecoPersianWars,
            ),
            name: "Greco-Persian Wars",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const GrecopersianwarsScreen()));
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
            leading: Image.asset(
              Assets.imagesJulius,
            ),
            name: "Julius Caesar",
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const JuliuscaesarScreen()));
            },
          ),
          const  SizedBox(height: 20,)
        ],
      ),
    );
  }
}
