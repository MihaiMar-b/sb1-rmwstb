import 'package:flutter/material.dart';

class OfferDiscovery extends StatelessWidget {
  const OfferDiscovery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Offer Discovery',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                hintText: 'Search offers',
                suffixIcon: IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // TODO: Implement search functionality
                  },
                ),
              ),
            ),
            const SizedBox(height: 16),
            Wrap(
              spacing: 8,
              children: [
                FilterChip(
                  label: const Text('Barter'),
                  onSelected: (bool selected) {
                    // TODO: Implement filter functionality
                  },
                ),
                FilterChip(
                  label: const Text('Partnership'),
                  onSelected: (bool selected) {
                    // TODO: Implement filter functionality
                  },
                ),
                FilterChip(
                  label: const Text('Location'),
                  onSelected: (bool selected) {
                    // TODO: Implement filter functionality
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // TODO: Implement offer list with brief previews and detailed view popups
          ],
        ),
      ),
    );
  }
}