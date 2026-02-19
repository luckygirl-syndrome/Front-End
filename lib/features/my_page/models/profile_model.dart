class ProfileModel {
  final String name;
  final int profileImageIndex;

  ProfileModel({required this.name, required this.profileImageIndex});

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      // iOS의 codingKeys처럼 서버 키값과 매칭
      name: json['name'] ?? '',
      profileImageIndex: json['profile_image_index'] ?? 0,
    );
  }

  factory ProfileModel.defaultProfile() {
    return ProfileModel(name: '홍경현', profileImageIndex: 0);
  }
}