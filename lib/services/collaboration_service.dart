import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/collaboration.dart';

class CollaborationService {
  final CollectionReference _collaborationsCollection = FirebaseFirestore.instance.collection('collaborations');

  Stream<List<Collaboration>> getCollaborations() {
    return _collaborationsCollection
        .where('status', isEqualTo: 'active')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Collaboration.fromFirestore(doc)).toList();
    });
  }

  Future<void> submitReview(String collaborationId, double rating, String comment) {
    return _collaborationsCollection.doc(collaborationId).update({
      'review': {
        'rating': rating,
        'comment': comment,
        'timestamp': Timestamp.now(),
      }
    });
  }

  Future<void> markAsCompleted(Collaboration collaboration) {
    return _collaborationsCollection.doc(collaboration.id).update({
      'status': 'completed',
      'endDate': Timestamp.now(),
    });
  }
}