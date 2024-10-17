import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/aboutus/aboutus_screen.dart';
import 'package:turath/features/login/login_screen.dart';
import 'package:turath/features/profile/customtextbuttonprofile.dart';
import 'package:turath/features/profile/settings_screen.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // for image
  File? imageFile;

  _showOption(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Make a choice"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                leading: const Icon(Icons.browse_gallery),
                title: const Text("Gallery"),
                onTap: () => _imageFromGallery(context),
              ),
              ListTile(
                leading: const Icon(Icons.camera),
                title: const Text("Camera"),
                onTap: () => _imageFromCamera(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _imageFromGallery(BuildContext context) async {
    final picker = ImagePicker(); // إنشاء كائن من ImagePicker
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery); // استخدم الكائن لاختيار الصورة

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path); // تأكد من تحويل الصورة إلى File
      });
    }
    Navigator.pop(context);
  }

  Future _imageFromCamera(BuildContext context) async {
    final picker = ImagePicker(); // إنشاء كائن من ImagePicker
    final pickedFile = await picker.pickImage(
        source: ImageSource.camera); // استخدم الكائن لاختيار الصورة

    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path); // تأكد من تحويل الصورة إلى File
      });
    }
    Navigator.pop(context);
  }

  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  String? email;
  String? username;
  String? phone;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  Future<void> getUserData() async {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        final userData =
            await _firestore.collection('users').doc(user.uid).get();
        setState(() {
          email = userData['email'];
          username = userData['username'];
          phone = userData['phone'];
        });
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 50, left: 25, right: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    width: 150, // تحديد عرض الـ Container
                    height: 150, // تحديد ارتفاع الـ Container
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                          Radius.circular(200)), // جعل الزوايا مدورة
                      color: Colors.grey, // يمكنك تغيير لون الخلفية إذا رغبت
                    ),
                    child: ClipOval(
                      // استخدام ClipOval لجعل المحتوى دائري
                      child: imageFile != null
                          ? Image.file(
                              imageFile!,
                              fit: BoxFit.cover, // لضمان تغطية الصورة بالكامل
                            )
                          : const Center(child: Image(image: AssetImage(Assets.imagesPersonicon3))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 120),
                    child: IconButton(
                      icon: const Icon(Icons.camera_alt),
                      iconSize: 37,
                      onPressed: () => _showOption(context),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                username != null ? "$username" : "Loading username...",
                style: TextStyle(
                    fontSize: 26,
                    color: AppColors.textColorSecondary,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Text(
                phone != null ? "$phone" : "Loading phone...",
                style: TextStyle(
                    fontSize: 26,
                    color: AppColors.textColorSecondary,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 10),
              Text(
                email != null ? "$email" : "Loading email...",
                style: TextStyle(
                    fontSize: 22,
                    color: AppColors.textColorSecondary,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 50),
              Expanded(
                child: ListView(
                  children: [
                    // زر الإعدادات
                    Customtextbuttonprofile(
                      name: "Settings",
                      icon: const Icon(Icons.settings_outlined),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const SettingsScreen()));
                      },
                    ),

                    const SizedBox(height: 20),

                    // زر حولنا
                    Customtextbuttonprofile(
                      name: "About Us",
                      icon: const Icon(Icons.info_outline),
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AboutusScreen()));
                      },
                    ),

                    const SizedBox(height: 20),

                    // زر البطاقات المحفوظة
                    Customtextbuttonprofile(
                      name: "Saved Cards",
                      icon: const Icon(Icons.credit_card),
                      onPressed: () {},
                    ),

                    const SizedBox(height: 20),

                    // زر السلة
                    // Customtextbuttonprofile(
                    //   name: "Cart",
                    //   icon: const Icon(Icons.shopping_cart),
                    //   onPressed: () {},
                    // ),

                    // const SizedBox(height: 20),

                    // زر تسجيل الخروج
                    Customtextbuttonprofile(
                      name: "Logout",
                      icon: Icon(
                        Icons.logout,
                        color: AppColors.errorColor,
                      ),
                      onPressed: () {
                        _auth.signOut();
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginScreen(),
                          ),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
