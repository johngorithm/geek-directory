class GeekDetail {
  int id;
  int followersCount;
  int followingCount;
  String name;
  String username;
  String company;
  String avatarUrl;
  bool isFavorited;
  int publicRepoCount;
  int publicGistCount;
  String bio;
  String location;

  GeekDetail(
      {
        this.id,
        this.username,
        this.name,
        this.followersCount,
        this.followingCount,
        this.bio,
        this.location,
        this.company,
        this.avatarUrl,
        this.isFavorited = false,
        this.publicGistCount,
        this.publicRepoCount});

  factory GeekDetail.fromJSON(Map<String, dynamic> data) {
    return GeekDetail(
        id: data['id'],
        followersCount: data['followers'],
        followingCount: data['following'],
        name: data['name'],
        username: data['login'],
        avatarUrl: data['avatar_url'],
        location: data['location'],
        company: data['company'],
        bio: data['bio'],
        isFavorited: data['is_favorited'] == null ? false : (data['is_favorited'] == 1),
        publicGistCount: data['public_gists'],
        publicRepoCount: data['public_repos'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'login': username,
      'followers' : followersCount,
      'following' : followingCount,
      'public_gists' : publicGistCount,
      'public_repos' : publicRepoCount,
      'avatar_url': avatarUrl,
      'company': company,
      'bio': bio,
      'location': location,
      'is_favorited': isFavorited ? 1 : 0,
    };
  }
}
