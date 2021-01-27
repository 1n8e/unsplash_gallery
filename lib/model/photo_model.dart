class Photo {
  final String name;
  final String createdAt;
  final String thumbImg;
  final String fullImg;

  Photo(
      {this.name, this.createdAt, this.thumbImg, this.fullImg});

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo (
      name: json['user']['name'] as String,
      createdAt: json['created_at'] as String,
      thumbImg: json['urls']['thumb'] as String,
      fullImg: json['urls']['full'] as String,
    );
  }
}
