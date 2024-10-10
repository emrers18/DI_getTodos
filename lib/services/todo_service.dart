import 'dart:convert';

import 'package:get_todos/model/todo.dart';
import 'package:http/http.dart' as http;

abstract class IService{
  Future<List<Todo>> getTodos();
}

class TodoService extends IService{

  final http.Client httpClient;

  TodoService(this.httpClient);


  @override
  Future<List<Todo>> getTodos() async{
    final urlTodos= Uri.https('jsonplaceholder.typicode.com', 'todos');

    final requestHeaders = <String,String>{
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(urlTodos,headers: requestHeaders);
    final responseBody = response.body;
    final List decodedBody = jsonDecode(responseBody);
    final iterable = decodedBody.map((e)=>Todo.fromJson(e));
    final ListTodos = List<Todo>.from(iterable);

    if(response.statusCode == 200){
      return ListTodos;
    }else{
      throw Exception(
        'Veriler Alınamadı. Hata Kodu: ${response.statusCode}'
      );
    }

  }
}