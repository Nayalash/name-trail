import 'dart:convert';
import 'package:http/http.dart' as http;

const String apiKey = 'na368221867';

Future<dynamic> getData(String name) async {
  final response = await http.get(
      'https://www.behindthename.com/api/lookup.json?name=$name&key=$apiKey');
  if(response.body == null || response.body.isEmpty) return null;
  return json.decode(response.body);
}

String toFullGenderName(String gender) {
  return gender == "m" ? "Male" : "Female";
}
