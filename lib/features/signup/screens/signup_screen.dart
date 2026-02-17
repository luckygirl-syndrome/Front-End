import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

// 1. 공통 위젯들
import '../../../core/widgets/app_backbar.dart';

// 3. 방금 만든 프로바이더
import '../providers/signup_provider.dart';
import '../widgets/signup_body.dart';
import '../widgets/signup_footer.dart';

class SignupScreen extends ConsumerWidget {
  // 이제 StatefulWidget일 필요도 없음!
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(signupProvider);
    final notifier = ref.read(signupProvider.notifier);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        currentPage: state.currentPage,
        onBackPressed: () {
          // notifier의 back을 호출하면서, 0페이지일 때 할 일을 넘겨줌
          notifier.back(() {
            context.pop(); // 혹은 context.go('/login');
          });
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              const SizedBox(height: 31),
              Expanded(
                child: SignupBody(
                  // Body 내부에서도 notifier.pageController를 직접 쓰게 함
                  pageData: signupPageData,
                ),
              ),
              SignupFooter(
                currentPage: state.currentPage,
                isPageValid: notifier.isCurrentPageValid(),
                onNextPressed: () =>
                    notifier.next(() => context.push('/sbti_start')),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<Map<String, dynamic>> signupPageData = [
  {
    'title': '어떻게 부르면 될까요?',
    'subTitle': null,
    'hint': '이름을 입력해 주세요',
    'guides': []
  },
  {
    'title': '멋진 이메일을 입력해 주세요',
    'subTitle': null,
    'hint': '이메일을 입력해 주세요',
    'guides': ['@를 포함한 올바른 이메일 형식을 입력해 주세요']
  },
  {
    'title': '은밀한 비밀번호를\n입력해 주세요',
    'subTitle': '또바바는 보안을 자랑합니다',
    'hint': '비밀번호를 입력해 주세요',
    'guides': ['영어/숫자 포함 8~16자로 입력해주세요. (특수문자 가능)']
  },
  {
    'title': '은밀한 비밀번호를\n한 번 더 입력해 주세요',
    'subTitle': '또바바는 보안을 자랑합니다',
    'hint': '비밀번호를 한 번 더 입력해 주세요',
    'guides': ['동일한 비밀번호를 입력해 주세요']
  },
];
