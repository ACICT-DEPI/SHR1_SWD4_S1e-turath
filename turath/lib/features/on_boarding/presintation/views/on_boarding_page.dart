import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';

class OnBoardingPage extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final int pageIndex;
  final VoidCallback onLogInPressed;
  final VoidCallback onSignUpPressed;

  const OnBoardingPage({
    required this.image,
    required this.title,
    required this.description,
    required this.pageIndex,
    required this.onLogInPressed,
    required this.onSignUpPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
              opacity: 0.7,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 250),
              Text(
                title,
                style: AppTextStyle.headLineW800S48.copyWith(
                  color: AppColors.textColorPrimary,
                ),
              ),
              Text(
                description,
                style: AppTextStyle.bodyTextW600S24.copyWith(
                  color: AppColors.textColorPrimary,
                ),
              ),
              if (pageIndex == 2) ...[
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    side: BorderSide(color: AppColors.primaryColor, width: 2),
                    minimumSize: const Size(350, 50),
                    backgroundColor: Colors.transparent,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: onLogInPressed,
                  child: Text(
                    "Let's Start",
                    style: AppTextStyle.headLineW500S24
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(350, 50),
                    backgroundColor: AppColors.primaryColor,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 15),
                    textStyle: const TextStyle(fontSize: 18),
                  ),
                  onPressed: onSignUpPressed,
                  child: Text(
                    "Create Account",
                    style: AppTextStyle.headLineW500S24
                        .copyWith(color: AppColors.secondaryColor),
                  ),
                ),
              ]
            ],
          ),
        ),
      ],
    );
  }
}
