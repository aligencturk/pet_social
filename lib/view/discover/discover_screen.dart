import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final TextEditingController _searchController = TextEditingController();

  final List<Map<String, dynamic>> _discoverImages = [
    {
      'imageUrl': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1506905925346-14b5e4b4b4b4?w=300&h=300&fit=crop',
      'hasCarousel': false,
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
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1544966503-7cc5ac882d5f?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1472099645785-5658abf4ff4e?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1500648767791-00dcc994a43e?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1544005313-94ddf0286df2?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1494790108755-2616b612b786?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1506905925346-14b5e4b4b4b4?w=300&h=300&fit=crop',
      'hasCarousel': false,
    },
    {
      'imageUrl': 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=300&fit=crop',
      'hasCarousel': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F8FC),
      body: SafeArea(
        child: Column(
          children: [
            // Search bar
            _buildSearchBar(),
            // Image grid
            Expanded(
              child: _buildImageGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FC),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.search,
            color: Colors.grey,
            size: 20,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
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

  Widget _buildImageGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1,
      ),
      itemCount: _discoverImages.length,
      itemBuilder: (context, index) {
        final imageData = _discoverImages[index];
        return _buildImageItem(imageData);
      },
    );
  }

  Widget _buildImageItem(Map<String, dynamic> imageData) {
    return GestureDetector(
      onTap: () {
        // Navigate to image detail or open image
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
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Icon(
                    Icons.view_carousel,
                    color: Colors.black54,
                    size: 12,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}