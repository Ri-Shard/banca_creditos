import 'package:banca_creditos/presentation/pages/onboarding/onboarding_pages/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_story_presenter/flutter_story_presenter.dart';
import 'package:get/get.dart';

import '../auth/auth_controller.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final authcontroller = Get.find<LoginController>();

  final storyController = FlutterStoryController();
  final pages = [
    OnboardingPage(
      image: 'assets/images/img_onboarding.png',
      text: 'Accede a créditos con un solo toque y sin complicaciones.',
    ),
    OnboardingPage(
      image: 'assets/images/img_onboarding2.png',
      text:
          'Toma el control de tus finanzas con confianza y accede a ellas sin restricciones.',
    )
  ];

  @override
  Widget build(BuildContext context) {
    storyController.playCustomWidget();

    return Scaffold(
        body: FlutterStoryView(
            flutterStoryController: storyController,
            onStoryChanged: (p0) {
              storyController.playCustomWidget();
            },
            storyViewIndicatorConfig: StoryViewIndicatorConfig(
              height: 4,
              activeColor: Colors.white,
              backgroundCompletedColor: Colors.white,
              backgroundDisabledColor: Colors.white.withOpacity(0.5),
              horizontalGap: 1,
              borderRadius: 1.5,
            ),
            items: [
          StoryItem(
            duration: Duration(seconds: 5),
            storyItemType: StoryItemType.custom,
            customWidget: (p0) {
              return pages[0];
            },
          ),
          StoryItem(
            duration: Duration(seconds: 5),
            storyItemType: StoryItemType.custom,
            customWidget: (p0) {
              return pages[1];
            },
          ),
        ]));
  }
}
