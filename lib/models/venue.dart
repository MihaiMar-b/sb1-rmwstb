import 'package:cloud_firestore/cloud_firestore.dart';

class Venue {
  final String id;
  final String name;
  final String description;
  final String? website;
  final String? phone;
  final List<String> tags;
  final GeoPoint? location;

  Venue({
    required this.id,
    required this.name,
    required this.description,
    this.website,
    this.phone,
    required this.tags,
    this.location,
  });

  factory Venue.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data() as Map<String, dynamic>;
    return Venue(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'] ?? '',
      website: data['website'],
      phone: data['phone'],
      tags: List<String>.from(data['tags'] ?? []),
      location: data['location'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'website': website,
      'phone': phone,
      'tags': tags,
      'location': location,
    };
  }
}