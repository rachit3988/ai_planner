import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../core/network/api_client.dart';
import 'chat_state.dart';
import '../tasks/task_model.dart';

class ChatController extends StateNotifier<ChatState> {
  ChatController() : super(const ChatState());

  Future<void> sendMessage(String text) async {
    state = state.copyWith(loading: true, error: null);
    try {
      final data = await apiClient.parseTask(text);
      final tasks = (data['tasks'] as List)
          .map((e) => TaskModel.fromJson(e))
          .toList();
      state = state.copyWith(
        loading: false,
        tasks: tasks,
        questions: List<String>.from(data['questions']),
      );
    } catch (e) {
      state = state.copyWith(loading: false, error: e.toString());
    }
  }
}

final chatControllerProvider =
    StateNotifierProvider<ChatController, ChatState>(
        (ref) => ChatController());
