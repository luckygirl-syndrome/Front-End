// lib/features/auth/widgets/login_form.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/app_text_field.dart';
import '../providers/login_provider.dart';

class LoginForm extends ConsumerWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.read(loginProvider.notifier);
    final state = ref.watch(loginProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const _Label('아이디'),
        AppTextField(
          hint: '아이디를 입력해주세요',
          onChanged: notifier.updateEmail,
          textStyle: AppTextStyles.ptdRegular(12),
          hintStyle: AppTextStyles.ptdRegular(12),
          iconSize: 14,
        ),
        const SizedBox(height: 24),
        const _Label('비밀번호'),
        AppTextField(
          hint: '비밀번호를 입력해주세요',
          obscureText: true,
          textStyle: AppTextStyles.ptdRegular(12),
          hintStyle: AppTextStyles.ptdRegular(12),
          iconSize: 14,
          onChanged: notifier.updatePassword,
        ),
        const SizedBox(height: 12),
        AppButton(
            text: '시작하기',
            borderRadius: 4,
            textStyle: AppTextStyles.ptdBold(12),
            onPressed: state.isLoading
                ? null
                : () async {
                    final success = await notifier.login();
                    if (success && context.mounted) {
                      context.push('/sbti_start'); // 성공 시에만 이동
                    }
                  }),
      ],
    );
  }
}

// 내부에서만 쓰는 헬퍼 위젯
class _Label extends StatelessWidget {
  final String text;
  const _Label(this.text);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(text, style: AppTextStyles.ptdBold(12)),
      );
}
