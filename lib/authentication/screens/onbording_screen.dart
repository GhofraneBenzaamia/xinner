
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import  "package:xinner/patient_ui/screens/My_button.dart";
import 'package:xinner/authentication/screens/login_screen.dart';
import 'package:xinner/utils/constants/colors.dart';
import 'package:xinner/utils/constants/sizes.dart';
import 'package:xinner/utils/constants/text_strings.dart';
import 'package:xinner/utils/device/device_utils.dart';
import 'package:xinner/utils/helper_functions.dart';

class OnbordingScreen extends StatefulWidget {
  @override
  State<OnbordingScreen> createState() => OnbordingScreenState();
}

class OnbordingScreenState extends State<OnbordingScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int curentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
               curentPage = _pageController.page!.toInt();
            });
          },
          children: [
            OnBoardingPage(
                title: TTexts.onBoardingTitle1,
                subTitle: TTexts.onBoardingSubTitle1,
                image: 'assests/images/Doctors-pana.png',),
            OnBoardingPage(
                title: TTexts.onBoardingTitle2,
                subTitle: TTexts.onBoardingSubTitle2,
                image: 'assests/images/CT scan-amico.png',),
            OnBoardingPage(
                title: TTexts.onBoardingTitle3,
                subTitle: TTexts.onBoardingSubTitle3,
                image: 'assests/images/Radiography-amico(1).png'),
          ],
        ),
        const OnBoardingSkip(),
        OnBoardingNavigation(
          pageController: _pageController,
        ),
        onBoardingPageAroowRight(
          pageController: _pageController,
        )
      ],
    ));
  }
}

class onBoardingPageAroowRight extends StatefulWidget {
  final pageController;

  onBoardingPageAroowRight({
    required this.pageController,
  });

  @override
  State<onBoardingPageAroowRight> createState() =>
      _onBoardingPageAroowRightState();
}

class _onBoardingPageAroowRightState extends State<onBoardingPageAroowRight> {
  int curentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: TSizes.defaultSpace,
        bottom: TDeviceUtils.getBottomNavigationBarHeight()-10,
        child: ElevatedButton(
          onPressed: () {
            if (curentPage == 2) {
              Get.off(LoginScreen());
            } else {
              setState(() {
                curentPage++;
              });

              widget.pageController.nextPage(
                duration: const Duration(milliseconds: 500),
                curve: Curves.decelerate
              );
            }
          },
          child:  const Icon(Iconsax.arrow_right_3,color:Colors.white),
          style: ElevatedButton.styleFrom(
              shape: const CircleBorder(), backgroundColor:Color(0xFF106163)),
        ));
  }
}

class OnBoardingNavigation extends StatelessWidget {
  final PageController pageController;

  const OnBoardingNavigation({
    required this.pageController,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: TDeviceUtils.getBottomNavigationBarHeight() + 25,
      left: TSizes.defaultSpace,
      child: SmoothPageIndicator(
          effect: ExpandingDotsEffect(
              activeDotColor: THelperFunctions.isDarkMode(context)
                  ? TColors.light
                  : TColors.dark,
              dotHeight: 6),
          controller: pageController, // PageController
          count: 3,
          onDotClicked: (index) {}),
    );
  }
}

class OnBoardingSkip extends StatelessWidget {
  const OnBoardingSkip({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: TDeviceUtils.getAppBarHeight(),
        right: TSizes.defaultSpace,
        child: TextButton(
          onPressed: () {},
          child: const Text("Skip"),
        ));
  }
}

class OnBoardingPage extends StatelessWidget {
  OnBoardingPage({
    super.key,
    required this.image,
    
  
    required this.title,
    required this.subTitle,
  });
  final String image ,  title, subTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: Column(
          children: [
            Image(
                image:  AssetImage(image) ,
                height: THelperFunctions.screenHeight() * 0.65,
                width: THelperFunctions.screenWidth() * 0.8),
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge ,              
            ),
            const SizedBox(height: TSizes.spaceBtwItems),
            Text(
              subTitle,
              style: Theme.of(context).textTheme.bodyMedium,
              textAlign: TextAlign.center,
            )
          ],
        ));
  }
}
