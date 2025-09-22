import 'package:flutter/material.dart';
import '../core/resources/colors_manager.dart';
import 'onboarding_model.dart';

class OnboardingItem extends StatelessWidget {
  final OnboardingModel model;

  const OnboardingItem({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            model.image,
            height: 260,
            fit: BoxFit.fitWidth,
          ),
          const SizedBox(height:85),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: ColorsManager.gold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height:25),
          Text(
            model.subtitle,
            style: const TextStyle(
              fontSize: 16,
              color: ColorsManager.gold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
