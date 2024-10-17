import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';
import 'package:turath/features/components/customfirebasedata.dart';
import 'package:turath/features/components/customviewpage.dart';

class SalaheldinScreen extends StatefulWidget {
  const SalaheldinScreen({super.key});

  @override
  State<SalaheldinScreen> createState() => _SalaheldinScreenState();
}

class _SalaheldinScreenState extends State<SalaheldinScreen> {
  List<String> images = [
    Assets.imagesSalaheldin,
    Assets.imagesSalaheldin,
    Assets.imagesSalaheldin
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      appBar: const Customappbar(
        name: "Salah al-Din",
      ),
      body: ListView(
        children: [
          Customviewpage(name: "Salah al-Din" , history: "1137 AD - 1193 AD", images: images),
          const Customfirebasedata(
              collectionName: "figures",docsname: "salaheldin"),
        ],
      ),
    ); 
  }
}