import 'package:flutter/material.dart';

import '../../../core/widgets/no_like_base.dart';

class SbtiNoLikeScreen extends StatelessWidget {
  // 생성자에 super.key를 추가해주면 깔끔하게 사라집니다!
  const SbtiNoLikeScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return const SbtiNoLikeBase(
      title: '싫어요?\n\n화가 난 또바가 당신을\n노려보고 있어요',
      imagePath: 'assets/images/sbti_angry_cat.png',
      buttons: [
        {'label': '할게요', 'route': '/sbti_question'},
        {'label': '때리지 마세요', 'route': '/sbti_question'},
        {'label': '너무 좋아요', 'route': '/sbti_question'},
        {'label': '좋아요', 'route': '/sbti_question'},
      ],
    );
  }
}