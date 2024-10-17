
import 'package:animated_read_more_text/animated_read_more_text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:turath/core/utils/app_text_style.dart';

class Customfirebasedata extends StatelessWidget {
  final String collectionName;
  final String docsname;

  const Customfirebasedata({
    super.key,
    required this.docsname, required this.collectionName,
  });
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection(collectionName).get(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text(snapshot.error.toString()); // any wrong something
            
          }

          if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
            return const Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.docs[0].data() as Map<String, dynamic>;
            return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: AnimatedReadMoreText(
                      '${data[docsname]}',
                      maxLines: 10,
                      // Set a custom text for the expand button. Defaults to Read more
                      readMoreText: 'Expand',
                      // Set a custom text for the collapse button. Defaults to Read less
                      readLessText: 'Collapse',
                      // Set a custom text style for the main block of text
                      textStyle: AppTextStyle.arabicTextW700S18
                    .copyWith(color: AppColors.textColorPrimary),
                
                      // Set a custom text style for the expand/collapse button
                      buttonTextStyle: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textColorSecondary,
                      ),
                      expandOnTextTap: false,
                      animationCurve: Curves.easeInOut,
                      // Set the duration of the animation
                      animationDuration: const Duration(milliseconds: 500),
                    ),
                  ),
                ));
          }
          return Center(
              child: LoadingAnimationWidget.inkDrop(
            // leftDotColor: const Color(0xFF1A1A3F),
            // rightDotColor: const Color(0xFFEA3799),
            size: 100, color: Colors.white,
          ));
        });
  }
}




// import 'package:animated_read_more_text/animated_read_more_text.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:turath/core/utils/app_colors.dart';
// import 'package:loading_animation_widget/loading_animation_widget.dart';

// class Customfirebasedata extends StatelessWidget {
//   final int docsIndex;

//   const Customfirebasedata({
//     super.key,
//     required this.docsIndex,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder<QuerySnapshot>(
//         future: FirebaseFirestore.instance.collection("Pharaonic").get(),
//         builder: (context, snapshot) {
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString()); // any wrong something
            
//           }

//           if (snapshot.hasData && !snapshot.data!.docs[0].exists) {
//             return const Text("Document does not exist");
//           }

//           if (snapshot.connectionState == ConnectionState.done) {
//             Map<String, dynamic> data =
//                 snapshot.data!.docs[0].data() as Map<String, dynamic>;
//             return Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Padding(
//                   padding: const EdgeInsets.all(12),
//                   child: Directionality(
//                     textDirection: TextDirection.rtl,
//                     child: AnimatedReadMoreText(
//                       '${data['name']}',
//                       maxLines: 10,
//                       // Set a custom text for the expand button. Defaults to Read more
//                       readMoreText: 'Expand',
//                       // Set a custom text for the collapse button. Defaults to Read less
//                       readLessText: 'Collapse',
//                       // Set a custom text style for the main block of text
//                       textStyle: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.w900,
//                         color: AppColors.textColorPrimary,
//                         // fontFamily: "Poppins",
//                       ),
//                       // Set a custom text style for the expand/collapse button
//                       buttonTextStyle: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColors.textColorSecondary,
//                       ),
//                       expandOnTextTap: false,
//                       animationCurve: Curves.easeInOut,
//                       // Set the duration of the animation
//                       animationDuration: const Duration(milliseconds: 500),
//                     ),
//                   ),
//                 ));
//           }
//           return Center(
//               child: LoadingAnimationWidget.inkDrop(
//             // leftDotColor: const Color(0xFF1A1A3F),
//             // rightDotColor: const Color(0xFFEA3799),
//             size: 100, color: Colors.white,
//           ));
//         });
//   }
// }
