import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/features/components/customappbar.dart';

class Customveiwcategory extends StatelessWidget {
  final String name;
  final List mainList;
  final Map<String, Widget> mainScreens;
  final SearchDelegate<String> delegateSearch;

  const Customveiwcategory(
      {super.key,
      required this.name,
      required this.mainList,
      required this.mainScreens,
      required this.delegateSearch});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Customappbar(
        name: name,
      ),
      backgroundColor: AppColors.bgColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 35),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              padding: const EdgeInsets.all(5),
              height: 50,
              width: MediaQuery.of(context).size.width / 1.13,
              decoration: BoxDecoration(
                color: AppColors.textColorPrimary,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TextFormField(
                onTap: () {
                  showSearch(context: context, delegate: delegateSearch);
                },
                cursorColor: AppColors.primaryColor,
                decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.mic_none,
                    color: AppColors.primaryColor,
                    size: 30,
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: AppColors.primaryColor.withOpacity(0.8),
                  ),
                  border: InputBorder.none,
                  labelText: "Search",
                  labelStyle: TextStyle(
                    fontSize: 16,
                    color: AppColors.primaryColor.withOpacity(0.8),
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: mainList.length,
                itemBuilder: (context, index) {
                  final currentveiw = mainList[index];
                  return InkWell(
                    onTap: () {
                      final screen = mainScreens[currentveiw.name];
                      if (screen != null) {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => screen),
                        );
                      }
                    },
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      height: 280,
                      decoration: BoxDecoration(
                        color: AppColors.bgColor,
                        borderRadius: BorderRadius.circular(50),
                        image: DecorationImage(
                          image: AssetImage(currentveiw.imagePath),
                          fit: BoxFit.cover,
                          opacity: 0.7,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            currentveiw.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: AppColors.textColorPrimary,
                              fontSize: 40,
                              fontWeight: FontWeight.w900,
                            ),
                          ),
                          Text(
                            currentveiw.history,
                            style: TextStyle(
                              color: AppColors.textColorPrimary,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
