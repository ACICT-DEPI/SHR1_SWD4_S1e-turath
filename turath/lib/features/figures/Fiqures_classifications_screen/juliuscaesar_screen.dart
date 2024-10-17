import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class JuliuscaesarScreen extends StatefulWidget {
  const JuliuscaesarScreen({super.key});

  @override
  State<JuliuscaesarScreen> createState() => _JuliuscaesarScreenState();
}

class _JuliuscaesarScreenState extends State<JuliuscaesarScreen> {
  List<String> images = [
    Assets.imagesJulius,
    Assets.imagesJulius,
    Assets.imagesJulius
  ];
  
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Julius Caesar",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Julius Caesar", history: "100 BC - 44 BC", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "Juliuscaesar"),
        ],
      ),
    );
  }
  }

