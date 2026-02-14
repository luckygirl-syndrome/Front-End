import 'package:flutter/material.dart';

class SbtiBackground extends StatelessWidget {
  const SbtiBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand( // 화면 전체 크기 확보
      child: Image.asset(
        'assets/images/background.png', // 저장하신 그라데이션 이미지 경로
        fit: BoxFit.fitWidth, 
        // 이미지가 로딩될 때까지 하얀 배경 유지
        errorBuilder: (context, error, stackTrace) => Container(color: Colors.white),
        alignment: Alignment.bottomCenter,
      ),
    );
  }
}