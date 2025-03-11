import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF6C63FF),
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  final List<ChatItem> chatItems = [
    ChatItem("Saved Messages", "Photo", "9:41", Icons.bookmark, false, Colors.blue, 0),
    ChatItem("Yudi Wibisono", "Baik Bapak, Terimakasih 🙏🏻🙏🏻🙏🏻", "9:40", Icons.person, false, Colors.purple, 0),
    ChatItem("Grup Tubes Provis 🔥", "Julian Dwi S: Jangan lupa belajar gaisss!", "9:38", Icons.group, true, Colors.orange, 3),
    ChatItem("Zakiyah Hasanah", "Udah install flutter kan???", "9:32", Icons.person, true, Colors.green, 2),
    ChatItem("Meisya Amalia", "Besok jangan lupa masuk mei ada quiz", "9:25", Icons.person, false, Colors.indigo, 0),
    ChatItem("Provis IK'23", "Yudi Wibisono: Besok kita quiz UI flutter, jangan lupa bawa laptop.", "9:20", Icons.group, true, Colors.pink, 6),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF8F9FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xFF6C63FF),
        title: Text(
          "UPI Chats",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
          IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1),
          child: Container(
            color: Colors.white24,
            height: 1,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 8),
        itemCount: chatItems.length,
        separatorBuilder: (context, index) => Divider(
          height: 1,
          indent: 75,
          endIndent: 20,
          color: Colors.grey.withOpacity(0.2),
        ),
        itemBuilder: (context, index) {
          return ChatTile(chatItem: chatItems[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFF6C63FF),
        child: Icon(Icons.chat_outlined),
        onPressed: () {},
      ),
    );
  }
}

class ChatItem {
  final String name;
  final String message;
  final String time;
  final IconData icon;
  final bool unread;
  final Color avatarColor;
  final int messageCount;

  ChatItem(this.name, this.message, this.time, this.icon, this.unread, this.avatarColor, this.messageCount);
}

class ChatTile extends StatelessWidget {
  final ChatItem chatItem;

  ChatTile({required this.chatItem});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 28,
                    backgroundColor: chatItem.avatarColor,
                    child: Icon(
                      chatItem.icon,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  if (chatItem.unread)
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: 16,
                        height: 16,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: Color(0xFF6C63FF),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                ],
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chatItem.name,
                            style: TextStyle(
                              fontWeight: chatItem.unread ? FontWeight.bold : FontWeight.w500,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        Text(
                          chatItem.time,
                          style: TextStyle(
                            fontSize: 12,
                            color: chatItem.unread ? Color(0xFF6C63FF) : Colors.grey[500],
                            fontWeight: chatItem.unread ? FontWeight.bold : FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 6),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            chatItem.message,
                            style: TextStyle(
                              color: chatItem.unread ? Colors.black87 : Colors.grey[600],
                              fontWeight: chatItem.unread ? FontWeight.w500 : FontWeight.normal,
                              fontSize: 14,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (chatItem.messageCount > 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: Color(0xFF6C63FF),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              chatItem.messageCount.toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}