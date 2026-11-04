import 'package:flutter/material.dart';
import 'package:movie_app/feature/on_boarding/presentation/views/on_boarding_one.dart';
import 'package:movie_app/feature/on_boarding/presentation/views/on_boardin_two.dart';

class OnBoardingPageView extends StatefulWidget {
  const OnBoardingPageView({super.key});

  @override
  State<OnBoardingPageView> createState() => _OnBoardingPageViewState();
}

class _OnBoardingPageViewState extends State<OnBoardingPageView> {
  late final PageController controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: 0);
  }

  void goToPage(int index) {
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        OnBoardingOne(
          onNext: () => goToPage(1),
          onFirstTap: () => goToPage(0),
          onSecondTap: () => goToPage(1),
        ),
        OnBoardingTwo(
          onFirstTap: () => goToPage(0),
          onSecondTap: () => goToPage(1),
        ),
      ],
    );
  }
}
