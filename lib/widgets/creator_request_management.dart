import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/creator_request.dart';
import 'package:brand_creator_collab/services/creator_request_service.dart';

class CreatorRequestManagement extends StatefulWidget {
  const CreatorRequestManagement({Key? key}) : super(key: key);

  @override
  _CreatorRequestManagementState createState() => _CreatorRequestManagementState();
}

class _CreatorRequestManagementState extends State<CreatorRequestManagement> {
  final CreatorRequestService _requestService = CreatorRequestService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Creator Request Management',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<CreatorRequest>>(
              stream: _requestService.getCreatorRequests(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No pending requests.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final request = snapshot.data![index];
                    return ListTile(
                      title: Text(request.creatorName),
                      subtitle: Text(request.offerTitle),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.check),
                            onPressed: () {
                              _acceptRequest(request);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.close),
                            onPressed: () {
                              _denyRequest(request);
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

  void _acceptRequest(CreatorRequest request) async {
    try {
      await _requestService.acceptRequest(request);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Request from ${request.creatorName} accepted')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error accepting request: $e')),
      );
    }
  }

  void _denyRequest(CreatorRequest request) async {
    try {
      await _requestService.denyRequest(request);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Request from ${request.creatorName} denied')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error denying request: $e')),
      );
    }
  }
}