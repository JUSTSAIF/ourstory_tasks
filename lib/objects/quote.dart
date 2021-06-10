// class Quote {
//   String? quote;
//   String? author;
//   Quote({this.quote, this.author});
// }

class Quote {
  List<String>? tags;
  String _id;
  String content;
  String author;
  String authorSlug;
  final int length;
  Quote({
    required this.tags,
    required id,
    required this.content,
    required this.author,
    required this.authorSlug,
    required this.length,
  }) : _id = id;
}
