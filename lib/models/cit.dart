import 'dart:convert';

class Cit{
  String id;
  String value;
  String createdAt;

  Cit({required this.id, required this.value, required this.createdAt});

  factory Cit.fromJson(String stringJson) {
    final Map<String, dynamic> map=json.decode(stringJson);
    return Cit.fromMap(map);
  }

  factory Cit.fromMap(Map<String, dynamic> map) {
    return Cit(
      id: map["id"],
      value: map["value"],
      createdAt: map["created_at"],
    );
  }

  @override
  String toString() {
    return 
    """
    Citazione: $value
    ID: $id
    DataCreazione: $createdAt
    """;
  }
}