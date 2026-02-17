import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
import 'package:ttobaba/core/widgets/app_button.dart';

class ChugumiInput extends StatelessWidget {
  final String? initialValue;
  final Function(String) onChanged;
  final VoidCallback onNext;

  const ChugumiInput({
    super.key,
    this.initialValue,
    required this.onChanged,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    // 1. 선택지 정의 (제목, 설명)
    final List<Map<String, String>> options = [
      {'title': '모리걸', 'subtitle': '(빈티지, 레이어드, 청순)'},
      {'title': '드뮤어', 'subtitle': '(차분, 편안, 클래식)'},
      {'title': '걸코어', 'subtitle': '(레이스, 로맨틱, 러블리)'},
      {'title': '스포티 글램', 'subtitle': '(스포티, 화려, 강렬)'},
    ];

    return Column(
      children: options.map((option) {
        final title = option['title']!;
        final subtitle = option['subtitle']!;

        return Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: AppButton(
            title: title, // Bold 24 (AppButton 내부에서 처리됨)
            text: subtitle, // Bold 20
            // 모든 버튼: 노란 배경 + 흰 글씨
            backgroundColor: AppColors.primaryMain,
            textColor: AppColors.white,
            // 클릭 시 값 저장 및 즉시 다음 페이지로 이동
            onPressed: () {
              onChanged('$title\n$subtitle');
              onNext();
            },
          ),
        );
      }).toList(),
    );
  }
}
