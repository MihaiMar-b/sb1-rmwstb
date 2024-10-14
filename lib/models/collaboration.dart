import 'package:cloud_firestore/cloud_firestore.dart';

class Collaboration {
  final String id;
  final String creatorId;
  final String creatorName;
  final String brandId;
  final String brandName;
  final String offerId;
  final String offerTitle;
  final String status;
  final DateTime startDate;
  final DateTime? endDate;

  Collaboration({
    required this.id,
    required this.creatorId,
    required this.creatorName,
    required this.brandId,
    required this.brandName,
    required this.offerId,
    required this.offerTitle,
    required this.status,
    required this.startDate,
    this.endDate,
  });

  factory Collaboration.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Collaboration(
      id: doc.id,
      creatorId: data['creatorId'] ?? '',
      creatorName: data['creatorName'] ?? '',
      brandId: data['brandId'] ?? '',
      brandName: data['brandName'] ?? '',
      offerId: data['offerId'] ?? '',
      offerTitle: data['offerTitle'] ?? '',
      status: data['status'] ?? '',
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: data['endDate'] != null ? (data['endDate'] as Timestamp).toDate() : null,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'creatorId': creatorId,
      'creatorName': creatorName,
      'brandId': brandId,
      'brandName': brandName,
      'offerId': offerId,
      'offerTitle': offerTitle,
      'status': status,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': endDate != null ? Timestamp.fromDate(endDate!) : null,
    };
  }
}