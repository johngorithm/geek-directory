
class Geek {
  String username;
  String avatarUrl;

  Geek({this.avatarUrl, this.username});

  factory Geek.fromJSON(Map<String, dynamic> data) {
    return Geek(
      username: data['login'],
      avatarUrl: data['avatar_url'],
    );
  }
}
