import 'package:flutter/material.dart';

class ParticipationWorkflow extends StatelessWidget {
  const ParticipationWorkflow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Participation Workflow',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement apply for offers functionality
              },
              child: const Text('Apply for Offers'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement upload completed work functionality
              },
              child: const Text('Upload Completed Work'),
            ),
          ],
        ),
      ),
    );
  }
}