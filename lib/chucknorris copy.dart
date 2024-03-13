import "dart:convert";
import "models/cit.dart";
import "package:http/http.dart" as http;


const stringUrl="https://api.chucknorris.io/jokes/random";

Future<Cit> getCit() async {
  final url = Uri.parse(stringUrl);
  final res = await http.get(url);
  final Map<String, dynamic> data=json.decode(res.body);
  
  return Cit(id:data['id'], value:data['value'], createdAt:data['created_at']);
}

//Altro metodo: utilizzare la Factory -> ci consente di creare un metodo statico per istanziare la classe stessa

Future<Cit> getCitFromCategory(String category) async {
  final url = Uri.parse(stringUrl);
  final urlWithCategory = url.replace(queryParameters:{'category':category});
  final res = await http.get(urlWithCategory);
  final Map<String, dynamic> data=json.decode(res.body);
  
  return Cit(id:data['id'], value:data['value'], createdAt:data['created_at']);
}
