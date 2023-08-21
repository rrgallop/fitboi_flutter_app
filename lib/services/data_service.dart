import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiService {
  static final ApiService _instance = ApiService._internal();

  factory ApiService() => _instance;

  ApiService._internal();

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/data'));

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      print('request failed: ${response.statusCode}');
    }
  }

  Future<List<dynamic>> fetchWorkoutPrograms() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/workout_programs'));

    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<dynamic>> fetchRecentActivities() async {
    final response = await http.get(Uri.parse('http://10.0.2.2:5000/api/recent_activities'));

    if (response.statusCode == 200){
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load data');
    }
  }
}