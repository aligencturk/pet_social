import 'package:flutter/material.dart';

class MessagesScreen extends StatefulWidget {
  const MessagesScreen({super.key});

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _messages = [
    {
      'name': 'CanineCompanion',
      'message': 'Sent a photo',
      'time': '3m',
      'avatar': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop&crop=face',
      'hasUnread': true,
    },
    {
      'name': 'PetLoverParadise',
      'message': 'Sent a photo',
      'time': '8m',
      'avatar': 'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=100&h=100&fit=crop&crop=face',
      'hasUnread': true,
    },
    {
      'name': 'PawsitiveVibes',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
    {
      'name': 'purrfectlyhappy',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
    {
      'name': 'whiskerWonderland',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
    {
      'name': 'furrtastic',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
    {
      'name': 'tailwaggingtales',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
    {
      'name': 'PurrfectlyMeow',
      'message': 'Sent 52m ago',
      'time': '52m',
      'avatar': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop&crop=face',
      'hasUnread': false,
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Search Bar
          _buildSearchBar(),
          // Messages List
          Expanded(
            child: ListView.builder(
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                return _buildMessageItem(message);
              },
            ),
          ),
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
      title: const Text(
        'Messages',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: const Icon(Icons.edit, color: Colors.black87, size: 18),
          onPressed: () {
            // Edit messages
          },
        ),
      ],
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
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
    );
  }

  Widget _buildMessageItem(Map<String, dynamic> message) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/chat',
          arguments: {
            'contactName': message['name'],
            'contactAvatar': message['avatar'],
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Row(
          children: [
            // Avatar
            CircleAvatar(
              radius: 18,
              backgroundImage: NetworkImage(message['avatar']),
              backgroundColor: Colors.grey[300],
            ),
            const SizedBox(width: 10),
            // Message content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        message['name'],
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: message['hasUnread'] 
                              ? const Color(0xFF6B46C1) 
                              : Colors.black87,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        message['time'],
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          message['message'],
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (message['hasUnread'])
                        Container(
                          width: 6,
                          height: 6,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFF6B35),
                            shape: BoxShape.circle,
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
    );
  }

}
