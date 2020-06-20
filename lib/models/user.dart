class User {
  String uuid;
  String email;
  String name;
  String profileImage;
  bool hasCompletedOnboarding;
  bool isAuthenticated;

  User({this.uuid, this.name, this.email, this.profileImage, this.hasCompletedOnboarding,
      this.isAuthenticated});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      uuid: data['uuid'],
      email: data['email'],
      name: data['name'],
      profileImage: data['profile_image'],
      hasCompletedOnboarding: data['has_completed_onboarding'] == 1,
      isAuthenticated: data['is_authenticated'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uuid': uuid,
      'email': email,
      'name': name,
      'profile_image': profileImage,
      'has_completed_onboarding': hasCompletedOnboarding,
      'is_authenticated': isAuthenticated ? 1 : 0,
    };
  }
}