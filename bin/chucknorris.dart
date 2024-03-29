import 'package:chucknorris/chucknorris.dart' as chucknorris;
import 'package:chucknorris/services/category_service.dart';
import 'package:dotenv/dotenv.dart';
import 'dart:io';

void main(List<String> arguments) async {
  print("-----Citazione Chuck Norris-----");
  final cit=await chucknorris.getCit();
  print(cit);

  print("-----Citazione Chuck Norris + Categoria-----");
  final citCategory=await chucknorris.getCitFromCategory("animal");
  print(citCategory);

  print("-----Citazione Chuck Norris + Categoria + Env-----");
  final env = DotEnv()..load();
  final category=env['category'] ?? '';
  final citEnv=await chucknorris.getCitFromCategory(category);
  print(citEnv);

  print("-----Citazione Chuck Norris + Lettura Categoria-----");
  final categories=await getCategories();
  print("Di quale categoria vuoi la citazione?");
  for (var i=0; i<categories.length; i++){
    print("$i - ${categories[i]}");
  }
  print("Inserire numero della categoria desiderata: ");
  final catIndex=stdin.readLineSync();
  final cat=categories[int.parse(catIndex!)];
  final citInput=await chucknorris.getCitFromCategory(cat);
  print(citInput);

  print("-----Tutte Le Citazioni Chuck Norris Di Una Categoria-----");
  var file = File('savedcits.txt');
  var writeFile = file.openWrite();
  final cits=await chucknorris.getCitsFromParameter("dev");
  for (var cit in cits){
    print("${cits.indexOf(cit)} - $cit");
    writeFile.write("${cits.indexOf(cit)} - ${cit.toString()}");
  }
  writeFile.close();
}