/// API 서버 주소.
///
/// - 기본: AWS 배포 서버 (http://18.118.233.127:8001).
/// - 로컬 백엔드 사용 시: `flutter run --dart-define=API_BASE_URL=http://127.0.0.1:8001`
/// - 실기기에서 PC 접속: `--dart-define=API_BASE_URL=http://192.168.x.x:8001`
final String apiBaseUrl = String.fromEnvironment(
  'API_BASE_URL',
  defaultValue: 'http://18.118.233.127:8001',
);
