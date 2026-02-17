// lib/features/auth/widgets/signup_body.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/signup_provider.dart';
import 'signup_page_content.dart';

/// [4] SignupBody: 상태 감시 및 페이지 전환의 중심
/// ref.watch를 여기서 사용하여 입력 시 화면 전체가 아닌 Body만 다시 그리도록 최적화합니다.
class SignupBody extends ConsumerWidget {
  final List<Map<String, dynamic>> pageData;

  const SignupBody({
    super.key,
    required this.pageData,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Body는 PageView의 '흐름'만 관리합니다.
    final notifier = ref.read(signupProvider.notifier);

    return PageView.builder(
      controller: notifier.pageController, 
      physics: const NeverScrollableScrollPhysics(),
      onPageChanged: notifier.setPage,
      itemCount: pageData.length,
      itemBuilder: (context, index) => SignupPageContent(
        data: pageData[index],
        index: index,
      ),
    );
  }
}