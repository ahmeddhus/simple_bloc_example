import 'dart:convert';
import 'dart:io';

import 'package:simple_bloc_example/src/model/person.dart';

class PersonApi {
  static Future<Iterable<Person>> getPersons(String url) => HttpClient()
      .getUrl(Uri.parse(url))
      .then((request) => request.close())
      .then((response) => response.transform(utf8.decoder).join())
      .then((string) => json.decode(string) as List<dynamic>)
      .then((list) => list.map((e) => Person.fromJson(e)));
}
