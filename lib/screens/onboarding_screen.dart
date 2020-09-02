import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_onboarding_starting/models/item_model.dart';

import '../constant.dart';
import '../dummy.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    onboardingItem(ItemModel item) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(item.imageUrl),
          SizedBox(
            height: 48,
          ),
          Text(
            item.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: kTitleColor,
            ),
          ),
          SizedBox(
            height: 28,
          ),
          Text(
            item.subtitle,
            style: TextStyle(
              fontSize: 16,
              color: kSubtitleColor,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(
            height: 28,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 0 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 1 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: currentIndex == 2 ? kTitleColor : kSubtitleColor,
                  shape: BoxShape.circle,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 28,
          ),
          MaterialButton(
            onPressed: () {
              if (currentIndex != 2) carouselController.nextPage();
            },
            color: kTitleColor,
            minWidth: 180,
            padding: EdgeInsets.symmetric(vertical: 20),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              currentIndex == 2 ? 'Get Started' : 'Next',
              style: TextStyle(
                fontSize: 16,
                color: kWhiteColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      );
    }

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Stack(
              children: [
                CarouselSlider(
                  items: data
                      .map((item) => onboardingItem(ItemModel.fromJson(item)))
                      .toList(),
                  options: CarouselOptions(
                    initialPage: currentIndex,
                    height: double.infinity,
                    enableInfiniteScroll: false,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                  carouselController: carouselController,
                ),
                currentIndex == 2
                    ? SizedBox()
                    : Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            carouselController.animateToPage(2);
                          },
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 28),
                            child: Text(
                              'Skip',
                              style: TextStyle(
                                color: kSubtitleColor,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
