import 'dart:math';

class Message {
  Message(
    this.id,
    this.message,
    this.nickname,
    this.icon,
    this.createdAt,
  );

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      json['id'] as String,
      json['message'] as String,
      json['nickname'] as String,
      json['icon'] as String,
      DateTime.fromMillisecondsSinceEpoch(json['createdAt'] as int),
    );
  }

  final String id;
  final String message;
  final String nickname;
  final String icon;
  final DateTime createdAt;

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'nickname': nickname,
      'icon': icon,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }
}

List<Message> createRandomMessages(int length) {
  final messages = <Message>[];
  for (var i = 0; i < length; i++) {
    messages.add(
      Message(
        _randomId(),
        _randomMessage(),
        _randomNickname(),
        _randomProfileIcon(),
        _randomDateTime(),
      ),
    );
  }
  return messages;
}

String _randomId() {
  final random = Random();
  final id = StringBuffer();
  for (var i = 0; i < 16; i++) {
    id.write(random.nextInt(10));
  }
  return id.toString();
}

String _randomMessage() {
  final messages = [
    'Hello',
    'Hi',
    'How are you?',
    'I am fine',
    'What are you doing?',
    'I am doing nothing',
    'What is your name?',
    'My name is Dart Frog',
    'What is your favorite color?',
    'My favorite color is green',
    'What is your favorite programming language?',
    'My favorite programming language is Dart',
    'What is your favorite framework?',
    'My favorite framework is Flutter',
    'What is your favorite IDE?',
    'My favorite IDE is VS Code',
    'What is your favorite operating system?',
    'My favorite operating system is Linux',
  ];
  return messages[Random().nextInt(messages.length)];
}

String _randomProfileIcon() {
  final icons = [
    '🐦',
    '🐸',
    '🐍',
    '🐙',
    '🐳',
    '🐬',
    '🐟',
    '🐠',
    '🐡',
    '🦈',
    '🐊',
    '🐅',
    '🐆',
  ];

  return icons[Random().nextInt(icons.length)];
}

DateTime _randomDateTime() {
  final now = DateTime.now();
  final random = Random();
  final randomDuration = Duration(
    days: random.nextInt(365),
    hours: random.nextInt(24),
    minutes: random.nextInt(60),
    seconds: random.nextInt(60),
  );
  return now.subtract(randomDuration);
}

String _randomNickname() {
  final nicknames = [
    'PizzaMan',
    'BurgerWoman',
    'SushiBoy',
    'SushiGirl',
    'SushiMan',
    'SushiWoman',
    'SpaghettiBoy',
    'SpaghettiGirl',
  ];
  return nicknames[Random().nextInt(nicknames.length)];
}
