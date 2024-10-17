import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';
import 'package:turath/features/components/customtextfield.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // final _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  TextEditingController username = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  bool showSpinner = false;
  bool _obscurePass = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Center(
              child: SingleChildScrollView(
                child: Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // logo turath
                      Center(
                        child: Container(
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.transparent,
                            border: Border.all(
                              color: AppColors.primaryColor,
                              width: 1,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Image.asset(
                                  Assets.imagesSplashicon,
                                  color: AppColors.primaryColor,
                                  width: 80,
                                  height: 70,
                                ),
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text('تُراث',
                                    style: AppTextStyle.arabicTextW800S24
                                        .copyWith(
                                            color: AppColors.textColorPrimary)),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 80.0),

                      Customtextfield(
                        keyboardType: TextInputType.name,
                        labelText: "Full Name",
                        prefixicon: Icons.person_outline,
                        mycontroller: username,
                        validator: (val) {
                          if (val == "") {
                            return "Field is empty";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20.0),

                      Customtextfield(
                        keyboardType: TextInputType.number,
                        labelText: 'Phone Number',
                        prefixicon: Icons.phone_outlined,
                        mycontroller: phone,
                        validator: (val) {
                          if (val == "") {
                            return "Field is empty";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 20.0),

                      Customtextfield(
                        keyboardType: TextInputType.emailAddress,
                        labelText: 'E-mail',
                        prefixicon: Icons.email_outlined,
                        // onChanged: (value) {
                        //   email = value;
                        // },
                        mycontroller: email,
                        validator: (val) {
                          if (val == "") {
                            return "Field is empty";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20.0),

                      Customtextfield(
                        keyboardType: TextInputType.visiblePassword,
                        labelText: 'Password',
                        prefixicon: Icons.lock_outline_rounded,
                        visibilitySuffixicon: Icons.visibility,
                        visibilityOffSuffixicon: Icons.visibility_off,
                        obscureText: _obscurePass,
                        onPressed: () {
                          setState(() {
                            _obscurePass = !_obscurePass;
                          });
                        },
                        mycontroller: password,
                        validator: (val) {
                          if (val == "") {
                            return "Field is empty";
                          }
                          return null;
                        },
                      ),

                      const SizedBox(height: 50.0),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: MaterialButton(
                          onPressed: () async {
                            if (formState.currentState!.validate()) {
                              // كل اما اعمل لوجن هيظهرلى ايرور عشان دا بيعبر اليوزر اللى فالسيشن الحالية  FirebaseAuth.instance.currentUser!.emailVerified لو استخدمت
                              try {
                                final credential = await FirebaseAuth.instance
                                    .createUserWithEmailAndPassword(
                                  email: email.text,
                                  password: password.text,
                                );
                                // Add username and phone to Firestore//////////////////////////
                                _firestore
                                    .collection('users')
                                    .doc(credential.user!.uid)
                                    .set({
                                  'username': username.text,
                                  'phone': phone.text,
                                  'email': email.text,
                                });
                                FirebaseAuth.instance.currentUser!
                                    .sendEmailVerification();
                                Navigator.of(context)
                                    .pushReplacementNamed("login");
                              } on FirebaseAuthException catch (e) {
                                if (e.code == 'weak-password') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    title: 'Weak Password',
                                    desc:
                                        'Please provide a stronger password. Your password should be at least 6 characters long, and include a mix of letters, numbers, and special characters.',
                                  ).show();
                                } else if (e.code == 'email-already-in-use') {
                                  AwesomeDialog(
                                    context: context,
                                    dialogType: DialogType.error,
                                    title: 'Email Already in Use',
                                    desc:
                                        'An account already exists with the provided email address. Please use a different email or log in to your existing account.',
                                  ).show();
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                          child: Text(
                            'Sign Up',
                            style: AppTextStyle.headLineW600S32.copyWith(
                              color: AppColors.textColorPrimary,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 70.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Already have account?",
                              style: AppTextStyle.bodyTextW500S24
                                  .copyWith(color: AppColors.textColorPrimary)),
                          TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed("login");
                            },
                            child: Text('Sign In',
                                style: AppTextStyle.bodyText.copyWith(
                                    fontSize: 20,
                                    color: AppColors.textColorSecondary)),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
