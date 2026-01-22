class ChatMessage {
  final String id;
  final String role;
  final String content;
  final String createdAt;
  final String? relatedTaskId;

  ChatMessage({
    required this.id,
    required this.role,
    required this.content,
    required this.createdAt,
    this.relatedTaskId,
  });

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      role: json['role'],
      content: json['content'],
      createdAt: json['created_at'],
      relatedTaskId: json['related_task_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'role': role,
      'content': content,
      'created_at': createdAt,
      'related_task_id': relatedTaskId,
    };
  }
}
