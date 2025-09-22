import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:islami_app_online_sat/core/resources/assets_manager.dart';

import '../../../core/resources/colors_manager.dart';

class TasbehTab extends StatefulWidget {
  const TasbehTab({super.key});

  @override
  State<TasbehTab> createState() => _TasbehTabState();
}

class _TasbehTabState extends State<TasbehTab> {
  int _count = 0;
  double _rotation = 0.0;

  final List<String> _phrases = [
    'سبحان الله',
    'الحمد لله',
    'الله أكبر',
  ];

  String get _currentPhrase {
    final index = ((_count ~/ 33) % _phrases.length);
    return _phrases[index];
  }

  void _onTap() {
    setState(() {
      _count++;
      _rotation += (2 * math.pi) / 33;
    });
  }

  @override
  Widget build(BuildContext context) {
    final beadCount = 33;
    final size = MediaQuery.of(context).size;
    final ringDiameter = size.width * 0.99;
    final beadSize = ringDiameter * 0.08;

    return Scaffold(
      body: Stack(
        children: [
          SizedBox.expand(
            child: Image.asset(
                ImageAssets.sebhaBg,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            color: ColorsManager.black.withOpacity(0.8),
          ),

          SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 10),

                Image.asset(
                  ImageAssets.islamiLogo,
                  height: 120,

                ),

                const SizedBox(height: 36),

                const Text(
                  "سَبِّحِ اسْمَ رَبِّكَ الأَعْلَى",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    color: ColorsManager.white,
                  ),
                ),

                const SizedBox(height:3),

                GestureDetector(
                  onTap: _onTap,
                  child: SizedBox(
                    width: ringDiameter,
                    height: ringDiameter + 100,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        AnimatedRotation(
                          turns: _rotation / (2 * math.pi),
                          duration: const Duration(milliseconds: 300),
                          child: SizedBox(
                            width: ringDiameter,
                            height: ringDiameter,
                            child: Stack(
                              children: [
                                ...List.generate(beadCount, (index) {
                                  final angle = (index / beadCount) * 2 * math.pi;
                                  final radius = ringDiameter * 0.37;
                                  final cx = (ringDiameter / 2) + radius * math.cos(angle);
                                  final cy = (ringDiameter / 2) + radius * math.sin(angle);

                                  return Positioned(
                                    left: cx - beadSize / 2,
                                    top: cy - beadSize / 2,
                                    child: Container(
                                      width: beadSize,
                                      height: beadSize,
                                      decoration: BoxDecoration(
                                        color:  ColorsManager.gold1,
                                        shape: BoxShape.circle,
                                        boxShadow: [
                                          BoxShadow(
                                            color: ColorsManager.black.withOpacity(0.3),
                                            blurRadius: 3,
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),

                        Positioned(
                          top: 20,
                          left: 115,
                          child: Image.asset(
                            ImageAssets.sebhaHeader,
                            width: 100,
                            height: 75,
                            fit: BoxFit.contain,
                          ),
                        ),

                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _currentPhrase,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.white,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '$_count',
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: ColorsManager.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
