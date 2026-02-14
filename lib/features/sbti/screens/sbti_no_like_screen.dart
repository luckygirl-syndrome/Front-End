import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import 'package:go_router/go_router.dart';

class SbtiNoLikeScreen extends StatelessWidget {
  const SbtiNoLikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                children: [
                  const SizedBox(height: 38),
                  Text(
                    '싫어요?\n\n화가 난 또바가 당신을\n노려보고 있어요',
                    textAlign: TextAlign.center,
                    style: AppTextStyles.ptdBold(20),
                  ),
                  const SizedBox(height: 132),
                  // 화난 또바 이미지 (파일명 확인!)
                  Image.asset(
                    'assets/images/sbti_angry_cat.png', 
                    height: 200,
                  ),
                  const Spacer(),
                  // 2x2 버튼 그리드 영역
                  _buildButtonGrid(context),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonGrid(BuildContext context) {
    final List<String> buttonLabels = ['할게요', '때리지 마세요', '너무 좋아요', '좋아요'];
    
    return Wrap(
    spacing: 10, // 좌우 간격
    runSpacing: 10, // 상하 간격
    children: buttonLabels.asMap().entries.map((e) {
      final label = e.value;
      
      return SizedBox(
        // 전체 너비에서 간격 10을 뺀 후 2로 나눔 (정확히 반반)
        width: (MediaQuery.of(context).size.width - 64 - 10) / 2, 
        child: AppButton(
          text: label,
          // ⭐ 이제 버튼 내부 패딩이나 스타일에 따라 높이가 "알아서" 결정됩니다!
          onPressed: () => context.go('/sbti_question'),
        ),
      );
    }).toList(),
  );
  }
}