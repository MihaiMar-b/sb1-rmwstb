import 'package:flutter/material.dart';
import 'package:brand_creator_collab/models/message.dart';
import 'package:brand_creator_collab/services/messaging_service.dart';
import 'package:provider/provider.dart';
import 'package:brand_creator_collab/services/auth_service.dart';

class MessagingSystem extends StatefulWidget {
  const MessagingSystem({Key? key}) : super(key: key);

  @override
  _MessagingSystemState createState() => _MessagingSystemState();
}

class _MessagingSystemState extends State<MessagingSystem> {
  final MessagingService _messagingService = MessagingService();
  final TextEditingController _messageController = TextEditingController();
  String? _selectedRecipientId;

  @override
  Widget build(BuildContext context) {
    final authService = Provider.of<AuthService>(context, listen: false);
    final currentUserId = authService.currentUser?.uid;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Messaging System',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: _selectedRecipientId,
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRecipientId = newValue;
                });
              },
              items: [
                // TODO: Fetch actual recipients from a service
                const DropdownMenuItem(value: 'recipient1', child: Text('Recipient 1')),
                const DropdownMenuItem(value: 'recipient2', child: Text('Recipient 2')),
              ],
              decoration: const InputDecoration(
                labelText: 'Select Recipient',
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: StreamBuilder<List<Message>>(
                stream: _messagingService.getMessages(currentUserId!),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No messages yet.'));
                  }
                  return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      final message = snapshot.data![index];
                      return ListTile(
                        title: Text(message.senderName),
                        subtitle: Text(message.content),
                        trailing: Text(message.timestamp.toLocal().toString().split(' ')[0]),
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _messageController,
                    decoration: const InputDecoration(
                      hintText: 'Type a message...',
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: () {
                    if (_messageController.text.isNotEmpty && _selectedRecipientId != null) {
                      _messagingService.sendMessage(
                        currentUserId!,
                        _selectedRecipientId!,
                        _messageController.text,
                      );
                      _messageController.clear();
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Please select a recipient and enter a message')),
                      );
                    }
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}