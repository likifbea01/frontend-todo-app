

import 'dart:convert';

import 'package:http/http.dart';

import 'package:todo_app/services/todoServices.dart';


class TodoController{
  final TodoService _todoService =TodoService();

  Future<Todo?> getAllTodoRequest() async{
    Todo? _todo;
    await _todoService.getAllTodoRequest().then((response){
    int statusCode = response.statusCode;
    if (statusCode ==200) {
      _todo =Todo.fromJson(Json.decode(response.body));
    } else {
      _todo= null;
    }
  }).catchError((onError){
    _todo = null;
  });
  return _todo;
  }
}