
class TodoItem {
  final String label;
  bool isSelected;
  

  TodoItem({required this.label, this.isSelected = false});
  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(label: json['label'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "label":label
    };
  }
}
