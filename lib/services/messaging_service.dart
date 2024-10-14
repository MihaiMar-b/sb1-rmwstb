import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:brand_creator_collab/models/message.dart';

class MessagingService {
  final CollectionReference _messagesCollection = FirebaseFirestore.instance.collection('messages');

  Stream<List<Message>> getMessages(String userId) {
    return _messagesCollection
        .where('recipientId', isEqualTo: userId)
        .orderBy('timestamp', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => Message.fromFirestore(doc)).toList();
    });
  }

  Future<void> sendMessage(String senderId, String recipientId, String content) async {
    final senderDoc = await FirebaseFirestore.instance.collection('users').doc(senderId).get();
    final senderName = senderDoc.data()?['name'] ?? 'Unknown';

    return _messagesCollection.add({
      'senderId': senderId,
      'senderName': senderName,
      'recipientId': recipientId,
      'content': content,
      'timestamp': Timestamp.now(),
    });
  }
}