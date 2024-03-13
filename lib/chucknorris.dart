import 'dart:convert';
import 'package:chucknorris/models/cit.dart';
import 'package:http/http.dart' as http;

const stringUrl = "https://api.chucknorris.io/jokes/random";

Future<Cit> getCit() async {
  final url = Uri.parse(stringUrl);
  final res = await http.get(url);

  return Cit.fromJson(res.body);
}

Future<Cit> getCitFromCategory(String category) async {
  final url = Uri.parse(stringUrl);
  final urlWithCategory = url.replace(queryParameters: {'category': category});
  final res = await http.get(urlWithCategory);

  return Cit.fromJson(res.body);
}

Future<List<Cit>> getCitsFromParameter(String? searchParam) async {
  final url=Uri.parse("https://api.chucknorris.io/jokes/search?query=$searchParam");
  final res = await http.get(url);
  final data = json.decode(res.body);

  final dataList=data['result'] as List;
  final cits = dataList.map((data) => Cit.fromMap(data as Map<String, dynamic>)).toList();

  return cits;
}


