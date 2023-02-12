import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  const MessageBubble({Key? key, required this.message, required this.date }) : super(key: key);
  final String message;
  final String date;
  @override
  Widget build(BuildContext context) {
    final isReceiver = true;
    return Row(
      mainAxisAlignment: isReceiver ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Flexible(
          child: Column(
            crossAxisAlignment: isReceiver ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                constraints: const BoxConstraints(
                  maxWidth: 275,
                ),
                decoration: BoxDecoration(
                  color: isReceiver ? Colors.green : Colors.blue,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  message,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                date,
                style: TextStyle(
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        if (!isReceiver) const SizedBox(width: 12),
      ],
    );
  }
}