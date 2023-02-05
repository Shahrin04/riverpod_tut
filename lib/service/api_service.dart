import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_tut/model/suggestion_model.dart';

final apiServiceProvider = Provider<ApiService>((ref) => ApiService());

class ApiService{
  String siteName = 'boredapi.com';


  Future<SuggestionModel> getSuggestion(String id)async{
    try {
      var url = Uri.https(siteName, 'api/activity');
      var suggestion = await http.get(url);
      return SuggestionModel.fromJson(jsonDecode(suggestion.body));
    } on Exception catch (e) {
      throw Exception('Exception: ${e.toString()}');
    }
  }

}

