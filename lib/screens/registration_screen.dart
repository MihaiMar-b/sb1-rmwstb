import 'package:flutter/material.dart';

class MessagingSystem extends StatelessWidget {
  const MessagingSystem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Messaging System',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            // TODO: Implement messaging list and functionality
            const Text('No messages yet.'),
          ],
        ),
      ),
    );
  }
}