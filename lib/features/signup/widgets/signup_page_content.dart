import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../providers/signup_provider.dart';
import 'signup_guide_item.dart';

/// [1] SignupPageContent: 각 페이지의 실질적인 입력 폼 구성
/// 제목, 입력창(TextField), 하단 유효성 가이드라인을 한 세트로 보여줍니다.
class SignupPageContent extends ConsumerStatefulWidget {
  final Map<String, dynamic> data;
  final int index;

  const SignupPageContent({super.key, required this.data, required this.index});

  @override
  ConsumerState<SignupPageContent> createState() => _SignupPageContentState();
}

class _SignupPageContentState extends ConsumerState<SignupPageContent> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    // 이전 페이지에서 돌아왔을 때 데이터 복구를 위해 초기값 설정
    final state = ref.read(signupProvider);
    final String initialValue = [
      state.name,
      state.email,
      state.password,
      state.confirmPassword
    ][widget.index];
    _controller = TextEditingController(text: initialValue);
  }

  @override
  void dispose() {
    _controller.dispose(); // 메모리 해제 필수
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 가이드 아이템의 실시간 반영을 위해 watch
    ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);

    final void Function(String) updateFunc = [
      notifier.updateName,
      notifier.updateEmail,
      notifier.updatePassword,
      notifier.updateConfirmPassword,
    ][widget.index];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.data['title']!,
            style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black)),
        if (widget.data['subTitle'] != null) ...[
          const SizedBox(height: 8),
          Text(widget.data['subTitle']!,
              style: AppTextStyles.ptdRegular(12)
                  .copyWith(color: AppColors.lightGrey)),
        ],
        const SizedBox(height: 78),
        AppTextField(
          hint: widget.data['hint']!,
          controller: _controller,
          obscureText: widget.index >= 2,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          onSubmitted: (_) => notifier.next(() => context.push('/sbti_start')),
        ),
        const SizedBox(height: 16),
        ...List<String>.from(widget.data['guides'] ?? []).asMap().entries.map(
            (e) => SignupGuideItem(
                text: e.value,
                isValid: notifier.isGuideValid(widget.index, e.key))),
      ],
    );
  }
}
