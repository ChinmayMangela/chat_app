import 'package:chat_application/common/widgets/custom_text_field.dart';
import 'package:chat_application/features/authentication/domain/end_user.dart';
import 'package:chat_application/features/chats/domain/message.dart';
import 'package:chat_application/features/chats/presentation/widgets/message_sender_button.dart';
import 'package:chat_application/features/chats/presentation/widgets/messages_list.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_name_component.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_picture_component.dart';
import 'package:chat_application/features/chats/services/chats_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({
    super.key,
    required this.user,
  });

  final EndUser user;

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final _messageController = TextEditingController();
  final _chatsService = ChatsService();

  Future<void> _sendMessage() async {
    final message = _messageController.text;

    if (message.isNotEmpty) {
      await _chatsService.sendMessage(
        receiverId: widget.user.id,
        receiverEmail: widget.user.email,
        content: message,
      );
      _messageController.clear();
    }
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Row(
        children: [
          const ProfilePictureComponent(),
          const SizedBox(width: 8),
          ProfileNameComponent(profileName: widget.user.name),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            child: _buildMessagesStream(), // Renamed
          ),
          Row(
            children: [
              Expanded(
                child: CustomTextField(
                  controller: _messageController,
                  hintText: '',
                  isPasswordField: false,
                  obscureText: false,
                ),
              ),
              const SizedBox(width: 7),
              MessageSenderButton(onTap: _sendMessage),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMessagesStream() {
    final senderId = FirebaseAuth.instance.currentUser!.uid;
    return StreamBuilder<List<Message>>(
      stream: _chatsService.fetchMessages(senderId, widget.user.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildCircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return _buildMessage('Error: ${snapshot.error}');
        }
        if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return _buildMessage('You haven\'t started conversation yet');
        } else {
          final messages = snapshot.data!;
          print('Messages: $messages'); // Debug print
          return MessagesList(messages: messages);
        }
      },
    );
  }


  Widget _buildCircularProgressIndicator() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildMessage(String message) {
    return Center(
      child: Text(message),
    );
  }
}
