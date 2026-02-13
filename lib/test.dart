import 'package:flutter/material.dart';
import 'package:ttobaba/core/theme/app_colors.dart';
// 👈 HomeScreen 경로 확인 [cite: 2026-02-13]
import 'package:ttobaba/features/home/screens/home_screen.dart'; 

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    // 앱의 진입점을 HomeScreen으로 설정하여 전체 구성을 평가합니다. [cite: 2026-02-13]
    home: HomeScreen(), 
  ));
}