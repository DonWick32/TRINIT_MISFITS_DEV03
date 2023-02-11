// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:all_things_green/controllers/chat_controller.dart';
import 'package:get/get.dart';

class ChatPage extends GetView<ChatController> {
  const ChatPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        body: Container(
        child: SafeArea(
          child: Container(),
          ),
        ),
      ),
    );
  }
}


