import 'dart:convert';
import 'package:web_socket_channel/web_socket_channel.dart';

import '../models/message_model.dart';

class MessageService {
  static final MessageService _instance = MessageService._internal();
  final _channel = WebSocketChannel.connect(
    Uri.parse('ws://192.168.0.107:8080'), //pracuji na fyzickém zařízení, pro simulátor změnit na localhost
  );

  final List<void Function(Message message)> _listeners = [];

  factory MessageService() {
    return _instance;
  }

  MessageService._internal() {
    _channel.stream.listen((data) {
      final parsed = jsonDecode(data);

      if (parsed is List) {
        for (final item in parsed) {
          if (item is Map<String, dynamic>) {
            final message = Message.fromJson(item);
            for (final listener in _listeners) {
              listener(message);
            }
          }
        }
      } else {
        throw Exception('Unexpected data format: $parsed');
      }
    });
  }

  void addListener(void Function(Message message) listener) {
    _listeners.add(listener);
  }

  void removeListener(void Function(Message message) listener) {
    _listeners.remove(listener);
  }

  void requestMessages(String requestId, int amount) {
    final request = jsonEncode(['get', requestId, amount]);
    _channel.sink.add(request);
  }

  void dispose() {
    _channel.sink.close();
  }
}