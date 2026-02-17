import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/theme/app_text_styles.dart';
import '../providers/sbti_provider.dart';
import 'sbti_question_button.dart';

/// [1] SbtiQuestionContent: 질문과 답변 버튼 세트
class SbtiQuestionContent extends ConsumerWidget {
  final Map<String, dynamic> question;
  final int index;

  const SbtiQuestionContent({
    super.key,
    required this.question,
    required this.index,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(sbtiProvider.notifier);

    return Column(
      children: [
        // 상단 질문 영역
        Text(
          'Q${index + 1}\n\n${question['q']}',
          textAlign: TextAlign.center,
          style: AppTextStyles.ptdBold(24),
        ),
        const Spacer(),
        // 중앙 답변 버튼 영역
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SbtiQuestionButton(
              text: question['a']!,
              onTap: () => notifier.selectOption(question['at']!),
            ),
            const SizedBox(height: 16),
            SbtiQuestionButton(
              text: question['b']!,
              onTap: () => notifier.selectOption(question['bt']!),
            ),
            if (question.containsKey('c')) ...[
              const SizedBox(height: 16),
              SbtiQuestionButton(
                text: question['c']!,
                onTap: () => notifier.selectOption(question['ct']!),
              ),
            ],
          ],
        ),
        const Spacer(),
      ],
    );
  }
}