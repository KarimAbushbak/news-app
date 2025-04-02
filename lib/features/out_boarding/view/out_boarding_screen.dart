import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news/core/resources/manager_colors.dart';
import 'package:news/core/resources/manager_font_sizes.dart';
import 'package:news/core/resources/manager_font_weight.dart';
import 'package:news/core/resources/manager_height.dart';
import 'package:news/core/resources/manager_strings.dart';
import 'package:news/core/resources/manager_width.dart';
import 'package:news/core/widgets/base_button.dart';
import 'package:news/features/out_boarding/controller/out-boarding_controller.dart';
import 'package:news/features/out_boarding/view/widget/progress_indicator.dart';
import '../../../core/resources/manager_assets.dart';


class OutBoardingScreen extends StatelessWidget {
  OutBoardingScreen({super.key});

  // late PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OutBoardingController>(
      builder: (controller) {
        return Scaffold(
          body: Column(
            children: [
              Expanded(
                child: PageView(
                  scrollDirection: Axis.horizontal,
                  controller: controller.pageController,
                  onPageChanged: (int value) {
                    controller.currentPageIndex = value;
                    controller.update();
                  },
                  children: [
                    Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ManagerAssets.outBoarding1,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h24,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.outBoardingtext,
                            style: TextStyle(
                              fontSize: ManagerFontSizes.s28,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h12,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.subTextOutBoarding,
                            style: TextStyle(
                                fontWeight: ManagerFontWeight.w400,
                                fontSize: ManagerFontSizes.s16,
                                color: ManagerColors.subTitleOutBoardingColor),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h50,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ManagerAssets.outBoarding2,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h24,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.outBoardingtext,
                            style: TextStyle(
                              fontSize: ManagerFontSizes.s28,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h12,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.subTextOutBoarding,
                            style: TextStyle(
                                fontWeight: ManagerFontWeight.w400,
                                fontSize: ManagerFontSizes.s16,
                                color: ManagerColors.subTitleOutBoardingColor),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h50,
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Expanded(
                          child: Image.asset(
                            ManagerAssets.outBoarding3,
                            fit: BoxFit.cover,
                            width: double.infinity,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h24,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.outBoardingtext,
                            style: TextStyle(
                              fontSize: ManagerFontSizes.s28,
                              fontWeight: ManagerFontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h12,
                        ),
                        Container(
                          margin:
                              EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                          child: Text(
                            ManagerStrings.subTextOutBoarding,
                            style: TextStyle(
                                fontWeight: ManagerFontWeight.w400,
                                fontSize: ManagerFontSizes.s16,
                                color: ManagerColors.subTitleOutBoardingColor),
                          ),
                        ),
                        SizedBox(
                          height: ManagerHeight.h50,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: ManagerWidth.w24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        progressIndicator(
                          color: controller.isFirstPage()
                              ? ManagerColors.progressIndicatorColor
                              : ManagerColors.gray,
                        ),
                        progressIndicator(
                          color: controller.isSecondPage()
                              ? ManagerColors.progressIndicatorColor
                              : ManagerColors.gray,
                        ),
                        progressIndicator(
                          color: controller.isThirdPage()
                              ? ManagerColors.progressIndicatorColor
                              : ManagerColors.gray,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            controller.pageController.previousPage(
                                duration: Duration(
                                  milliseconds: 300,
                                ),
                                curve: Curves.fastLinearToSlowEaseIn);
                          },
                          child: controller.isFirstPage()
                              ? Text('')
                              : Text(
                                  ManagerStrings.back,
                                  style: TextStyle(
                                      fontWeight: ManagerFontWeight.w600,
                                      fontSize: ManagerFontSizes.s16,
                                      color: ManagerColors.gray),
                                ),
                        ),
                        SizedBox(
                          width: ManagerWidth.w12,
                        ),
                        BaseButton(
                            width: ManagerWidth.w85,
                            title: controller.isLastPage()
                                ? ManagerStrings.start
                                : ManagerStrings.next,
                            onPressed: () {
                              controller.pageController.nextPage(
                                  duration: Duration(
                                    milliseconds: 300,
                                  ),
                                  curve: Curves.fastLinearToSlowEaseIn);
                            }),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 50,
              ),
            ],
          ),
        );
      }
    );
  }
}
