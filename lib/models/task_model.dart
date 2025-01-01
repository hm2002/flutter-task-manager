class TaskModel {
  int? id;
  String title;
  String description;
  bool isCompleted;
  DateTime date; // Add this for date
  int priority; // Add this for priority

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    this.isCompleted = false,
    required this.date,
    required this.priority,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'isCompleted': isCompleted ? 1 : 0,
      'date': date.toIso8601String(),
      'priority': priority,
    };
  }

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      isCompleted: map['isCompleted'] == 1,
      date: DateTime.parse(map['date']),
      priority: map['priority'],
    );
  }
}
