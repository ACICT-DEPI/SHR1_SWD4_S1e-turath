import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:turath/core/utils/app_colors.dart';

class MainshowSearch extends SearchDelegate<String> {
  final List mainList;
  final Map<String, Widget> mainScreens;
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _speechText = "";

  MainshowSearch({
    required this.mainList,
    required this.mainScreens,
    required List filteredcurrentveiw,
  }) {
    _speech = stt.SpeechToText();
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.bgColor,
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.textColorPrimary,
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        hintStyle: TextStyle(
          color: AppColors.textColorHint,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(
      color: Colors.yellow,
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mainList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(mainList[index].name),
                  onTap: () {
                    final screen = mainScreens[mainList[index].name];
                    if (screen != null) {
                      Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => screen),
                      );
                    }
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  void _listen(BuildContext context) async {
    try {
      PermissionStatus status = await Permission.microphone.request();
      if (status.isGranted) {
        if (!_isListening) {
          String localeId = _determineLocale();

          bool available = await _speech.initialize(
            onStatus: (val) => print('onStatus: $val'),
            onError: (val) => print('onError: ${val.errorMsg}'),
            debugLogging: true,
          );

          if (available) {
            _isListening = true;
            _speech.listen(
              localeId: localeId,
              onResult: (val) {
                query = val.recognizedWords;
                _speechText = val.recognizedWords;
              },
            );
          }
        } else {
          _isListening = false;
          _speech.stop();
        }
      } else {
        _showPermissionDialog(context);
      }
    } catch (e) {
      print("Error initializing speech recognition: $e");
    }
  }

  String _determineLocale() {
    if (RegExp(r'[a-zA-Z]').hasMatch(query)) {
      return "en-US";
    } else {
      return "ar-SA";
    }
  }

  void _showPermissionDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('إذن الميكروفون مطلوب'),
        content: const Text(
            'من فضلك قم بمنح إذن الوصول للميكروفون لاستخدام هذه الميزة.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('موافق'),
          ),
        ],
      ),
    );
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = "";
        },
        icon: Icon(
          Icons.close,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ),
      IconButton(
        onPressed: () => _listen(context),
        icon: Icon(
          _isListening ? Icons.mic : Icons.mic_none,
          size: 30,
          color: AppColors.primaryColor,
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back,
        color: AppColors.primaryColor,
        size: 30,
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }
}



















// import 'package:flutter/material.dart';
// import 'package:turath/core/utils/app_colors.dart';

// // خريطة لربط أسماء الحضارات بالصفحات الخاصة بها

// class MainshowSearch extends SearchDelegate<String> {
//   final List mainList;
//   final Map<String, Widget> mainScreens;
//   List filteredcurrentveiw;

//   MainshowSearch(
//       {required this.mainList,
//       required this.mainScreens,
//       required this.filteredcurrentveiw});

//   @override
//   ThemeData appBarTheme(BuildContext context) {
//     return ThemeData(
//       appBarTheme: AppBarTheme(
//         backgroundColor: AppColors.bgColor, // لون خلفية AppBar
//         // foregroundColor: Colors.white, // لون النصوص والآيقونات
//       ),
//       // تغيير لون النص في صندوق البحث
//       textTheme: TextTheme(
//         titleLarge: TextStyle(
//           color: AppColors.textColorPrimary, // لون النص في صندوق البحث
//         ),
//       ),
//       inputDecorationTheme: InputDecorationTheme(
//         enabledBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: AppColors
//                   .textColorHint), // لون الحدود عندما يكون الحقل غير مفعل
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         focusedBorder: OutlineInputBorder(
//           borderSide: BorderSide(
//               color: AppColors.primaryColor), // لون الحدود عند التركيز
//           borderRadius: BorderRadius.circular(10.0),
//         ),
//         hintStyle: TextStyle(
//           color: AppColors.textColorHint, // لون النص التلميحي
//         ),
//       ),
//     );
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: () {
//           query = "";
//         },
//         icon: Icon(
//           Icons.close,
//           size: 30,
//           color: AppColors.primaryColor,
//         ),
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       onPressed: () {
//         Navigator.of(context).pop();
//       },
//       icon: Icon(
//         Icons.arrow_circle_left_outlined,
//         color: AppColors.primaryColor,
//         size: 40,
//       ),
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     if (query.isEmpty) {
//       return Container(
//         padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//         color: AppColors.bgColor,
//         child: ListView.builder(
//           itemCount: mainList.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 final currentveiw = mainList[index].name;
//                 final screen = mainScreens[currentveiw];
//                 if (screen != null) {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => screen),
//                   );
//                 }
//               },
//               child: Card(
//                 color: AppColors.primaryColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text(
//                     mainList[index].name,
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w900,
//                       color: AppColors.textColorPrimary,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     } else {
//       filteredcurrentveiw = mainList.where((element) {
//         return element.name.toLowerCase().contains(query.toLowerCase());
//       }).toList();

//       return Container(
//         padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
//         color: AppColors.bgColor,
//         child: ListView.builder(
//           itemCount: filteredcurrentveiw.length,
//           itemBuilder: (context, index) {
//             return InkWell(
//               onTap: () {
//                 final civilizationName = filteredcurrentveiw[index].name;
//                 final screen = mainScreens[civilizationName];
//                 if (screen != null) {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => screen),
//                   );
//                 }
//               },
//               child: Card(
//                 color: AppColors.primaryColor,
//                 child: Padding(
//                   padding: const EdgeInsets.all(20),
//                   child: Text(
//                     "${filteredcurrentveiw[index].name}",
//                     style: TextStyle(
//                       fontSize: 25,
//                       fontWeight: FontWeight.w900,
//                       color: AppColors.textColorPrimary,
//                     ),
//                   ),
//                 ),
//               ),
//             );
//           },
//         ),
//       );
//     }
//   }
// }
