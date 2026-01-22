class Task {
  final String id;
  final String title;
  final String priority;
  final String status;
  final String plannedDate;

  Task({
    required this.id,
    required this.title,
    required this.priority,
    required this.status,
    required this.plannedDate,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['title'],
      priority: json['priority'],
      status: json['status'],
      plannedDate: json['planned_date'],
    );
  }
}
