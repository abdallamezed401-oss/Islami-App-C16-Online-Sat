import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/colors_manager.dart';
import '../core/resources/assets_manager.dart';
import '../core/routes_manager/routes_manager.dart';
import 'onboarding_item.dart';
import 'onboarding_model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  final List<OnboardingModel> _pages = [
    OnboardingModel(
      image: ImageAssets.intro1,
      title: "Welcome To Islami App ",
      subtitle: "",
    ),
    OnboardingModel(
      image: ImageAssets.intro2,
      title: "Welcome To Islami",
      subtitle: "We Are Very Excited To Have You In Our Community",
    ),
    OnboardingModel(
      image: ImageAssets.intro3,
      title: "Reading the Quran",
      subtitle: "Read, and your Lord is the Most Generous",
    ),
    OnboardingModel(
      image: ImageAssets.intro4,
      title: "Bearish",
      subtitle: "Praise the name of your Lord, the Most High",
    ),
    OnboardingModel(
      image: ImageAssets.intro5,
      title: "Holy Quran Radio",
      subtitle:
      "You can listen to the Holy Quran Radio through the application for free and easily",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: Column(
        children: [
          const SizedBox(height: 50), // مسافة من فوق

          // 🔹 اللوجو فوق
          Center(
            child: Image.asset(
              ImageAssets.islamiLogo,
              height: 120,
            ),
          ),
          const SizedBox(height: 20),

          // 🔹 محتوى OnBoarding (الصفحات)
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _pages.length,
              itemBuilder: (context, index) {
                return OnboardingItem(model: _pages[index]);
              },
            ),
          ),

          // 🔹 Indicators
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _pages.length,
                  (index) => Container(
                margin: const EdgeInsets.all(4),
                width: _currentPage == index ? 14 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index ? ColorsManager.gold : ColorsManager.grey,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // 🔹 أزرار التنقل
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _currentPage == 0
                    ? const SizedBox(width: 60)
                    : TextButton(
                  onPressed: () {
                    _controller.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                _currentPage == _pages.length - 1
                    ? TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(
                      context,
                      RoutesManager.mainLayout,
                    );
                  },
                  child: const Text(
                    "Finish",
                    style: TextStyle(
                      color: ColorsManager.gold1,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
                    : TextButton(
                  onPressed: () {
                    _controller.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn,
                    );
                  },
                  child: const Text(
                    "Next",
                    style: TextStyle(
                      color: ColorsManager.gold,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
