
class TodoItem {
  final String label;
  final int time;
  bool isSelected;
  

  TodoItem({required this.label, this.isSelected = false,required this.time, });
  factory TodoItem.fromJson(Map<String, dynamic> json) {
    return TodoItem(label: json['label'], time: json["time"],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "label":label,
      "time":time
    };
  }
}
