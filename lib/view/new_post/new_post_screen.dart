import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: Column(
        children: [
          // Image preview
          _buildImagePreview(),
          const SizedBox(height: 12),
          // Caption input
          _buildCaptionInput(),
          const SizedBox(height: 16),
          // Options list
          _buildOptionsList(),
          const Spacer(),
          // Share button
          _buildShareButton(),
          const SizedBox(height: 12),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      automaticallyImplyLeading: false,
      title: const Text(
        'Create Post',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildImagePreview() {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 200,
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
              'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=300&fit=crop',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(Icons.pets, color: Colors.grey, size: 60),
                );
              },
            ),
          ),
          // Image counter (3/5)
          Positioned(
            top: 8,
            right: 8,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                '3/5',
                style: TextStyle(
                  fontSize: 10,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          // Person icon (bottom left)
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.person,
                color: Colors.white,
                size: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaptionInput() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: TextField(
        controller: _captionController,
        maxLines: 3,
        decoration: const InputDecoration(
          hintText: 'Write a caption...',
          hintStyle: TextStyle(
            fontSize: 12,
            color: Colors.grey,
          ),
          border: InputBorder.none,
          contentPadding: EdgeInsets.zero,
        ),
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildOptionsList() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          _buildOptionItem(
            icon: Icons.person_add,
            title: 'Tag people',
            onTap: () {
              // Navigate to tag people screen
            },
          ),
          const SizedBox(height: 8),
          _buildOptionItem(
            icon: Icons.visibility,
            title: 'Audience',
            onTap: () {
              // Navigate to audience selection screen
            },
          ),
          const SizedBox(height: 8),
          _buildOptionItem(
            icon: Icons.location_on,
            title: 'Add location',
            onTap: () {
              // Navigate to location selection screen
            },
          ),
        ],
      ),
    );
  }

  Widget _buildOptionItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.grey[600],
              size: 16,
            ),
            const SizedBox(width: 8),
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
            const Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.grey[400],
              size: 12,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShareButton() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12),
      width: double.infinity,
      height: 40,
      child: ElevatedButton(
        onPressed: () {
          // Handle share action
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Post shared successfully!'),
              backgroundColor: Colors.green,
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Share',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    super.dispose();
  }
}
