import 'package:flutter/material.dart';

class DayView extends StatelessWidget {
  const DayView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Today')),
      body: ListView.builder(
        itemCount: 24,
        itemBuilder: (_, i) => Container(
          height: 60,
          decoration: BoxDecoration(
            border: Border(bottom: BorderSide(color: Colors.grey.shade300)),
          ),
          padding: const EdgeInsets.all(8),
          child: Text('$i:00'),
        ),
      ),
    );
  }
}
