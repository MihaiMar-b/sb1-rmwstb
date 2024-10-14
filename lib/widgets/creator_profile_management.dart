import 'package:flutter/material.dart';

class CreatorProfileManagement extends StatelessWidget {
  const CreatorProfileManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Profile Management',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement edit profile functionality
              },
              child: const Text('Edit Profile'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Implement manage portfolio functionality
              },
              child: const Text('Manage Portfolio'),
            ),
          ],
        ),
      ),
    );
  }
}