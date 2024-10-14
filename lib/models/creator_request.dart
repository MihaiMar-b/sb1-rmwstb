import 'package:cloud_firestore/cloud_firestore.dart';

class CreatorRequest {
  final String id;
  final String creatorId;
  final String creatorName;
  final String offerId;
  final String offerTitle;
  final String status;
  final DateTime timestamp;

  CreatorRequest({
    required this.id,
    required this.creatorId,
    required this.creatorName,
    required this.offerId,
    required this.offerTitle,
    required this.status,
    required this.timestamp,
  });

  factory CreatorRequest.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return CreatorRequest(
      id: doc.id,
      creatorId: data['creatorId'] ?? '',
      creatorName: data['creatorName'] ?? '',
      offerId: data['offerId'] ?? '',
      offerTitle: data['offerTitle'] ?? '',
      status: data['status'] ?? '',
      timestamp: (data['timestamp'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creatorId': creatorId,
      'creatorName': creatorName,
      'offerId': offerId,
      'offerTitle': offerTitle,
      'status': status,
      'timestamp': Timestamp.fromDate(timestamp),
    };
  }
}