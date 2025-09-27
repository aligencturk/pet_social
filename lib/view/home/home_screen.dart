import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // PawPalPro Banner
            // Stories Section
            _buildStoriesSection(),
            const SizedBox(height: 16),
            // Social Media Posts
            _buildSocialPost(
              username: 'FluffyAdventures',
              postText: 'Just got back from our first agility training session! Fluffy nailed the course! 🏆 🐎',
              hashtags: '#PetTraining #FluffyWins #PawPals',
              imageUrl: 'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=300&fit=crop',
              likes: 2610,
              imageCount: '3/5',
            ),
            const SizedBox(height: 16),
            _buildSocialPost(
              username: 'GoldenRetrieverLover',
              postText: 'Morning walk with my best friend! The weather is perfect today ☀️🐕',
              hashtags: '#MorningWalk #GoldenRetriever #BestFriend',
              imageUrl: 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=400&h=300&fit=crop',
              likes: 1847,
              imageCount: '1/3',
            ),
            const SizedBox(height: 16),
            _buildSocialPost(
              username: 'CatWhisperer',
              postText: 'My cat learned a new trick today! She can now high-five on command 🐱✋',
              hashtags: '#CatTraining #SmartCat #Tricks',
              imageUrl: 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=400&h=300&fit=crop',
              likes: 3205,
              imageCount: '1/1',
            ),
            const SizedBox(height: 16),
            // Trending Section
            _buildTrendingSection(),
            const SizedBox(height: 16),
            _buildSocialPost(
              username: 'PetGroomerPro',
              postText: 'Before and after grooming session! Look at this transformation ✨',
              hashtags: '#PetGrooming #Transformation #BeforeAfter',
              imageUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=400&h=300&fit=crop',
              likes: 4521,
              imageCount: '2/4',
            ),
            const SizedBox(height: 16),
            _buildSocialPost(
              username: 'AdventureDogs',
              postText: 'Hiking adventure with the pack! 10 miles completed 🥾🐕‍🦺',
              hashtags: '#Hiking #Adventure #DogPack #Nature',
              imageUrl: 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=400&h=300&fit=crop',
              likes: 3892,
              imageCount: '1/6',
            ),
            const SizedBox(height: 80), // Bottom padding for navigation
          ],
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      title: Row(
        children: [
          // Logo
          Image.asset(
            'assets/Logo Splash Screen.png',
            height: 32,
            width: 32,
          ),
          const SizedBox(width: 8),
          const Text(
            'PAWPALS',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
        ],
      ),
      actions: [
        // Notification icon
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.notifications_outlined, color: Colors.black),
              onPressed: () {},
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        // Message icon with badge
        Stack(
          children: [
            IconButton(
              icon: const Icon(Icons.message_outlined, color: Colors.black),
              onPressed: () {
                Navigator.pushNamed(context, '/messages');
              },
            ),
            Positioned(
              right: 8,
              top: 8,
              child: Container(
                padding: const EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  color: Color(0xFFFF6B35),
                  shape: BoxShape.circle,
                ),
                constraints: const BoxConstraints(
                  minWidth: 16,
                  minHeight: 16,
                ),
                child: const Text(
                  '2',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8),
      ],
    );
  }

  Widget _buildStoriesSection() {
    return Container(
      height: 100,
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 8,
        itemBuilder: (context, index) {
          final stories = [
            {'name': 'Your Story', 'image': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face'},
            {'name': 'Fluffy', 'image': 'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=100&h=100&fit=crop'},
            {'name': 'Max', 'image': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=100&h=100&fit=crop'},
            {'name': 'Luna', 'image': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=100&h=100&fit=crop'},
            {'name': 'Buddy', 'image': 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=100&h=100&fit=crop'},
            {'name': 'Milo', 'image': 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=100&h=100&fit=crop'},
            {'name': 'Bella', 'image': 'https://images.unsplash.com/photo-1574158622682-e40e69881006?w=100&h=100&fit=crop'},
            {'name': 'Charlie', 'image': 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=100&h=100&fit=crop'},
          ];
          
          return Container(
            width: 70,
            margin: const EdgeInsets.only(right: 12),
            child: Column(
              children: [
                Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: index == 0 ? Colors.grey : const Color(0xFFFF6B35),
                      width: 2,
                    ),
                  ),
                  child: CircleAvatar(
                    radius: 28,
                    backgroundImage: NetworkImage(stories[index]['image']!),
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  stories[index]['name']!,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildTrendingSection() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.trending_up, color: Color(0xFFFF6B35), size: 20),
              SizedBox(width: 8),
              Text(
                'Trending Today',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF6B46C1),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _buildTrendingItem('#PetTraining', '2.5K posts'),
          _buildTrendingItem('#DogAdventures', '1.8K posts'),
          _buildTrendingItem('#CatLife', '3.2K posts'),
          _buildTrendingItem('#PetGrooming', '1.1K posts'),
        ],
      ),
    );
  }

  Widget _buildTrendingItem(String hashtag, String posts) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text(
            hashtag,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B46C1),
            ),
          ),
          const Spacer(),
          Text(
            posts,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialPost({
    required String username,
    required String postText,
    required String hashtags,
    required String imageUrl,
    required int likes,
    required String imageCount,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // User info
          Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundColor: Colors.grey[300],
                backgroundImage: NetworkImage('https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=100&h=100&fit=crop&crop=face'),
              ),
              const SizedBox(width: 12),
              Text(
                username,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.more_vert, color: Colors.grey),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Post text
          Text(
            postText,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          // Hashtags
          Text(
            hashtags,
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xFF6B46C1),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 12),
          // Post image
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
            ),
            child: Stack(
              children: [
                // Main image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    imageUrl,
                    width: double.infinity,
                    height: 200,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.pets,
                            size: 60,
                            color: Colors.grey,
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Image counter
                Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.6),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      imageCount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                // Bottom indicators
                Positioned(
                  bottom: 12,
                  left: 12,
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Icon(
                          Icons.person,
                          size: 16,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          '${likes ~/ 1000}',
                          style: const TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Image dots indicator
                Positioned(
                  bottom: 12,
                  right: 12,
                  child: Row(
                    children: List.generate(5, (index) {
                      final currentImage = int.parse(imageCount.split('/')[0]) - 1;
                      return Container(
                        margin: const EdgeInsets.symmetric(horizontal: 2),
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: index == currentImage ? Colors.white : Colors.white.withOpacity(0.5),
                          shape: BoxShape.circle,
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Interaction buttons
          Row(
            children: [
              IconButton(
                icon: const Icon(Icons.favorite_border, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.chat_bubble_outline, color: Colors.grey),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.send, color: Colors.grey),
                onPressed: () {},
              ),
              const Spacer(),
              Text(
                '${likes.toString()} likes',
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF6B46C1),
      unselectedItemColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 8,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Discover',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle_outline),
          label: 'New Post',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.people),
          label: 'Community',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ],
    );
  }
}
