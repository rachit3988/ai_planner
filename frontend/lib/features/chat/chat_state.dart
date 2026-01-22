import '../tasks/task_model.dart';

class ChatState {
  final bool loading;
  final List<TaskModel> tasks;
  final List<String> questions;
  final String? error;

  const ChatState({
    this.loading = false,
    this.tasks = const [],
    this.questions = const [],
    this.error,
  });

  ChatState copyWith({
    bool? loading,
    List<TaskModel>? tasks,
    List<String>? questions,
    String? error,
  }) {
    return ChatState(
      loading: loading ?? this.loading,
      tasks: tasks ?? this.tasks,
      questions: questions ?? this.questions,
      error: error,
    );
  }
}
