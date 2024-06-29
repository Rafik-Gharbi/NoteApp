class Note {
  final dynamic id;
  String? title;
  String? content;

  Note({this.id, this.title = '', this.content = ''});

  Note.fromJson(Map<String, dynamic> json, String id) : this(id: id, title: json['title'], content: json['description']);

  Map<String, dynamic> toJson(String user) {
    final Map<String, dynamic> data = {};
    data['user'] = user;
    data['title'] = title;
    data['description'] = content;
    return data;
  }
}
