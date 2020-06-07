class News {
  String auther;
  String title;
  String description;
  String url;
  String imageurl;

  News({this.auther, this.title, this.description, this.url, this.imageurl});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      auther: json['author'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      url: json['url'] as String,
      imageurl: json['urlToImage'] as String,
    );
  }
}



