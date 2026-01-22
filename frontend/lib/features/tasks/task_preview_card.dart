import 'package:flutter/material.dart';
import '../../core/network/api_client.dart';
import 'task_model.dart';

class TaskPreviewCard extends StatefulWidget {
  final TaskModel task;
  const TaskPreviewCard({super.key, required this.task});

  @override
  State<TaskPreviewCard> createState() => _TaskPreviewCardState();
}

class _TaskPreviewCardState extends State<TaskPreviewCard> {
  int hour = 9;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.task.title, style: Theme.of(context).textTheme.titleMedium),
            Text(widget.task.description),
            DropdownButton<int>(
              value: hour,
              items: List.generate(
                24,
                (i) => DropdownMenuItem(value: i, child: Text('$i:00')),
              ),
              onChanged: (v) => setState(() => hour = v!),
            ),
            ElevatedButton(
              onPressed: () async {
                await apiClient.confirmTask({
                  'task': {
                    'title': widget.task.title,
                    'description': widget.task.description,
                    'estimated_minutes': widget.task.estimatedMinutes,
                    'category_id': 1,
                    'scheduled_hour': hour,
                  }
                });
                if (context.mounted) {
                  Navigator.pushNamed(context, '/calendar');
                }
              },
              child: const Text('Confirm'),
            ),
          ],
        ),
      ),
    );
  }
}
