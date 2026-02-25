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

/// 고민 일수 → "오늘 고민" (0일) / "N일 고민" (1일 이상)
String formatConsideringDays(int? days) {
  final d = days ?? 0;
  return d == 0 ? '오늘 고민' : '${d}일 고민';
}

/// 고민 일수 짧은 표기 → "오늘" / "N일" (하이라이트 등)
String formatConsideringDaysShort(int? days) {
  final d = days ?? 0;
  return d == 0 ? '오늘' : '${d}일';
}

/// 채팅 메시지 시간: ISO 문자열 → "2월 25일 14:18"
String formatChatTime(String? isoString) {
  if (isoString == null || isoString.isEmpty) return '';
  try {
    final dt = DateTime.parse(isoString).toLocal();
    return DateFormat('M월 d일 HH:mm').format(dt);
  } catch (_) {
    return isoString;
  }
}

/// 채팅 메시지 시간 (DateTime): "2월 25일 14:18"
String formatChatTimeFromDateTime(DateTime dt) {
  return DateFormat('M월 d일 HH:mm').format(dt);
}
