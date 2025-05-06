import 'package:flutter/material.dart';

import '../helpers/time_format_helpers.dart';
import '../models/message_model.dart';
import '../services/message_service.dart';

class ListOfMessages extends StatefulWidget {
  const ListOfMessages({super.key});

  @override
  State<ListOfMessages> createState() => _ListOfMessagesState();
}

class _ListOfMessagesState extends State<ListOfMessages> {
  final List<Message> _messages = [];
  late MessageService _service;

  @override
  void initState() {
    super.initState();

    _service = MessageService();
    _service.addListener((message) {
      setState(() {
        _messages.add(message);
      });
    });
    _service.requestMessages("id", 15);
  }

  @override
  void dispose() {
    _service.removeListener((message) {
      setState(() {
        _messages.add(message);
      });
    });
    _service.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("OpenVibe-task"),
        backgroundColor: Colors.amberAccent,
      ),
      body: ListView.builder(
        itemCount: _messages.length,
        itemBuilder: (context, index) {
          final msg = _messages[index];
          return ListTile(
            leading: Text(msg.icon, style: const TextStyle(fontSize: 40,)),
            title: Text(msg.nickname, style: const TextStyle(fontSize: 20,)),
            subtitle: Text(msg.message, style: const TextStyle(fontSize: 15,)),
            trailing: Text(formatTimeAgo(msg.createdAt), style: const TextStyle(fontSize: 14,)),
            onTap: () {
              Navigator.pushNamed(context, '/detailMessage', arguments: msg);
            },
          );
        },
      ),
    );
  }

}
