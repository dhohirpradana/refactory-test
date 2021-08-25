import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/helpers/models/todo_model.dart';

import '../state_store.dart';

class TodoProvider with ChangeNotifier, DiagnosticableTreeMixin {
  int _todoTday = 0;
  List<TodoModel> _listTodo = [];
  int get todoToday => _todoTday;
  List<TodoModel> get listTodo => _listTodo;

  Future<int> task() async {
    final data = await todoDbProvider.fetchTodo();
    _todoTday = data.length;
    notifyListeners();
    return data.length;
  }

  Future<void> addTodo(
      {required String title,
      required String start,
      required String end}) async {
    var _now = DateTime.now();
    // var _cDate = DateTime(2021, 08, 25, 11, 30);
    await todoDbProvider.addTodo(TodoModel(
      _now.millisecondsSinceEpoch,
      1,
      title,
      start,
      end,
      0,
    ));
    notifyListeners();
  }

  Future<void> updateTodo(
      {required int id,
      required String title,
      required String start,
      required String end}) async {
    var _now = DateTime.now();
    // var _cDate = DateTime(2021, 08, 25, 11, 30);
    await todoDbProvider.updateTodo(
        id,
        TodoModel(
          _now.millisecondsSinceEpoch,
          1,
          title,
          start,
          end,
          0,
        ));
    notifyListeners();
  }

  Future<void> deleteTodo({required int id}) async {
    // var _cDate = DateTime(2021, 08, 25, 11, 30);
    await todoDbProvider.deleteTodo(id);
    notifyListeners();
  }

  Future<int> fetchTodo() async {
    final data = await todoDbProvider.fetchTodo();
    _listTodo = data;
    notifyListeners();
    return data.length;
  }

  /// Makes `Counter` readable inside the devtools by listing all of its properties
  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(IntProperty('todoToday', todoToday));
  }
}
