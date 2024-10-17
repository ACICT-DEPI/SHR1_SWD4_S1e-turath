import 'package:fan_carousel_image_slider/fan_carousel_image_slider.dart';
import 'package:flutter/material.dart';
import 'package:turath/core/utils/app_colors.dart';
import 'package:turath/core/utils/app_text_style.dart';

class Customviewpage extends StatelessWidget {
  final String name;
  final String history;
  final List<String> images;

  const Customviewpage(
      {super.key,
      required this.name,
      required this.history,
      required this.images});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 360,
              width: MediaQuery.of(context).size.width,
              child: FanCarouselImageSlider.sliderType1(
                imagesLink: images,
                isAssets: true,
                autoPlay: true,
                sliderHeight: 300,

                // showIndicator: true,
              ),
            ),
            Container(
              color: AppColors.primaryColor,
              height: 2,
              width: 250,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 20, bottom: 5),
                      child: Container(
                        width: 350,
                        child: Text(name,
                            style: AppTextStyle.headLineW800S48
                                .copyWith(color: AppColors.textColorPrimary),
                            overflow: TextOverflow.ellipsis),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        history,
                        style: const TextStyle(
                          color: Color(0xFFF9DBB3),
                          fontWeight: FontWeight.w900,
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
