import 'package:chat_application/common/utils/utils.dart';
import 'package:chat_application/features/chats/domain/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatsService {
  final _firebaseFireStore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String receiverId,
    required String receiverEmail,
    required String content,
  }) async {
    // get current-user(sender) details
    final sender = FirebaseAuth.instance.currentUser;
    // get sender id
    final senderId = sender!.uid;

    // crate Message
    final message = Message(
      senderId: senderId,
      receiverId: receiverId,
      receiverEmail: receiverEmail,
      content: content,
      timeStamp: DateTime.now(),
    );

    // create chat rooms reference
    final chatRoomsCollection = _firebaseFireStore.collection('chat_rooms');

    // crate chat room id by combining ids of both users
    final chatRoomId = _getChatRoomId(senderId, receiverId);

    try {
      await chatRoomsCollection.doc(chatRoomId).collection('messages').add(
        message.toJson(),
      );
    } on FirebaseException catch (e) {
      Utils.showSnackBar(e.message);
    }
  }

  String _getChatRoomId(String senderId, String receiverId) {
    final List<String> ids = [senderId, receiverId];
    ids.sort();
    return ids.join('_');
  }

  Stream<List<Message>> fetchMessages(String senderId, String receiverId) {
    final chatRoomId = _getChatRoomId(senderId, receiverId);

    return _firebaseFireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timeStamp', descending: false)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) {
        return Message.fromJson(doc.data(), doc.id);
      }).toList();
    });
  }


  Stream<Message?> fetchLastMessage(
      String senderId, String receiverId) {
    final chatRoomId = _getChatRoomId(senderId, receiverId);
    return _firebaseFireStore
        .collection('chat_rooms')
        .doc(chatRoomId)
        .collection('messages')
        .orderBy('timestamp', descending: true).limit(1)
        .snapshots()
        .map((snapshot) {
      if (snapshot.docs.isNotEmpty) {
        final lastMessage = snapshot.docs.first;
        return Message.fromJson(lastMessage.data(), lastMessage.id);
      } else {
        return null;
      }
    });
  }


}
