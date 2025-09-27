import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  final String contactName;
  final String contactAvatar;

  const ChatScreen({
    super.key,
    required this.contactName,
    required this.contactAvatar,
  });

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  final List<Map<String, dynamic>> _messages = [
    {
      'isMe': false,
      'text': 'So excited!',
      'time': 'Yesterday',
      'avatar': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop&crop=face',
    },
    {
      'isMe': false,
      'text': 'What time are u leaving?',
      'time': null,
      'avatar': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop&crop=face',
    },
    {
      'isMe': false,
      'text': '8 am?',
      'time': null,
      'avatar': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop&crop=face',
    },
    {
      'isMe': true,
      'text': 'the program starts at 10',
      'time': null,
      'avatar': null,
    },
    {
      'isMe': false,
      'text': 'Meet at the park?',
      'time': null,
      'avatar': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop&crop=face',
    },
    {
      'isMe': true,
      'text': 'Let\'s do it',
      'time': null,
      'avatar': null,
    },
    {
      'isMe': true,
      'text': 'See u thereeee!',
      'time': null,
      'avatar': null,
    },
  ];

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Messages List
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              itemCount: _messages.length + 1, // +1 for image card
              itemBuilder: (context, index) {
                if (index == 3) {
                  // Image card after "8 am?" message
                  return _buildImageCard();
                } else if (index > 3) {
                  // Adjust index for messages after image card
                  return _buildMessageBubble(_messages[index - 1]);
                } else {
                  return _buildMessageBubble(_messages[index]);
                }
              },
            ),
          ),
          // Input Bar
          _buildInputBar(),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios, color: Colors.black87, size: 18),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        widget.contactName,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Color(0xFF6B46C1),
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.more_vert, color: Colors.black87, size: 18),
          onPressed: () {
            // More options
          },
        ),
      ],
    );
  }

  Widget _buildMessageBubble(Map<String, dynamic> message) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: message['isMe'] 
            ? MainAxisAlignment.end 
            : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          if (!message['isMe'] && message['avatar'] != null)
            CircleAvatar(
              radius: 12,
              backgroundImage: NetworkImage(message['avatar']),
              backgroundColor: Colors.grey[300],
            ),
          if (!message['isMe'] && message['avatar'] != null)
            const SizedBox(width: 8),
          if (message['isMe'])
            const SizedBox(width: 8),
          Flexible(
            child: Column(
              crossAxisAlignment: message['isMe'] 
                  ? CrossAxisAlignment.end 
                  : CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: message['isMe'] 
                        ? const Color(0xFFFF6B35) 
                        : const Color(0xFFE8E8E8),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Text(
                    message['text'],
                    style: TextStyle(
                      fontSize: 14,
                      color: message['isMe'] ? Colors.white : Colors.black87,
                    ),
                  ),
                ),
                if (message['time'] != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      message['time'],
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          if (!message['isMe'])
            const SizedBox(width: 8),
        ],
      ),
    );
  }

  Widget _buildImageCard() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Center(
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              // Image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                child: Image.network(
                  'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=200&fit=crop',
                  width: 280,
                  height: 150,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      width: 280,
                      height: 150,
                      color: Colors.grey[300],
                      child: const Icon(Icons.pets, color: Colors.grey, size: 40),
                    );
                  },
                ),
              ),
              // Text content
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Pet Meet @ Azuela Cove',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'facebook.com/furrpals',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF6B46C1),
                      ),
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

  Widget _buildInputBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[200]!),
        ),
      ),
      child: Row(
        children: [
          // Plus icon
          IconButton(
            icon: const Icon(Icons.add, color: Colors.grey, size: 20),
            onPressed: () {
              // Add attachment
            },
          ),
          // Emoji icon
          IconButton(
            icon: const Icon(Icons.emoji_emotions_outlined, color: Colors.grey, size: 20),
            onPressed: () {
              // Add emoji
            },
          ),
          // Text input
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  const Icon(Icons.format_bold, color: Colors.grey, size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      decoration: const InputDecoration(
                        hintText: 'Message',
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                      ),
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(width: 8),
          // Microphone icon
          IconButton(
            icon: const Icon(Icons.mic, color: Colors.grey, size: 20),
            onPressed: () {
              // Voice input
            },
          ),
        ],
      ),
    );
  }
}
