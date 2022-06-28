import 'package:algoriza_first_task/pages/login/login_view.dart';
import 'package:algoriza_first_task/resourse_manager/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../base_component/base_component.dart';
import '../../models/models.dart';
import '../../resourse_manager/asset_manager.dart';

class OnBoardingView extends StatefulWidget {
  OnBoardingView({Key? key}) : super(key: key);

  @override
  State<OnBoardingView> createState() => _OnBoardingViewState();
}

class _OnBoardingViewState extends State<OnBoardingView> {
  final PageController _pageController = PageController();

  int currentIndex = 0;

  List<OnBoardingViewSlider> slider = [
    OnBoardingViewSlider(
        ImageAssets.onBoarding1, AppStrings.title1, AppStrings.sampleText),
    OnBoardingViewSlider(
        ImageAssets.onBoarding2, AppStrings.title2, AppStrings.sampleText),
    OnBoardingViewSlider(
        ImageAssets.onBoarding3, AppStrings.title3, AppStrings.sampleText),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        actions: [
          CustomMaterailButton(
            callback: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginView()));
            },
            borderRadious: 25,
            buttonColor: Colors.white30,
            textColor: Colors.black,
            width: 100,
            child: const Text(AppStrings.skip,
                style: TextStyle(color: Colors.black)),
          )
        ],
        systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.white, statusBarBrightness: Brightness.dark),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: PageView.builder(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Image.asset(slider[index].imagePath),
            const SizedBox(
              height: 30,
            ),
            Text(
              slider[index].title,
              style: const TextStyle(color: Colors.black),
            ),
            const SizedBox(
              height: 30,
            ),
            Text(
              slider[index].body,
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ]),
          controller: _pageController,
          itemCount: slider.length,
          onPageChanged: (index) {
            currentIndex = index;
          },
        ),
      ),
      bottomSheet: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            getProperCircle(),
            const SizedBox(
              height: 20,
            ),
            CustomMaterailButton(
                callback: () {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => LoginView()));
                },
                borderRadious: 15,
                buttonColor: Theme.of(context).primaryColor,
                textColor: Colors.white,
                width: double.infinity,
                child: const Text(AppStrings.getStarted,style: TextStyle(color: Colors.white),))
          ],
        ),
      ),
    );
  }

  getProperCircle() => SmoothPageIndicator(
        controller: _pageController,
        count: slider.length,
        effect: const ExpandingDotsEffect(
            activeDotColor: Colors.redAccent,
            dotColor: Colors.grey,
            dotHeight: 10,
            dotWidth: 10,
            spacing: 10,
            strokeWidth: 20),
      );
}
