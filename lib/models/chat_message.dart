import 'package:meta/meta.dart';

enum MessageType{ receiver, sender }

class ChatMessage{
  ChatMessage({required this.messageContent, required this.messageType});
  String messageContent;
  MessageType messageType;
}
