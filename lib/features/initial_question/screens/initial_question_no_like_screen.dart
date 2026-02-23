import 'package:flutter/material.dart';

import '../../../core/widgets/no_like_base.dart';

class InitialQuestionNoLikeScreen extends StatelessWidget {
  // 생성자에 super.key를 추가해주면 깔끔하게 사라집니다!
  const InitialQuestionNoLikeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const SbtiNoLikeBase(
      title: '힘들어요?\n\n출퇴근 왕복 4시간인 또바도\n이렇게 열심히 일하는데요?',
      imagePath: 'assets/images/cats/home_love_cat.png',
      imageHeight: 140,
      buttons: [
        {'label': '소주는 서민의 눈물', 'route': '/initial_question'},
        {'label': '주 3일제 하세요', 'route': '/initial_question'},
        {'label': '울지 마세요', 'route': '/initial_question'},
        {'label': '미안해요', 'route': '/initial_question'},
        {'label': '할게요', 'route': '/initial_question'},
        {'label': '때리지마세요', 'route': '/initial_question'},
        {'label': '너무 좋아요', 'route': '/initial_question'},
        {'label': '좋아요', 'route': '/initial_question'},
      ],
    );
  }
}
