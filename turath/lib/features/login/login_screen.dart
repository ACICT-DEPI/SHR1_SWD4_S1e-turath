import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:turath/core/utils/app_assets.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customtextfield.dart';

class LoginScreen extends StatefulWidget {
  static const String screenRoute = 'signin_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  Future signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    if (googleUser == null) {
      return;
    } //فالميثودس اللى بعديها بتبوظ  (google user=null) لما ادوس كنسل

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
    Navigator.of(context).pushReplacementNamed("home");
  }

  bool _obscureText = true;

  // final _auth = FirebaseAuth.instance;
  // late String email;
  // late String password;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColor,
      body: ListView(
        children: [
          ModalProgressHUD(
            inAsyncCall: showSpinner,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 70),
              child: Form(
                key: formState,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
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
                              child: Text(
                                'تُراث',
                                style: TextStyle(
                                  color: AppColors.textColorPrimary,
                                  fontFamily: 'Fustat',
                                  fontWeight: FontWeight.w800,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 80),
                    Customtextfield(
                      keyboardType: TextInputType.emailAddress,
                      labelText: 'E-mail',
                      prefixicon: Icons.email_outlined,
                      mycontroller: email,
                      validator: (val) {
                        if (val == "") {
                          return "Field is empty";
                        }
                        return null;
                      },
                      // onChanged: (value) {
                      //   email = value;
                      // },
                    ),
                    const SizedBox(height: 20),
                    Customtextfield(
                      keyboardType: TextInputType.visiblePassword,
                      labelText: 'Password',
                      prefixicon: Icons.lock_outline_rounded,
                      visibilitySuffixicon: Icons.visibility,
                      visibilityOffSuffixicon: Icons.visibility_off,
                      obscureText: _obscureText,
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                      mycontroller: password,
                      validator: (val) {
                        if (val == "") {
                          return "Field is empty";
                        }
                        return null;
                      },
                      // onChanged: (value) {
                      //   password = value;
                      // },
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: TextButton(
                        onPressed: () async {
                          if (email.text == "") {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              title: 'Error',
                              desc:
                                  'Write your email and press "Forget Password?"',
                            ).show();

                            return;
                          }

                          try {
                            await FirebaseAuth.instance
                                .sendPasswordResetEmail(email: email.text);

                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.success,
                              title: 'Error',
                              desc: 'Check your email to reset your password',
                            ).show();
                          } catch (e) {
                            AwesomeDialog(
                              context: context,
                              dialogType: DialogType.error,
                              title: 'Error',
                              desc: 'Make sure the email is correct',
                            ).show();
                          }
                        },
                        child: Text(
                          'Forget Password?',
                          style: TextStyle(color: AppColors.textColorPrimary),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: MaterialButton(
                        onPressed: () async {
                          if (formState.currentState!.validate()) {
                            try {
                              final credential = await FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: email.text,
                                      password: password.text);
                              if (credential.user!.emailVerified) {
                                Navigator.of(context)
                                    .pushReplacementNamed("home");
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: 'Email Verification Required',
                                  desc:
                                      'Please verify your email. Check your inbox and click the verification link.',
                                ).show();
                              }
                            } on FirebaseAuthException catch (e) {
                              print(
                                  '>>>>>>>>>>>>>>>>>>>>..FirebaseAuthException code: ${e.code}');

                              if (e.code == 'user-not-found') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: 'User Not Found',
                                  desc:
                                      'No account found for this email. Please check the email address or sign up for a new account.',
                                ).show();
                              } else if (e.code == 'wrong-password') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: 'Incorrect Password',
                                  desc:
                                      'The password you entered is incorrect. Please try again.',
                                ).show();
                              }
                              // correct
                              else if (e.code == 'invalid-email') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: 'Invalid Email Address',
                                  desc:
                                      'The email address format is incorrect. Please enter a valid email address.',
                                ).show();
                              } else if (e.code == 'too-many-requests') {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.warning,
                                  title: 'Too Many Attempts',
                                  desc:
                                      'You have made too many requests in a short period. Please try again later.',
                                ).show();
                              } else {
                                AwesomeDialog(
                                  context: context,
                                  dialogType: DialogType.error,
                                  title: 'Authentication Error',
                                  desc:
                                      'An unknown error occurred. Please check your credentials and try again.',
                                ).show();
                              }
                            }
                          } else {
                            print(">>>>>>>>>>>>>>>>>>>>>>Not valid!");
                          }
                        },
                        child: Text(
                          'Sign in',
                          style: TextStyle(
                              color: AppColors.textColorPrimary,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Text(
                        'OR',
                        style: TextStyle(
                            color: AppColors.textColorPrimary,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          color: AppColors.borderColor,
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: MaterialButton(
                        onPressed: () {
                          signInWithGoogle();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              Assets.imagesGoogle,
                              width: 25.0,
                              height: 25.0,
                            ),
                            const SizedBox(width: 10.0),
                            Text(
                              'Sign in with Gmail',
                              style:
                                  TextStyle(color: AppColors.textColorPrimary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 70,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't you have an account?",
                          style: TextStyle(color: AppColors.textColorPrimary),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushReplacementNamed("signup");
                          },
                          child: Text(
                            'Sign Up',
                            style:
                                TextStyle(color: AppColors.textColorSecondary),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
