/// id : "2"
/// createdAt : "2021-05-24T00:14:44.689Z"
/// contributorName : "Irma Grant"
/// contributorAvatar : "https://cdn.fakercloud.com/avatars/mrjamesnoble_128.jpg"
/// title : "dolor aut aut"
/// content : "Earum voluptas magnam doloribus. Harum consequatur accusamus animi. Eum distinctio ut quia tempore. Natus velit velit eum sit adipisci autem vero ea doloremque. Ut et repudiandae. Eos tenetur reprehenderit id excepturi.\n \rDolorum quam rem corrupti suscipit praesentium labore praesentium eos porro. Non sit sit vel voluptatem aut natus voluptatem et. Nobis impedit tenetur consequatur. Et laborum laborum vero hic. Provident aut sed eligendi porro repudiandae quas et dignissimos est. Fuga esse velit ad id deserunt.\n \rDolor modi ullam qui in debitis quae non. Aspernatur odit et harum. Asperiores nihil officiis ut in. Sint magni sunt et provident consequatur consequatur."
/// contentThumbnail : "http://placeimg.com/640/480/abstract"
/// slideshow : ["http://placeimg.com/640/480/nature","http://placeimg.com/640/480/fashion","http://placeimg.com/640/480/transport"]

class News {
  News({
      String? id, 
      String? createdAt, 
      String? contributorName, 
      String? contributorAvatar, 
      String? title, 
      String? content, 
      String? contentThumbnail, 
      List<String>? slideshow,}){
    _id = id;
    _createdAt = createdAt;
    _contributorName = contributorName;
    _contributorAvatar = contributorAvatar;
    _title = title;
    _content = content;
    _contentThumbnail = contentThumbnail;
    _slideshow = slideshow;
}

  News.fromJson(dynamic json) {
    _id = json['id'];
    _createdAt = json['createdAt'];
    _contributorName = json['contributorName'];
    _contributorAvatar = json['contributorAvatar'];
    _title = json['title'];
    _content = json['content'];
    _contentThumbnail = json['contentThumbnail'];
    _slideshow = json['slideshow'] != null ? json['slideshow'].cast<String>() : [];
  }
  String? _id;
  String? _createdAt;
  String? _contributorName;
  String? _contributorAvatar;
  String? _title;
  String? _content;
  String? _contentThumbnail;
  List<String>? _slideshow;

  String? get id => _id;
  String? get createdAt => _createdAt;
  String? get contributorName => _contributorName;
  String? get contributorAvatar => _contributorAvatar;
  String? get title => _title;
  String? get content => _content;
  String? get contentThumbnail => _contentThumbnail;
  List<String>? get slideshow => _slideshow;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['createdAt'] = _createdAt;
    map['contributorName'] = _contributorName;
    map['contributorAvatar'] = _contributorAvatar;
    map['title'] = _title;
    map['content'] = _content;
    map['contentThumbnail'] = _contentThumbnail;
    map['slideshow'] = _slideshow;
    return map;
  }

}