import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> _profileImages = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1506905925346-14b5e4b4b4b4?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1552053831-71594a27632d?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Profile banner and picture
            _buildProfileHeader(),
            // Profile info
            _buildProfileInfo(),
            const SizedBox(height: 12),
            // Edit profile button
            _buildEditProfileButton(),
            const SizedBox(height: 16),
            // Profile images grid
            _buildProfileGrid(),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Image.asset(
            'assets/Logo Splash Screen.png',
            height: 24,
            width: 24,
          ),
          const SizedBox(width: 8),
          const Text(
            'PAWPALS',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings, color: Colors.black87, size: 20),
          onPressed: () {
            Navigator.pushNamed(context, '/settings');
          },
        ),
      ],
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        // Cover photo
        SizedBox(
          height: 140,
          width: double.infinity,
          child: Image.network(
            'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=200&fit=crop',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Container(
                color: Colors.grey[300],
                child: const Icon(Icons.pets, color: Colors.grey, size: 60),
              );
            },
          ),
        ),
        // Profile picture - positioned below cover photo
        Transform.translate(
          offset: const Offset(0, -40),
          child: Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white, width: 3),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: CircleAvatar(
              radius: 29,
              backgroundImage: NetworkImage('https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=200&fit=crop'),
              backgroundColor: Colors.grey[300],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildProfileInfo() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [          // Username
          const Text(
            'BarkAndRoll',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Color(0xFF6B46C1),
            ),
          ),
          const SizedBox(height: 12),
          // Stats
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem('1,234', 'Posts'),
              _buildStatItem('5,678', 'Followers'),
              _buildStatItem('9,101', 'Following'),
            ],
          ),
          const SizedBox(height: 12),
          // Bio
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Proud dog parent to two energetic Golden Retrievers,\n Max and Bella.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.black87,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 2),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }

  Widget _buildEditProfileButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      width: double.infinity,
      height: 32,
      child: ElevatedButton.icon(
        onPressed: () {
          Navigator.pushNamed(context, '/edit-profile');
        },
        icon: const Icon(
          Icons.edit,
          color: Colors.white,
          size: 14,
        ),
        label: const Text(
          'Edit Profile',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
      ),
    );
  }

  Widget _buildProfileGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 2,
        mainAxisSpacing: 2,
        childAspectRatio: 1,
      ),
      itemCount: _profileImages.length,
      itemBuilder: (context, index) {
        final imageData = _profileImages[index];
        return _buildImageItem(imageData);
      },
    );
  }

  Widget _buildImageItem(Map<String, dynamic> imageData) {
    return GestureDetector(
      onTap: () {
        // Navigate to image detail
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey[200],
        ),
        child: Stack(
          children: [
            // Main image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                imageData['imageUrl'],
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: double.infinity,
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, color: Colors.grey, size: 30),
                  );
                },
              ),
            ),
            // Carousel indicator
            if (imageData['hasCarousel'])
              Positioned(
                top: 4,
                right: 4,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(3),
                  ),
                  child: const Icon(
                    Icons.view_carousel,
                    color: Colors.black54,
                    size: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}