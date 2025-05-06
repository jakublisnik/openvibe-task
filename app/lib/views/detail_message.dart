import 'package:flutter/material.dart';

import '../helpers/time_format_helpers.dart';
import '../models/message_model.dart';

class DetailMessage extends StatefulWidget {
  const DetailMessage({super.key});

  static const routeName = '/detailMessage';

  @override
  State<DetailMessage> createState() => _DetailMessageState();
}

class _DetailMessageState extends State<DetailMessage> {
  @override
  Widget build(BuildContext context) {
    Message msg = ModalRoute.of(context)?.settings.arguments as Message;
    return Scaffold(
      appBar: AppBar(
        title: Text(msg.nickname),
        backgroundColor: Colors.amberAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
                child: CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.amberAccent,
                    child: Text(msg.icon,
                        style: const TextStyle(fontSize: 50)))),
            const SizedBox(height: 10),
            const Text("Message:", style: TextStyle(fontSize: 20)),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.amberAccent.withOpacity(0.3),
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.all(16.0),
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      msg.message,
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Text(
                      formatDateTime(msg.createdAt),
                      style: const TextStyle(fontSize: 14, color: Colors.black54),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
