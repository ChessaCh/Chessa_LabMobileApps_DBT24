class Contact {
  final String name;
  final String lastMessage;
  final String time;
  final String avatarUrl;
  final bool isOnline;

  Contact({
    required this.name,
    required this.lastMessage,
    required this.time,
    required this.avatarUrl,
    this.isOnline = false,
  });
}
