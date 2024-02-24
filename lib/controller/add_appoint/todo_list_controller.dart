import 'package:get/get.dart';

class TodoItem {
  final String label;
  bool isSelected;

  TodoItem({required this.label, this.isSelected = false});
}

abstract class TodoListController extends GetxController {
  void toggleCheckbox(int index);
  void selectedTodo(String value);
}

class TodoListControllerImp extends TodoListController {
  List<TodoItem> todoItems = <TodoItem>[
    TodoItem(label: 'Hair'),
    TodoItem(label: 'Face Cereame'),
    TodoItem(label: 'Option 3'),
    TodoItem(label: 'Option 4'),
    TodoItem(label: 'Option 5'),
  ];

  List todoList = [];

  @override
  void toggleCheckbox(int index) {
    todoItems[index].isSelected = !todoItems[index].isSelected;
    update();
  }

  @override
  void selectedTodo(String value) {
    if (!todoList.contains(value)) {
      todoList.add(value);
      print(' exists in the list.........$todoList');
    } else {
      todoList.remove(value);
      print(' does not exist in the list or the list is null......$todoList');
    }
    update();
  }
}
