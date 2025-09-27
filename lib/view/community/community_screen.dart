import 'package:flutter/material.dart';

class CommunityScreen extends StatefulWidget {
  const CommunityScreen({super.key});

  @override
  State<CommunityScreen> createState() => _CommunityScreenState();
}

class _CommunityScreenState extends State<CommunityScreen> {
  int _selectedTab = 2; // Events tab selected by default

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          _buildTabBar(),
          Expanded(
            child: _buildContent(),
          ),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        'Community',
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildTabBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        children: [
          Expanded(
            child: _buildTabItem(
              icon: Icons.list_alt,
              label: 'For you',
              index: 0,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildTabItem(
              icon: Icons.people,
              label: 'Your groups',
              index: 1,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildTabItem(
              icon: Icons.event,
              label: 'Events',
              index: 2,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTabItem({
    required IconData icon,
    required String label,
    required int index,
  }) {
    final isSelected = _selectedTab == index;
    
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 16,
              color: isSelected ? Colors.white : const Color(0xFFFF6B35),
            ),
            const SizedBox(width: 4),
            Flexible(
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                  color: isSelected ? Colors.white : const Color(0xFFFF6B35),
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    switch (_selectedTab) {
      case 0:
        return _buildForYouContent();
      case 1:
        return _buildYourGroupsContent();
      case 2:
        return _buildEventsContent();
      default:
        return _buildEventsContent();
    }
  }

  Widget _buildForYouContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Announcement Banner
          _buildAnnouncementBanner(),
          const SizedBox(height: 16),
          // Social Media Posts
          _buildSocialPost(
            username: 'Meowmas DVO',
            handle: 'fluffymatte',
            time: '48m',
            content: 'Anyone want to meetup at Azuela Cove?',
            likes: 322,
            comments: 16,
          ),
          const SizedBox(height: 16),
          _buildSocialPostWithImage(
            username: 'Meowmas DVO',
            handle: 'fluffymatte',
            time: '48m',
            content: 'Meet Maxine! My bunso <3',
            imageUrl: 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=400&h=300&fit=crop',
            likes: 450,
            comments: 23,
          ),
        ],
      ),
    );
  }

  Widget _buildYourGroupsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Groups you manage section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Groups you manage',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B46C1),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.green,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildGroupItem(
            groupName: 'Pets DVO',
            lastActivity: 'Updated about 2 years ago.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 8),
          _buildGroupItem(
            groupName: 'Pawesome Adventures',
            lastActivity: 'Trina Trinidad made a post.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 16),
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B35),
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Text(
                'See All',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Groups you've joined section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Groups you\'ve joined',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B46C1),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.swap_vert,
                  color: Colors.green,
                  size: 20,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Search bar
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.grey, size: 20),
                const SizedBox(width: 8),
                const Expanded(
                  child: Text(
                    'Search',
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                const Icon(Icons.search, color: Colors.grey, size: 20),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Joined groups list
          _buildGroupItem(
            groupName: 'Pets DVO',
            lastActivity: 'Updated about 2 years ago.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 8),
          _buildGroupItem(
            groupName: 'Pawesome Adventures',
            lastActivity: 'Trina Trinidad made a post.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 8),
          _buildGroupItem(
            groupName: 'Puppy Playdates',
            lastActivity: 'Updated about 2 years ago.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 8),
          _buildGroupItem(
            groupName: 'Kitty Kingdom',
            lastActivity: 'Trina Trinidad made a post.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
          const SizedBox(height: 8),
          _buildGroupItem(
            groupName: 'Furry Witness',
            lastActivity: 'Updated about 2 years ago.',
            avatar: 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face',
          ),
        ],
      ),
    );
  }

  Widget _buildEventsContent() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Top events section header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Top events for you',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B46C1),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Create',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B46C1),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Event cards
          _buildEventCard(
            title: 'Puppy Playdate Extravaganza',
            date: 'TOMORROW AT 2 PM',
            description: 'Join us for a fun-filled day of puppy socialization and games at Magsaysay Park!',
            imageUrl: 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop',
          ),
          const SizedBox(height: 16),
          _buildEventCard(
            title: 'Cat Cafe Meetup',
            date: 'THIS FRIDAY AT 6 PM',
            description: 'Relax with fellow cat lovers and enjoy coffee with adorable felines!',
            imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400&h=300&fit=crop',
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementBanner() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF6B46C1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Free Rabies Vaccination',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'August 2024',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  '3 BGH Compound\n4 East Quirino Hill\n5 Loakan Proper\n12 Loakan Apugan',
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.white,
                    height: 1.3,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=100&h=100&fit=crop',
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets, color: Colors.grey, size: 40),
                );
              },
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.close, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialPost({
    required String username,
    required String handle,
    required String time,
    required String content,
    required int likes,
    required int comments,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face'),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      handle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          // Content
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          // Engagement
          Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20),
              const SizedBox(width: 16),
              const Icon(Icons.send, color: Colors.grey, size: 20),
              const Spacer(),
              Text(
                '$likes likes',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'View all $comments comments',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.teal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialPostWithImage({
    required String username,
    required String handle,
    required String time,
    required String content,
    required String imageUrl,
    required int likes,
    required int comments,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face'),
                backgroundColor: Colors.grey[300],
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      username,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    Text(
                      handle,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.more_vert, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          // Content
          Text(
            content,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black87,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 12),
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets, color: Colors.grey, size: 60),
                );
              },
            ),
          ),
          const SizedBox(height: 12),
          // Engagement
          Row(
            children: [
              const Icon(Icons.favorite_border, color: Colors.grey, size: 20),
              const SizedBox(width: 16),
              const Icon(Icons.chat_bubble_outline, color: Colors.grey, size: 20),
              const SizedBox(width: 16),
              const Icon(Icons.send, color: Colors.grey, size: 20),
              const Spacer(),
              Text(
                '$likes likes',
                style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            'View all $comments comments',
            style: const TextStyle(
              fontSize: 12,
              color: Colors.teal,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGroupItem({
    required String groupName,
    required String lastActivity,
    required String avatar,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CircleAvatar(
            radius: 24,
            backgroundImage: NetworkImage(avatar),
            backgroundColor: Colors.grey[300],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  groupName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF6B46C1),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  lastActivity,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEventCard({
    required String title,
    required String date,
    required String description,
    required String imageUrl,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Event image
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: 200,
                  color: Colors.grey[300],
                  child: const Icon(Icons.event, color: Colors.grey, size: 60),
                );
              },
            ),
          ),
          // Event details
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF6B46C1),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  date,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 16),
                // Action buttons
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFF6B35),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.star, color: Colors.white, size: 16),
                          SizedBox(width: 6),
                          Text(
                            'Interested',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey[300]!),
                      ),
                      child: const Icon(Icons.share, color: Colors.grey, size: 16),
                    ),
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
