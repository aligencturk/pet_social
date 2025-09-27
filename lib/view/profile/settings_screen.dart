import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final TextEditingController _searchController = TextEditingController();
  bool _privateAccount = true;
  bool _pushNotifications = true;
  bool _promotions = false;
  bool _appUpdates = true;

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
            // Search bar
            _buildSearchBar(),
            const SizedBox(height: 16),
            // Account Settings
            _buildSection(
              title: 'Account Settings',
              items: [
                _buildMenuItem(
                  icon: Icons.person,
                  title: 'Account Details',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.lock,
                  title: 'Change Password',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.security,
                  title: 'Security',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Privacy Settings
            _buildSection(
              title: 'Privacy Settings',
              items: [
                _buildToggleItem(
                  icon: Icons.visibility,
                  title: 'Private Account',
                  value: _privateAccount,
                  onChanged: (value) {
                    setState(() {
                      _privateAccount = value;
                    });
                  },
                ),
                _buildMenuItem(
                  icon: Icons.upload,
                  title: 'Data Sharing Preferences',
                  onTap: () {},
                ),
                _buildMenuItem(
                  icon: Icons.block,
                  title: 'Blocked Users',
                  onTap: () {},
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Notification Settings
            _buildSection(
              title: 'Notification Settings',
              items: [
                _buildToggleItem(
                  icon: Icons.notifications,
                  title: 'Push Notifications',
                  value: _pushNotifications,
                  onChanged: (value) {
                    setState(() {
                      _pushNotifications = value;
                    });
                  },
                ),
                _buildToggleItem(
                  icon: Icons.star,
                  title: 'Promotions',
                  value: _promotions,
                  onChanged: (value) {
                    setState(() {
                      _promotions = value;
                    });
                  },
                ),
                _buildToggleItem(
                  icon: Icons.phone_android,
                  title: 'App Updates',
                  value: _appUpdates,
                  onChanged: (value) {
                    setState(() {
                      _appUpdates = value;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 24),
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
        'Settings',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
      centerTitle: true,
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFFF8F8FC),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey[300]!),
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
          ),
        ],
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> items,
  }) {
    return Column(
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
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
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
            children: items,
          ),
        ),
      ],
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[600],
        size: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: Colors.grey[400],
        size: 12,
      ),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Icon(
        icon,
        color: Colors.grey[600],
        size: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.black87,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFFFF6B35),
        activeTrackColor: const Color(0xFFFF6B35).withOpacity(0.3),
        inactiveThumbColor: Colors.grey[300],
        inactiveTrackColor: Colors.grey[200],
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }
}
