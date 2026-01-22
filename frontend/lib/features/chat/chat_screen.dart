import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'chat_controller.dart';
import '../tasks/task_preview_card.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(chatControllerProvider);
    final controller = ref.read(chatControllerProvider.notifier);
    final textCtrl = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('AI Planner')),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                if (state.loading)
                  const Center(child: CircularProgressIndicator()),
                if (state.error != null)
                  Text(state.error!, style: const TextStyle(color: Colors.red)),
                for (final q in state.questions)
                  Text('AI: $q', style: const TextStyle(fontStyle: FontStyle.italic)),
                for (final t in state.tasks)
                  TaskPreviewCard(task: t),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8),
            child: Row(
              children: [
                Expanded(
                  child: TextField(controller: textCtrl),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () => controller.sendMessage(textCtrl.text),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
