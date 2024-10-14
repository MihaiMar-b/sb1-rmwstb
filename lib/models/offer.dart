import 'package:cloud_firestore/cloud_firestore.dart';

class Offer {
  final String id;
  final String brandId;
  final String title;
  final String description;
  final List<String> tags;
  final String type; // e.g., 'barter', 'partnership'
  final DateTime createdAt;
  final DateTime expiresAt;

  Offer({
    required this.id,
    required this.brandId,
    required this.title,
    required this.description,
    required this.tags,
    required this.type,
    required this.createdAt,
    required this.expiresAt,
  });

  factory Offer.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Offer(
      id: doc.id,
      brandId: data['brandId'] ?? '',
      title: data['title'] ?? '',
      description: data['description'] ?? '',
      tags: List<String>.from(data['tags'] ?? []),
      type: data['type'] ?? '',
      createdAt: (data['createdAt'] as Timestamp).toDate(),
      expiresAt: (data['expiresAt'] as Timestamp).toDate(),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'brandId': brandId,
      'title': title,
      'description': description,
      'tags': tags,
      'type': type,
      'createdAt': Timestamp.fromDate(createdAt),
      'expiresAt': Timestamp.fromDate(expiresAt),
    };
  }
}