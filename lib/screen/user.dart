/*{
    "userId": 1,
    "id": 1,
    "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
    "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
  },*/

class Jdata {
  final int userId, id;
  final String title, body;

  Jdata(
      {required this.userId,
      required this.id,
      required this.title,
      required this.body});

  static Jdata convert(Map json) {
    return Jdata(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }
}
