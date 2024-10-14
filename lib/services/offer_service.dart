import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/offer.dart';

class OfferService {
  final CollectionReference _offersCollection = FirebaseFirestore.instance.collection('offers');

  Stream<List<Offer>> getOffers() {
    return _offersCollection
        .where('expiresAt', isGreaterThan: Timestamp.now())
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Offer.fromFirestore(doc)).toList();
    });
  }

  Future<void> addOffer(Offer offer) {
    return _offersCollection.add(offer.toMap());
  }

  Future<void> updateOffer(Offer offer) {
    return _offersCollection.doc(offer.id).update(offer.toMap());
  }

  Future<void> deleteOffer(String offerId) {
    return _offersCollection.doc(offerId).delete();
  }
}