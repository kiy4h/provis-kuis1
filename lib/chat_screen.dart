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
        primaryColor: Color(0xFF4A148C), // Deep purple from ChatScreen
        scaffoldBackgroundColor: Color(0xFFF8F9FA),
        fontFamily: 'Poppins',
        appBarTheme: AppBarTheme(
          elevation: 0,
          color: Color(0xFF4A148C),
        ),
      ),
      home: Chatting(),
    );
  }
}

class Chatting extends StatelessWidget {
  final List<Message> messages = [
    Message("Julian Dwi S", "Jangan lupa belajar gaisss!", "9.38", false,
        0xFFFF9800),
    Message("Arya Jagadditha", "Aman jul, tenang aja 🫡", "9:40", false,
        0xFFE91E63),
    Message("Me", "Install flutter juga jangan lupa gaiss", "9.42", true,
        0xFF4A148C),
    Message("Meisya Amalia", "Okay!", "10:28", false, 0xFF009688),
    Message("Rexy Putra", "Semangat semangat", "9.42", false, 0xFF3F51B5),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF4A148C), // Deep purple
        elevation: 0,
        title: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Color(0xFF7E57C2).withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.group,
                color: Color(0xFF7E57C2),
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Grup Tubes Provis 🔥",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFEDE7F6),
                  ),
                ),
                Text(
                  "5 participants",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFEDE7F6).withOpacity(0.8),
                  ),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.video_call, size: 26, color: Color(0xFFEDE7F6)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.call, size: 22, color: Color(0xFFEDE7F6)),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.more_vert, color: Color(0xFFEDE7F6)),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          color: Color(0xFFF8F9FA), // Light background color
          image: DecorationImage(
            image: AssetImage('images/cat.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withAlpha(150), BlendMode.lighten),
          ),
        ),
        child: Column(
          children: [
            // Date banner
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(150),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                "Today, March 11",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final isFirstMessageFromUser = index == 0 ||
                      messages[index].sender != messages[index - 1].sender;
                  return ChatBubble(
                    message: messages[index],
                    showAvatar: isFirstMessageFromUser && !messages[index].isMe,
                    showName: isFirstMessageFromUser && !messages[index].isMe,
                  );
                },
              ),
            ),
            ChatInputField(),
          ],
        ),
      ),
    );
  }
}

class Message {
  final String sender;
  final String text;
  final String time;
  final bool isMe;
  final int avatarColor;

  Message(this.sender, this.text, this.time, this.isMe, this.avatarColor);
}

class ChatBubble extends StatelessWidget {
  final Message message;
  final bool showAvatar;
  final bool showName;

  ChatBubble({
    required this.message,
    this.showAvatar = true,
    this.showName = true,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment:
            message.isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!message.isMe && showAvatar) ...[
            CustomAvatar(
              initials:
                  message.sender.split(' ').map((name) => name[0]).join(''),
              color: Color(message.avatarColor),
            ),
            SizedBox(width: 8),
          ],
          if (!message.isMe && !showAvatar) SizedBox(width: 40),
          Container(
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            decoration: BoxDecoration(
              color: message.isMe
                  ? Color(0xFF4A148C) // Deep purple for my messages
                  : Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(18),
                topRight: Radius.circular(18),
                bottomLeft: Radius.circular(message.isMe ? 18 : 0),
                bottomRight: Radius.circular(message.isMe ? 0 : 18),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 1),
                  blurRadius: 3,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (showName && !message.isMe) ...[
                  Text(
                    message.sender,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 13,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 3),
                ],
                Text(
                  message.text,
                  style: TextStyle(
                    fontSize: 15,
                    color: message.isMe ? Color(0xFFEDE7F6) : Colors.black87,
                  ),
                ),
                SizedBox(height: 2),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      message.time,
                      style: TextStyle(
                        fontSize: 11,
                        color: message.isMe
                            ? Color(0xFFEDE7F6).withOpacity(0.7)
                            : Colors.black45,
                      ),
                    ),
                    if (message.isMe) ...[
                      SizedBox(width: 4),
                      Icon(
                        Icons.done_all,
                        size: 14,
                        color: Color(0xFFEDE7F6).withOpacity(0.7),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomAvatar extends StatelessWidget {
  final String initials;
  final Color color;
  final double size;

  const CustomAvatar({
    Key? key,
    required this.initials,
    required this.color,
    this.size = 32,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Extract only first 2 characters for initials to avoid overflow
    final displayInitials =
        initials.length > 2 ? initials.substring(0, 2) : initials;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: initials.isEmpty
            ? Icon(
                Icons.person,
                color: color,
                size: size * 0.5,
              )
            : Text(
                displayInitials.toUpperCase(),
                style: TextStyle(
                  color: color,
                  fontWeight: FontWeight.bold,
                  fontSize: size * 0.4,
                ),
              ),
      ),
    );
  }
}

class ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: Offset(0, -1),
            blurRadius: 3,
          ),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.emoji_emotions_outlined),
                color: Colors.grey[700],
                onPressed: () {},
              ),
            ),
            SizedBox(width: 8),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: TextStyle(color: Colors.grey[500]),
                    border: InputBorder.none,
                  ),
                ),
              ),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.attach_file),
                color: Colors.grey[700],
                onPressed: () {},
              ),
            ),
            SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                color: Color(0xFF4A148C), // Deep purple for the send button
                borderRadius: BorderRadius.circular(30),
              ),
              child: IconButton(
                icon: Icon(Icons.send),
                color: Colors.white,
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
