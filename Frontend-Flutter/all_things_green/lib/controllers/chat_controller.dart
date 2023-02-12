import 'package:all_things_green/constants/app_constants.dart';
import 'package:all_things_green/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:stream_chat_flutter/stream_chat_flutter.dart';

class ChatController extends GetxController {
  // final client = StreamChatClient(AppConstants.apiKey, logLevel: Level.INFO);
  // late Channel channel;
  // void init () async {
  //   await client.connectUser(
  //     User(id: "1"),
  //     "Farmer",
  //   );
  // channel = client.channel('messaging', id: '1');
  // channel.watch();
  // }
  List<MessageBubble> messages = [
  MessageBubble(message: "Hello, how are you?", date: "Apr 22, 8:59 PM"),
  MessageBubble(message: "I'm doing well, thanks!", date: "Apr 22, 9:01 PM"),
  MessageBubble(message: "What have you been up to?", date: "Apr 22, 9:02 PM"),
  MessageBubble(message: "Not much, just working on some coding projects.", date: "Apr 22, 9:05 PM"),
  MessageBubble(message: "That's cool. What kind of projects?", date: "Apr 22, 9:07 PM"),
  MessageBubble(message: "Mainly building mobile apps with Flutter.", date: "Apr 22, 9:10 PM"),
  MessageBubble(message: "Wow, I've heard good things about Flutter. It must be challenging but rewarding.", date: "Apr 22, 9:15 PM"),
];
}