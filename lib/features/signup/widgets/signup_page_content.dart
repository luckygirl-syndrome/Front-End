import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_text_field.dart';
import '../providers/signup_provider.dart';
import 'signup_guide_item.dart';

class SignupPageContent extends StatelessWidget {
  final Map<String, dynamic> data;
  final int index;
  final SignupState state;
  final SignupNotifier notifier;
  final Function(String) onSubmitted;

  const SignupPageContent({
    super.key,
    required this.data,
    required this.index,
    required this.state,
    required this.notifier,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(data['title']!, style: AppTextStyles.ptdBold(24).copyWith(color: AppColors.black)),
        if (data['subTitle'] != null) ...[
          const SizedBox(height: 8),
          Text(data['subTitle']!, style: AppTextStyles.ptdRegular(12).copyWith(color: AppColors.lightGrey)),
        ],
        const SizedBox(height: 78),
        AppTextField(
          controller: state.controllers[index],
          hint: data['hint']!,
          obscureText: index >= 2,
          contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 22),
          onSubmitted: onSubmitted,
        ),
        const SizedBox(height: 16),
        ...List<String>.from(data['guides'] ?? []).asMap().entries.map((e) => 
          SignupGuideItem(text: e.value, isValid: notifier.isGuideValid(index, e.key))
        ),
      ],
    );
  }
}