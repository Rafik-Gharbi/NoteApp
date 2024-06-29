class Note {
  final dynamic id;
  String? title;
  String? content;

  Note({this.id = 0, this.title = '', this.content = ''});

  Note.fromJson(Map<String, dynamic> json, String id) : this(id: id, title: json['title'], content: json['description']);

  Map<String, dynamic> toJson() => {'id': id, 'title': title, 'content': content};
}
