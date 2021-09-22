import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {

  //localhost:3000
  //10.0.2.2:3000
  final baseUrl = "http://10.0.2.2:3000";
  Future<List<dynamic>> fetchTodos() async {
    try{
      final response = await get(Uri.parse(baseUrl + "/todos"));
      return jsonDecode(response.body);
    }catch(err) {
      return [];
    }
  }

  patchTodo(Map<String, String> patchObj, int id) async {
    try{
      await patch(Uri.parse(baseUrl + "/todos/$id"), body: patchObj);
      return true;
    }catch(err){
      return false;
    }
  }

  Future<Map> addTodo(Map<String, String> todoObj) async {
    try{
      final response = await post(Uri.parse(baseUrl + "/todos"), body: todoObj);
      return jsonDecode(response.body);
    }catch(err){
      return null;
    }
  }
}