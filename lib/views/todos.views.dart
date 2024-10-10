import 'package:flutter/material.dart';
import 'package:get_todos/services/todo_service.dart';
import 'package:get_todos/views/widgets/api_error_widget.dart';
import 'package:get_todos/views/widgets/appbar_widget.dart';
import 'package:get_todos/views/widgets/loading_widget.dart';
import 'package:get_todos/views/widgets/success_posts.dart';

import '../core/di/di.dart';
import '../model/todo.dart';

class TodosView extends StatefulWidget {
  const TodosView({super.key});

  @override
  State<TodosView> createState() => _TodosViewState();
}

class _TodosViewState extends State<TodosView> {

  final IService _todoService = getIt<IService>();

  late Future<List<Todo>> _future;

  @override
  void initState() {
    super.initState();

    _future = _todoService.getTodos();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const AppBarWidget(
        appTitle: 'Todos',
        ),

        body: FutureBuilder<List<Todo>>(
          future: _future, 
          builder: (context,snapshot){

            if(snapshot.hasData){
              return SuccessTodos(
                todos: snapshot.data
                );
              }
              else if(snapshot.hasError){
                return ApiErrorWidget(
                  errorMessage: 'Veriler Alınamadı. Hata Mesajı: ${snapshot.error}'
                  );
              }
              else{
                return const LoadingWidget(
                  text: 'Veriler Yükleniyor..',
                  );
              }

          }),
    );
  }
}