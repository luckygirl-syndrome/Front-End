import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../core/widgets/app_back_bar.dart';
import '../../../core/widgets/app_indicator.dart';
import '../providers/sbti_provider.dart';
import '../widgets/sbti_quesiton_content.dart';
import '../widgets/sbti_question_button.dart';

class SbtiQuestionScreen extends ConsumerWidget {
  const SbtiQuestionScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 1. 질문 완료 시 화면 이동 로직
    ref.listen<SbtiState>(sbtiProvider, (previous, next) {
      if (next.currentIndex >= 9) {
        context.go('/initial_question_start');
      }
    });

    final state = ref.watch(sbtiProvider);
    final notifier = ref.read(sbtiProvider.notifier);

    // 질문 데이터 리스트
    final questions = sbtiQuestions;

    // [수정] 인덱스 안전장치: 질문 완료 시점이면 더 이상 아래 로직을 타지 않음
    if (state.currentIndex >= questions.length) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBackBar(
        currentPage: state.currentIndex,
        onBackPressed: () =>
            state.currentIndex == 0 ? context.pop() : notifier.previousPage(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          child: Column(
            children: [
              // 💡 핵심 콘텐츠 (질문 + 버튼)
              Expanded(
                child: SbtiQuestionContent(
                  question: questions[state.currentIndex],
                  index: state.currentIndex,
                ),
              ),

              // 💡 직접 만든 공통 위젯 재사용!
              // 회원가입 페이지와 동일한 룩앤필을 유지합니다.
              AppIndicator(
                currentPage: state.currentIndex, 
                totalPage: questions.length, // S-BTI 질문 개수(9개) 전달
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> sbtiQuestions = [
  {
    'q': '쇼핑 앱을 켜는\n\'진짜\' 이유는?',
    'a': '딱히 살 건 없지만,\n새로운 신상이나\n유행을 안 보면 허전해서',
    'at': 'D',
    'b': '자주 앱을 켜지 않지만,\n필요한 옷이 생겼을 때',
    'bt': 'N'
  },

  {
    'q': '우울하거나 스트레스\n받는 날에는...',
    'a': '"금융 치료!" 일단 뭐라도 사야\n기분이 풀린다.',
    'at': 'D',
    'b': '돈 쓰는 건 더 스트레스다.',
    'bt': 'N'
  },

  {
    'q': '시킨 옷이 배송왔다는\n문자를 받았을 때 심정은?',
    'a': '"드디어 왔다!! (두근두근)"\n뜯는 순간이 제일 행복하다.',
    'at': 'D',
    'b': '"아, 그거 왔네."\n생필품 채워 넣는 느낌이다.',
    'bt': 'N'
  },

  // [Q4~6] 유형2: S(사회-자극형) vs A(미적-자극형)

  {
    'q': '이 옷을 처음 ‘찜’하게 된\n순간을 떠올리면 더 가까운 건?',
    'a': '스크롤하다가 멈췄다.\n핏이나 색감이 독특해서\n한참을 보고 있었다.',
    'at': 'A',
    'b': '유튜브나 인스타에서\n“요즘 이게 유행인가” 싶어\n 다시 보게 됐다.',
    'bt': 'S'
  },

  {
    'q': '이 옷을 ‘괜히 계속 생각나게\n만드는’ 요소는?',
    'a': '“이 옷 색감 진짜 특이하다”,\n“이 디자인 내가 찾던 거야”',
    'at': 'A',
    'b': '“이런 스타일\n요즘 많이 보이지 않았나?”,\n“인스타에서 많이 봤는데”',
    'bt': 'S'
  },

  {
    'q': '인스타에서 나도 모르게\n\'저장\'을 누르게 되는 사진은?',
    'a': '옷의 실루엣이나 색감 조화가\n돋보이는 감성적인 룩북 사진',
    'at': 'A',
    'b': '좋아하는 인플루언서가\n일상에서 센스 있게 코디한 사진',
    'bt': 'S'
  },

  // [Q7~9] 유형3: M(마이웨이) vs T(유행)

  {
    'q': '사고 싶은 옷이 있는데\n리뷰가 하나도 없다면?',
    'a': '"오히려 좋아. 나만 입을 수 있음."\n내 눈에 예쁘면 산다.',
    'at': 'M',
    'b': '"불안한데..." 핏이 어떨지 몰라서\n구매를 보류한다.',
    'bt': 'T'
  },

  {
    'q': '친구가 "이거 요즘 유행\n다 지났어"라고 한다면?',
    'a': '"어쩌라고? 내 스타일임."\n그냥 입는다.',
    'at': 'M',
    'b': '"진짜? 좀 그런가?"\n하고 다시 생각해본다.',
    'bt': 'T'
  },

  {
    'q': '친구에게 의견을 물었을 때,\n결제를 결심하게 되는 말은?',
    'a': '“이거 완전 너 취향이다.\n딱 네 스타일이네.”',
    'at': 'M',
    'b': '“이거 요즘 유행하는 거 아냐?\n무난하게 잘 입을 듯!”',
    'bt': 'T'
  }
];
