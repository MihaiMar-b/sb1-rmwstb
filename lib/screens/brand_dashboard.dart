import 'package:flutter/material.dart';
import 'package:brand_creator_collab/widgets/venue_management.dart';
import 'package:brand_creator_collab/widgets/creator_request_management.dart';
import 'package:brand_creator_collab/widgets/collaboration_tools.dart';
import 'package:brand_creator_collab/widgets/messaging_system.dart';
import 'package:brand_creator_collab/services/auth_service.dart';
import 'package:provider/provider.dart';

class BrandDashboard extends StatelessWidget {
  const BrandDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Brand Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () async {
              await authService.signOut();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  // TODO: Implement edit profile functionality
                },
                child: const Text('Edit Profile'),
              ),
              const SizedBox(height: 16),
              const VenueManagement(),
              const SizedBox(height: 16),
              const CreatorRequestManagement(),
              const SizedBox(height: 16),
              const CollaborationTools(),
              const SizedBox(height: 16),
              const MessagingSystem(),
            ],
          ),
        ),
      ),
    );
  }
}