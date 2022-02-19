import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kartal/kartal.dart';

import '../model/onboard_model.dart';

class OnboardView extends StatefulWidget {
  const OnboardView({Key? key}) : super(key: key);

  @override
  _OnboardViewState createState() => _OnboardViewState();
}

class _OnboardViewState extends State<OnboardView> {
  late final PageController pageController;
  int _currentIndex = 0;
  final int _animationMS = 10;
  final double _pageControllerRadius = 10;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          controller: pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          itemCount: OnboardModel.dummyList.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
                  child: SvgPicture.asset(
                    OnboardModel.dummyList[index].image,
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: context.paddingNormal,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        _circleAvatarRow(),
                        _titleTextFittedBox(index, context),
                        _descriptionText(index, context),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: _skipElevatedButton(context),
                            ),
                            Expanded(
                              child: _nextElevatedButton(context),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          }),
    );
  }

  Text _descriptionText(int index, BuildContext context) {
    return Text(
      OnboardModel.dummyList[index].description,
      style: context.textTheme.headline6?.copyWith(
        color: Colors.grey,
      ),
    );
  }

  FittedBox _titleTextFittedBox(int index, BuildContext context) {
    return FittedBox(
      fit: BoxFit.contain,
      child: Text(
        OnboardModel.dummyList[index].title,
        style: context.textTheme.headline4?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  ElevatedButton _skipElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: _elevatedButtonText(context, 'Skip'),
      style: ElevatedButton.styleFrom(
        primary: Colors.grey.shade200,
      ),
      onPressed: () {
        pageController.animateToPage(OnboardModel.dummyList.length - 1, duration: Duration(milliseconds: _animationMS), curve: Curves.bounceIn);
      },
    );
  }

  ElevatedButton _nextElevatedButton(BuildContext context) {
    return ElevatedButton(
      child: _elevatedButtonText(context, 'Next'),
      style: ElevatedButton.styleFrom(
        primary: const Color.fromARGB(255, 86, 40, 172),
      ),
      onPressed: () {
        if (_currentIndex == OnboardModel.dummyList.length - 1) {
          return;
        }
        pageController.animateToPage(_currentIndex + 1, duration: Duration(milliseconds: _animationMS), curve: Curves.bounceIn);
        _currentIndex += 1;
        setState(() {});
      },
    );
  }

  Text _elevatedButtonText(BuildContext context, String text) {
    return Text(
      text,
      style: context.textTheme.titleMedium?.copyWith(
        color: text == 'Skip' ? Colors.grey : Colors.white,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Row _circleAvatarRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        OnboardModel.dummyList.length,
        (index) => _pageCircleAvatar(index),
      ),
    );
  }

  Widget _pageCircleAvatar(int index) {
    return Padding(
      padding: context.horizontalPaddingLow,
      child: CircleAvatar(
        radius: _pageControllerRadius,
        backgroundColor: _currentIndex == index ? const Color.fromARGB(255, 86, 40, 172) : Colors.grey,
      ),
    );
  }
}
