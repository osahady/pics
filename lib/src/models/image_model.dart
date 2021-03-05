class ImageModel {
  static const String idField = 'id';
  static const String titleField = 'title';
  static const String urlField = 'url';

  int id;
  String title;
  String url;

  ImageModel(this.id, this.title, this.url);

  ImageModel.fromJson(Map<String, dynamic> parsedJson) {
    id = parsedJson['id'];
    title = parsedJson['title'];
    url = parsedJson['url'];
  }

  factory ImageModel.fromMap(Map<String, dynamic> parsedJson) {
    if (parsedJson == null) return null;
    return ImageModel(
      parsedJson['id'],
      parsedJson['title'],
      parsedJson['url'],
    );
  }

  String toString() {
    return '\nid: $id\n title: $title\n url: $url';
  }
}
