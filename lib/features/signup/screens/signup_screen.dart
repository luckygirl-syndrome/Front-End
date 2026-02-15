import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 1. 공통 위젯들
import '../../../core/widgets/app_back_bar.dart';
import '../widgets/signup_footer.dart';
import '../widgets/signup_page_content.dart';

// 2. 테마 및 스타일
import '../../../core/theme/app_colors.dart';

// 3. 방금 만든 프로바이더
import '../providers/signup_provider.dart';

class SignupScreen extends ConsumerStatefulWidget {
  const SignupScreen({super.key});
  @override
  ConsumerState<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends ConsumerState<SignupScreen> {
  final PageController _pageController = PageController();

  final List<Map<String, dynamic>> _pageData = [
    {'title': '어떻게 부르면 될까요?', 'subTitle': null, 'hint': '이름을 입력해 주세요', 'guides': []},
    {'title': '멋진 이메일을 입력해 주세요', 'subTitle': null, 'hint': '이메일을 입력해 주세요', 'guides': ['올바른 이메일 형식을 입력해 주세요', '@ 앞부분은 영어와 숫자로 이루어진 8~16자로 입력해 주세요']},
    {'title': '은밀한 비밀번호를\n입력해 주세요', 'subTitle': '또바바는 보안을 자랑합니다', 'hint': '비밀번호를 입력해 주세요', 'guides': ['8~16자로 입력해 주세요', '영어와 숫자로만 입력해 주세요']},
    {'title': '은밀한 비밀번호를\n한 번 더 입력해 주세요', 'subTitle': '또바바는 보안을 자랑합니다', 'hint': '비밀번호를 한 번 더 입력해 주세요', 'guides': ['동일한 비밀번호를 입력해 주세요']},
  ];

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      // 1. 커스텀 앱바 적용
      appBar: AppBackBar(
        currentPage: state.currentPage,
        onBackPressed: _handleBack,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 31),
              Expanded(
                child: PageView.builder(
                  controller: _pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  onPageChanged: notifier.setPage,
                  itemCount: _pageData.length,
                  itemBuilder: (context, index) => SignupPageContent(
                    data: _pageData[index],
                    index: index,
                    state: state,
                    notifier: notifier,
                    onSubmitted: (_) => _handleNext(state, notifier),
                  ),
                ),
              ),
              // 2. 커스텀 푸터 적용
              SignupFooter(
                currentPage: state.currentPage,
                isPageValid: notifier.isPageValid(_pageData),
                onNextPressed: () => _handleNext(state, notifier),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleNext(SignupState state, SignupNotifier notifier) {
    if (notifier.isPageValid(_pageData)) {
      if (state.currentPage < 3) {
        _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
        FocusScope.of(context).unfocus();
      } else { context.go('/sbti_start'); }
    }
  }

  void _handleBack() {
    if (_pageController.page!.toInt() > 0) {
      _pageController.previousPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
    } else {
      context.pop();
    }
  }
}