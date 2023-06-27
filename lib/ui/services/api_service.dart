import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/suggestion.dart';

final dio = Dio();

final apiServiceProvider = Provider((ref) => ApiService());

class ApiService {
  Future<Suggestion?> fetchSuggestion(id) async {
    try {
      final response = await dio.get('https://www.boredapi.com/api/activity');
      return Suggestion.fromJson(response.data);
    } on DioException catch (e) {
      print('Error fetching suggestion: $e');
    }
    return null;
  }
}
