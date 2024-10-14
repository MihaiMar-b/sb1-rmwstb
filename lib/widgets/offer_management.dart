import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/offer.dart';
import 'package:brand_creator_collab/services/offer_service.dart';

class OfferManagement extends StatefulWidget {
  const OfferManagement({Key? key}) : super(key: key);

  @override
  _OfferManagementState createState() => _OfferManagementState();
}

class _OfferManagementState extends State<OfferManagement> {
  final OfferService _offerService = OfferService();

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
                  'Offer Management',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                ElevatedButton(
                  onPressed: () {
                    _showAddOfferDialog(context);
                  },
                  child: const Text('Add Offer'),
                ),
              ],
            ),
            const SizedBox(height: 16),
            StreamBuilder<List<Offer>>(
              stream: _offerService.getOffers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                }
                if (!snapshot.hasData || snapshot.data!.isEmpty) {
                  return const Center(child: Text('No offers available.'));
                }
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    final offer = snapshot.data![index];
                    return ListTile(
                      title: Text(offer.title),
                      subtitle: Text(offer.description),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit),
                            onPressed: () {
                              _showEditOfferDialog(context, offer);
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              _showDeleteOfferDialog(context, offer);
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

  void _showAddOfferDialog(BuildContext context) {
    // TODO: Implement add offer dialog
  }

  void _showEditOfferDialog(BuildContext context, Offer offer) {
    // TODO: Implement edit offer dialog
  }

  void _showDeleteOfferDialog(BuildContext context, Offer offer) {
    // TODO: Implement delete offer dialog
  }
}