class Message {
  final String senderId;
  final String receiverId;
  final String content;
  final DateTime timeStamp;

  const Message({
    required this.senderId,
    required this.receiverId,
    required this.content,
    required this.timeStamp,
  });

  factory Message.fromJson(Map<String, dynamic> data, String docId) {
    return Message(
      senderId: data['senderId'],
      receiverId: data['receiverId'],
      content: data['content'],
      timeStamp: DateTime.parse(data['timeStamp']),
    );
  }
  
  Map<String, dynamic> toJson() {
    return {
      'senderId': senderId,
      'receiverId': receiverId,
      'content': content,
      'timeStamp': timeStamp.toIso8601String(),
    };
  }
}
