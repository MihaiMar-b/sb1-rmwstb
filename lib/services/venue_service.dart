import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/venue.dart';

class VenueService {
  final CollectionReference _venuesCollection = FirebaseFirestore.instance.collection('venues');

  Stream<List<Venue>> getVenues() {
    return _venuesCollection.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Venue.fromFirestore(doc)).toList();
    });
  }

  Future<void> addVenue(Venue venue) {
    return _venuesCollection.add(venue.toMap());
  }

  Future<void> updateVenue(Venue venue) {
    return _venuesCollection.doc(venue.id).update(venue.toMap());
  }

  Future<void> deleteVenue(String venueId) {
    return _venuesCollection.doc(venueId).delete();
  }
}