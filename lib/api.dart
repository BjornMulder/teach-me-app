import 'dart:convert';
import 'package:http/http.dart' as http;
import 'models.dart';

class API {
  static Future<List<Topic>> getTopics() async {
    final response = await http.get(Uri.parse('https://teach-me.frb.io/api/topics'));
    
    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((item) => Topic.fromJson(item)).toList();
    } else {
      throw Exception('Failed to load topics');
    }
  }

  static Future<Topic> getTopic(int id) async {
    final response = await http.get(Uri.parse('https://teach-me.frb.io/api/topics/$id'));

    if (response.statusCode == 200) {
      return Topic.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load topic');
    }
  }
}
