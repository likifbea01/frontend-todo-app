import 'package:http/http.dart';



class TodoService{
  Future<Response> getAllTodoRequest()async{
    return await get(Uri.parse("https://wandering-calf-lab-coat.cyclic.app"));
  }
}