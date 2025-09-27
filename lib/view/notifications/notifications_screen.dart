import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {

  final Map<String, List<Map<String, dynamic>>> _notifications = {
    'Today': [
      {
        'type': 'liked_post',
        'userName': 'PurrfectlyMeow',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '52m',
        'avatar': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
      {
        'type': 'liked_post',
        'userName': 'PetLoverParadise',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '52m',
        'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
      {
        'type': 'new_follower',
        'userName': 'Diamond_in_the_Ruff',
        'text': 'Diamond_in_the_Ruff started following you.',
        'time': '6h',
        'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
        'thumbnail': null,
      },
    ],
    'Yesterday': [
      {
        'type': 'liked_post',
        'userName': 'MaxTheDog',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '13h',
        'avatar': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
      {
        'type': 'liked_post',
        'userName': 'AdventureDogs',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '14h',
        'avatar': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
      {
        'type': 'new_follower',
        'userName': 'Diamond_in_the_Ruff',
        'text': 'Diamond_in_the_Ruff started following you.',
        'time': '16h',
        'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
        'thumbnail': null,
      },
      {
        'type': 'liked_post',
        'userName': 'CatWhisperer',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '21h',
        'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
    ],
    'Last 7 days': [
      {
        'type': 'new_follower',
        'userName': 'Diamond_in_the_Ruff',
        'text': 'Diamond_in_the_Ruff started following you.',
        'time': '1d',
        'avatar': 'https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=100&h=100&fit=crop&crop=face',
        'thumbnail': null,
      },
      {
        'type': 'liked_post',
        'userName': 'PetGroomerPro',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others liked your post.',
        'time': '1d',
        'avatar': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
      {
        'type': 'commented_post',
        'userName': 'FluffyAdventures',
        'text': 'PurrfectlyMeow, Fluffy Adventures and others commented your post.',
        'time': '3d',
        'avatar': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=100&h=100&fit=crop&crop=face',
        'thumbnail': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop',
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: _notifications.length,
        itemBuilder: (context, index) {
          final sectionKey = _notifications.keys.elementAt(index);
          final notifications = _notifications[sectionKey]!;
          
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Section header
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  sectionKey,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B46C1),
                  ),
                ),
              ),
              // Notifications in this section
              ...notifications.map((notification) => _buildNotificationItem(notification)),
              const SizedBox(height: 8),
            ],
          );
        },
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
        'Notifications',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildNotificationItem(Map<String, dynamic> notification) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundImage: NetworkImage(notification['avatar']),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          // Notification content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification['text'],
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  notification['time'],
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          // Thumbnail or Follow button
          if (notification['type'] == 'new_follower')
            _buildFollowButton()
          else
            _buildThumbnail(notification['thumbnail']),
        ],
      ),
    );
  }

  Widget _buildThumbnail(String? imageUrl) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[200],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: imageUrl != null
            ? Image.network(
                imageUrl,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(Icons.pets, color: Colors.grey, size: 24);
                },
              )
            : const Icon(Icons.pets, color: Colors.grey, size: 24),
      ),
    );
  }

  Widget _buildFollowButton() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFFF6B35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: const Text(
        'Follow',
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }

}
