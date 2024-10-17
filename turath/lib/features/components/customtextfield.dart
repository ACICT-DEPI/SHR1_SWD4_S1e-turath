import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';

// ignore: must_be_immutable
class Customtextfield extends StatelessWidget {
  TextInputType? keyboardType;
  String? labelText;
  IconData? prefixicon;
  IconData? visibilitySuffixicon;
  IconData? visibilityOffSuffixicon;
  void Function()? onPressed;
  void Function(String)? onChanged;
  bool obscureText;
  bool obscureConfirmPass;
  final TextEditingController mycontroller ; 
  final String? Function(String?)? validator;



  Customtextfield(
      {super.key,
      required this.keyboardType,
      required this.labelText,
      required this.prefixicon,
      this.visibilitySuffixicon,
      this.visibilityOffSuffixicon,
      this.onPressed,
      this.obscureText = false,
      this.obscureConfirmPass = true,
      this.onChanged,
      required this.mycontroller,
      required this.validator});

  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator ,
      controller: mycontroller ,

      style:
          AppTextStyle.headLine.copyWith(color: AppColors.textColorSecondary),
      cursorColor: AppColors.primaryColor,
      keyboardType: keyboardType,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle:
            AppTextStyle.bodyText.copyWith(color: AppColors.textColorHint),
        prefixIcon: Icon(prefixicon, color: AppColors.secondaryColor),
        suffixIcon: IconButton(
            icon: Icon(
                !obscureText ? visibilitySuffixicon : visibilityOffSuffixicon,
                color: AppColors.secondaryColor),
            onPressed: onPressed),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.borderColor),
          borderRadius: BorderRadius.circular(24),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryColor),
          borderRadius: BorderRadius.circular(24),
        ),
      ),
    );
  }
}






// // ignore: must_be_immutable
// class Customtextfield extends StatelessWidget {
//   TextInputType? keyboardType;
//   String? labelText;
//   IconData? prefixicon;
//   IconData? visibilitySuffixicon;
//   IconData? visibilityOffSuffixicon;
//   void Function()? onPressed;
//   void Function(String)? onChanged;
//   bool obscureText;
//   bool obscureConfirmPass;

//   Customtextfield(
//       {super.key,
//       required this.keyboardType,
//       required this.labelText,
//       required this.prefixicon,
//       this.visibilitySuffixicon,
//       this.visibilityOffSuffixicon,
//       this.onPressed,
//       this.obscureText = false,
//       this.obscureConfirmPass = true,
//       this.onChanged});

//   Widget build(BuildContext context) {
//     return TextFormField(
//       style:
//           AppTextStyle.headLine.copyWith(color: AppColors.textColorSecondary),
//       cursorColor: AppColors.primaryColor,
//       keyboardType: keyboardType,
//       obscureText: obscureText,
//       onChanged: onChanged,
//       decoration: InputDecoration(
//         labelText: labelText,
//         labelStyle:
//             AppTextStyle.bodyText.copyWith(color: AppColors.textColorHint),
//         prefixIcon: Icon(prefixicon, color: AppColors.secondaryColor),
//         suffixIcon: IconButton(
//             icon: Icon(
//                 !obscureText ? visibilitySuffixicon : visibilityOffSuffixicon,
//                 color: AppColors.secondaryColor),
//             onPressed: onPressed),
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.borderColor),
//           borderRadius: BorderRadius.circular(24),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(color: AppColors.primaryColor),
//           borderRadius: BorderRadius.circular(24),
//         ),
//       ),
//     );
//   }
// }


