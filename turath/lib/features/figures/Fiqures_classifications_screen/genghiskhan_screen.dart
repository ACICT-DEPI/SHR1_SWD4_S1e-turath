import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class GenghiskhanScreen extends StatefulWidget {
  const GenghiskhanScreen({super.key});

  @override
  State<GenghiskhanScreen> createState() => _GenghiskhanScreenState();
}

class _GenghiskhanScreenState extends State<GenghiskhanScreen> {
  List<String> images = [
    Assets.imagesGenghisKhan,
    Assets.imagesGenghisKhan,
    Assets.imagesGenghisKhan
  ];
  
  @override
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Genghis Khan",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Genghis Khan", history: "1162 AD - 1227 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "genghiskhan"),
        ],
      ),
    );
  }
}

