
String formatTimeAgo(DateTime time) {
  final diff = DateTime.now().difference(time);
  if (diff.inMinutes < 60) return '${diff.inMinutes}m';
  if (diff.inHours < 24) return '${diff.inHours}h';
  return '${diff.inDays}d';
}

//Alternativa použít balíček intl, ale v tomto případě mi to přijde zbytečné
String formatDateTime(DateTime dateTime) {
  String twoDigits(int n) => n.toString().padLeft(2, '0');
  final day = twoDigits(dateTime.day);
  final month = twoDigits(dateTime.month);
  final year = dateTime.year;
  final hour = twoDigits(dateTime.hour);
  final minute = twoDigits(dateTime.minute);

  return '$hour:$minute $day.$month.$year';
}