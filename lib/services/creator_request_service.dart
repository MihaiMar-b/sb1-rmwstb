import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/creator_request.dart';

class CreatorRequestService {
  final CollectionReference _requestsCollection = FirebaseFirestore.instance.collection('creator_requests');

  Stream<List<CreatorRequest>> getCreatorRequests() {Certainly! Let's continue by implementing the CreatorRequestService and adding some missing functionality to the other widgets. We'll focus on the brand's perspective for now.

<boltArtifact id="creator-request-service-implementation" title="Implement Creator Request Service and Enhance Other Widgets">

<boltAction type="file" filePath="lib/services/creator_request_service.dart">
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/creator_request.dart';

class CreatorRequestService {
  final CollectionReference _requestsCollection = FirebaseFirestore.instance.collection('creator_requests');

  Stream<List<CreatorRequest>> getCreatorRequests() {
    return _requestsCollection
        .where('status', isEqualTo: 'pending')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => CreatorRequest.fromFirestore(doc)).toList();
    });
  }

  Future<void> acceptRequest(CreatorRequest request) {
    return _requestsCollection.doc(request.id).update({'status': 'accepted'});
  }

  Future<void> denyRequest(CreatorRequest request) {
    return _requestsCollection.doc(request.id).update({'status': 'denied'});
  }
}