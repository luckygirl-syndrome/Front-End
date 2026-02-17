import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:ttobaba/core/widgets/app_backbar.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_button.dart';
import '../../../core/widgets/two_buttons.dart';
import '../provider/initial_question_provider.dart';

class InitialQuestionStartScreen extends ConsumerWidget {
  const InitialQuestionStartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 💡 데이터 구독
    final state = ref.watch(initialQuestionProvider);
    final isFinished = state.isFinished;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        onBackPressed: () {
          if (isFinished) {
            // 완료 화면에서 뒤로가기: 다시 질문 화면으로 돌아감
            ref.read(initialQuestionProvider.notifier).returnToQuestion();
            context.push('/initial_question');
          } else {
            // 시작 화면에서 뒤로가기: 앱 종료 또는 이전 화면
            context.pop();
          }
        },
      ),
      body: Stack(
        children: [
          // 1. 배경 (그라데이션)
          const _BackgroundLayout(),

          // 2. 캐릭터 이미지 (중앙 고정)
          _CharacterImage(isFinished: isFinished),

          // 3. UI 콘텐츠 영역 (텍스트 + 버튼)
          _ForegroundContent(isFinished: isFinished),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------
// 하단 비공개(_) 위젯들: Screen의 복잡도를 낮춰줍니다.
// ---------------------------------------------------------

class _BackgroundLayout extends StatelessWidget {
  const _BackgroundLayout();

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Colors.white,
              AppColors.primaryMain,
              Colors.white
            ],
            stops: [0.0, 0.35, 0.351, 0.9],
          ),
        ),
      ),
    );
  }
}

class _CharacterImage extends StatelessWidget {
  final bool isFinished;
  const _CharacterImage({required this.isFinished});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        isFinished
            ? 'assets/images/initial_question_cat_end.png'
            : 'assets/images/initial_question_cat.png',
        height: 96,
      ),
    );
  }
}

class _ForegroundContent extends StatelessWidget {
  final bool isFinished;
  const _ForegroundContent({required this.isFinished});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          children: [
            const SizedBox(height: 40),
            Text(
              isFinished
                  ? '진짜로 끝났어요\n\n또바바와 함께\n또 사기 전에 또바!'
                  : '거의 다 끝났어요\n\n또바가 OO 님을 더 잘 알기 위해\n딱 2가지만 더 물어볼게요!',
              textAlign: TextAlign.center,
              style: AppTextStyles.ptdBold(24),
            ),
            const Spacer(),
            _BottomActionButtons(isFinished: isFinished),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _BottomActionButtons extends StatelessWidget {
  final bool isFinished;
  const _BottomActionButtons({required this.isFinished});

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return AppButton(
        text: '가보자고~!',
        onPressed: () => context.go('/home'),
      );
    }
    return TwoButtons(
      onLeftPressed: () => context.push('/initial_question_no_like'),
      onRightPressed: () => context.push('/initial_question'),
      leftText: '이젠 힘들어요',
      rightText: '좋아요',
    );
  }
}
