import 'package:chat_application/common/widgets/custom_text_field.dart';
import 'package:chat_application/features/authentication/domain/end_user.dart';
import 'package:chat_application/features/chats/presentation/widgets/message_sender_button.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_name_component.dart';
import 'package:chat_application/features/chats/presentation/widgets/profile_picture_component.dart';
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

  void _sendMessage() {}

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
          Container(),
          const Spacer(),
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
}
