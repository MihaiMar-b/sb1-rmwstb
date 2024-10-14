import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/venue.dart';
import 'package:brand_creator_collab/services/venue_service.dart';

class VenueManagement extends StatefulWidget {
  const VenueManagement({Key? key}) : super(key: key);

  @override
  _VenueManagementState createState() => _VenueManagementState();
}

class _VenueManagementState extends State<VenueManagement> {
  final VenueService _venueService = VenueService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Venue Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAddVenueDialog(context);
                  },
                  child: const Text('Add Venue'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<Venue>>(
              stream: _venueService.getVenues(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No venues added yet.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final venue = snapshot.data![index];
                    return ListTile(
                      title: Text(venue.name),
                      subtitle: Text(venue.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditVenueDialog(context, venue);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteVenueDialog(context, venue);
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

  void _showAddVenueDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _websiteController = TextEditingController();
    final _phoneController = TextEditingController();
    final _tagsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Venue'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _websiteController,
                    decoration: constCertainly! Let's continue by implementing the remaining functionality for the VenueManagement widget and create the necessary models and services for the CreatorRequestManagement widget.

<boltArtifact id="venue-and-creator-request-implementation" title="Implement Venue Management and Creator Request Management">

<boltAction type="file" filePath="lib/widgets/venue_management.dart">
import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/venue.dart';
import 'package:brand_creator_collab/services/venue_service.dart';

class VenueManagement extends StatefulWidget {
  const VenueManagement({Key? key}) : super(key: key);

  @override
  _VenueManagementState createState() => _VenueManagementState();
}

class _VenueManagementState extends State<VenueManagement> {
  final VenueService _venueService = VenueService();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Venue Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAddVenueDialog(context);
                  },
                  child: const Text('Add Venue'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<Venue>>(
              stream: _venueService.getVenues(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Text('No venues added yet.');
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final venue = snapshot.data![index];
                    return ListTile(
                      title: Text(venue.name),
                      subtitle: Text(venue.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditVenueDialog(context, venue);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteVenueDialog(context, venue);
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

  void _showAddVenueDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController();
    final _descriptionController = TextEditingController();
    final _websiteController = TextEditingController();
    final _phoneController = TextEditingController();
    final _tagsController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Add Venue'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _websiteController,
                    decoration: const InputDecoration(labelText: 'Website'),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  TextFormField(
                    controller: _tagsController,
                    decoration: const InputDecoration(labelText: 'Tags (comma-separated)'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Add'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final newVenue = Venue(
                    id: '',
                    name: _nameController.text,
                    description: _descriptionController.text,
                    website: _websiteController.text,
                    phone: _phoneController.text,
                    tags: _tagsController.text.split(',').map((e) => e.trim()).toList(),
                  );
                  _venueService.addVenue(newVenue);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showEditVenueDialog(BuildContext context, Venue venue) {
    final _formKey = GlobalKey<FormState>();
    final _nameController = TextEditingController(text: venue.name);
    final _descriptionController = TextEditingController(text: venue.description);
    final _websiteController = TextEditingController(text: venue.website);
    final _phoneController = TextEditingController(text: venue.phone);
    final _tagsController = TextEditingController(text: venue.tags.join(', '));

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Edit Venue'),
          content: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(labelText: 'Name'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a name';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _descriptionController,
                    decoration: const InputDecoration(labelText: 'Description'),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a description';
                      }
                      return null;
                    },
                  ),
                  TextFormField(
                    controller: _websiteController,
                    decoration: const InputDecoration(labelText: 'Website'),
                  ),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone'),
                  ),
                  TextFormField(
                    controller: _tagsController,
                    decoration: const InputDecoration(labelText: 'Tags (comma-separated)'),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Save'),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  final updatedVenue = Venue(
                    id: venue.id,
                    name: _nameController.text,
                    description: _descriptionController.text,
                    website: _websiteController.text,
                    phone: _phoneController.text,
                    tags: _tagsController.text.split(',').map((e) => e.trim()).toList(),
                    location: venue.location,
                  );
                  _venueService.updateVenue(updatedVenue);
                  Navigator.of(context).pop();
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showDeleteVenueDialog(BuildContext context, Venue venue) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete Venue'),
          content: Text('Are you sure you want to delete ${venue.name}?'),
          actions: [
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text('Delete'),
              onPressed: () {
                _venueService.deleteVenue(venue.id);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}