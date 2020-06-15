class User {
  int id;
  String username;
  String profileImage;
  bool hasCompletedOnboarding;
  bool isAuthenticated;

  User({this.id, this.username, this.profileImage, this.hasCompletedOnboarding,
      this.isAuthenticated});

  factory User.fromJSON(Map<String, dynamic> data) {
    return User(
      id: data['id'],
      username: data['username'],
      profileImage: data['profileImage'],
      hasCompletedOnboarding: data['hasCompletedOnboarding'] == 1,
      isAuthenticated: data['isAuthenticated'] == 1,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'username': username,
      'profileImage': profileImage,
      'hasCompletedOnboarding': hasCompletedOnboarding,
      'isAuthenticated': isAuthenticated ? 1 : 0,
    };
  }
}