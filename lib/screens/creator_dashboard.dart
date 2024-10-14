import 'package:flutter/material.dart';
import 'package:brand_creator_collab/widgets/creator_profile_management.dart';
import 'package:brand_creator_collab/widgets/offer_discovery.dart';
import 'package:brand_creator_collab/widgets/participation_workflow.dart';
import 'package:brand_creator_collab/widgets/messaging_system.dart';
import 'package:brand_creator_collab/services/auth_service.dart';
import 'package:provider/provider.dart';

class CreatorDashboard extends StatelessWidget {
  const CreatorDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Creator Dashboard'),
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
            children: const [
              CreatorProfileManagement(),
              SizedBox(height: 16),
              OfferDiscovery(),
              SizedBox(height: 16),
              ParticipationWorkflow(),
              SizedBox(height: 16),
              SizedBox(
                height: 400, // Adjust this value as needed
                child: MessagingSystem(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}