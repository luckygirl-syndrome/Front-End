import 'package:intl/intl.dart';

/// 앱 전역에서 사용하는 가격 포맷 (천 단위 콤마).
/// 예: 28000 → "28,000"
String formatPrice(int price) {
  return NumberFormat('#,###').format(price);
}

/// 가격 + "원" 단위. price가 0이면 [zeroLabel] 반환 (기본: "계산 중...")
String formatPriceWithUnit(int price, {String zeroLabel = '계산 중...'}) {
  if (price == 0) return zeroLabel;
  return '${formatPrice(price)}원';
}
