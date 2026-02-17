import 'package:flutter/material.dart';

// 이런식으로 쓰심 됩니다
/*
Text(
  "준호님, 폰트 적용 완료입니다!",
  style: AppTextStyles.ptdBold(20).copyWith(
    color: AppColors.primary, // 아까 만든 컬러와 조합 가능!
  ),
)
*/

class AppTextStyles {
  // pubspec.yaml에 등록한 family 이름과 똑같아야 합니다.
  static const String _ptd = 'Pretendard';

  // Pretendard - Thin (100)
  // static TextStyle ptdThin(double size) => TextStyle(
  //   fontFamily: _ptd,
  //   fontSize: size,
  //   fontWeight: FontWeight.w100,
  // );

  // // Pretendard - Light (300)
  // static TextStyle ptdLight(double size) => TextStyle(
  //   fontFamily: _ptd,
  //   fontSize: size,
  //   fontWeight: FontWeight.w300,
  // );

  // Pretendard - Regular (400)
  static TextStyle ptdRegular(double size) => TextStyle(
    fontFamily: _ptd,
    fontSize: size,
    fontWeight: FontWeight.w400,
  );

  // Pretendard - Medium (500)
  static TextStyle ptdMedium(double size) => TextStyle(
    fontFamily: _ptd,
    fontSize: size,
    fontWeight: FontWeight.w500,
  );

  // // Pretendard - SemiBold (600)
  // static TextStyle ptdSemiBold(double size) => TextStyle(
  //   fontFamily: _ptd,
  //   fontSize: size,
  //   fontWeight: FontWeight.w600,
  // );

  // Pretendard - Bold (700)
  static TextStyle ptdBold(double size) => TextStyle(
    fontFamily: _ptd,
    fontSize: size,
    fontWeight: FontWeight.w700,
  );

  // Pretendard - ExtraBold (800)
  static TextStyle ptdExtraBold(double size) => TextStyle(
    fontFamily: _ptd,
    fontSize: size,
    fontWeight: FontWeight.w800,
  );
}