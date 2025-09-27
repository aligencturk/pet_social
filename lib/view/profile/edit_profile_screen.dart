import 'package:flutter/material.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture Section
            _buildSection(
              title: 'Profile Picture',
              child: Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage('https://images.unsplash.com/photo-1494790108755-2616b612b786?w=150&h=150&fit=crop&crop=face'),
                      backgroundColor: Colors.grey[300],
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: const Color(0xFF6B46C1),
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.white,
                          size: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Cover Photo Section
            _buildSection(
              title: 'Cover Photo',
              child: Container(
                height: 80,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey[200],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://images.unsplash.com/photo-1551717743-49959800b1f6?w=400&h=200&fit=crop',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[300],
                        child: const Icon(Icons.pets, color: Colors.grey, size: 40),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Bio Section
            _buildSection(
              title: 'Bio',
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey[50],
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: const Text(
                  'Proud dog parent to two energetic Golden Retrievers, Max and Bella. 🐾',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Personal Information Section
            _buildSection(
              title: 'Personal Information',
              child: Column(
                children: [
                  _buildInfoField(
                    icon: Icons.location_on,
                    label: 'Hometown',
                    value: '',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoField(
                    icon: Icons.home,
                    label: 'Current City',
                    value: '',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoField(
                    icon: Icons.work,
                    label: 'Workplace',
                    value: '',
                  ),
                  const SizedBox(height: 8),
                  _buildInfoField(
                    icon: Icons.favorite,
                    label: 'Relationship Status',
                    value: '',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // Account Settings Link
            Center(
              child: TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings');
                },
                child: const Text(
                  'Account Settings',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
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
        'Edit Profile',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSection({
    required String title,
    required Widget child,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Color(0xFF6B46C1),
              ),
            ),
            TextButton(
              onPressed: () {
                // Handle edit action
              },
              child: const Text(
                'Edit',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        child,
      ],
    );
  }

  Widget _buildInfoField({
    required IconData icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.grey[600],
            size: 16,
          ),
          const SizedBox(width: 8),
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.black87,
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          if (value.isNotEmpty)
            Text(
              value,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
        ],
      ),
    );
  }
}
