import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/collaboration.dart';
import 'package:brand_creator_collab/services/collaboration_service.dart';

class CollaborationTools extends StatefulWidget {
  const CollaborationTools({Key? key}) : super(key: key);

  @override
  _CollaborationToolsState createState() => _CollaborationToolsState();
}

class _CollaborationToolsState extends State<CollaborationTools> {
  final CollaborationService _collaborationService = CollaborationService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Collaboration Tools',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<Collaboration>>(
              stream: _collaborationService.getCollaborations(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No active collaborations.'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final collaboration = snapshot.data![index];
                    return ListTile(
                      title: Text(collaboration.creatorName),
                      subtitle: Text(collaboration.offerTitle),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.rate_review),
                            onPressed: () {
                              _showReviewDialog(context, collaboration);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.check_circle),
                            onPressed: () {
                              _markAsCompleted(collaboration);
                            },
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // ... (rest of the methods remain the same)
}