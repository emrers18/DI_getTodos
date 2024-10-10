import 'package:get_it/get_it.dart';
import 'package:get_todos/services/todo_service.dart';
import 'package:http/http.dart' as http;

final GetIt getIt = GetIt.instance;

void setupLocator(){
  getIt.registerLazySingleton<http.Client>(
    ()=> http.Client(),
  );


  getIt.registerLazySingleton<IService>(
    ()=> TodoService(getIt<http.Client>()),
  );
}