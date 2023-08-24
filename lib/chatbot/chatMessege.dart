enum ChatType { bot, user }

class ChatMessage {
  String? message;
  ChatType? type;

  ChatMessage({required this.message, required this.type});
}
