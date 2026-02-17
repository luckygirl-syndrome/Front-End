import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../theme/app_text_styles.dart';
import 'app_button.dart';

class SbtiNoLikeBase extends StatelessWidget {
  final String title;
  final String imagePath;
  final List<Map<String, String>> buttons; // 개별 경로를 위해 Map 리스트 사용
  final double? imageHeight;

  const SbtiNoLikeBase({
    super.key,
    required this.title,
    required this.imagePath,
    required this.buttons,
    this.imageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 38),
              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.ptdBold(24),
              ),

              const Spacer(),

              Image.asset(imagePath, height: imageHeight ?? 200),

              const Spacer(),
              // 버튼들을 그리드로 배치
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: buttons.map((btn) {
                  return SizedBox(
                    width: buttons.length == 1 
                        ? double.infinity 
                        : (MediaQuery.of(context).size.width - 64 - 10) / 2,
                    child: AppButton(
                      text: btn['label']!,
                      onPressed: () => context.push(btn['route']!),
                    ),
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}