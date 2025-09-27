import 'package:flutter/material.dart';

class InterestsScreen extends StatefulWidget {
  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  bool _hasPet = true;
  Set<String> _selectedInterests = {};

  final Map<String, List<String>> _interestCategories = {
    'Pet Types': [
      'Dogs',
      'Cats',
      'Birds',
      'Fish & Reptiles',
      'Small Mammals & Exotic Pets',
    ],
    'Activities & Lifestyle': [
      'Training & Obedience',
      'Pet Meetups & Events',
      'Pet Travel & Adventures',
      'DIY Projects & Crafts',
    ],
    'Health & Wellness': [
      'Nutrition & Diet',
      'Grooming Tips',
      'Veterinary Advice',
      'Pet Fitness & Exercise',
    ],
    'Community & Support': [
      'Adoption & Rescue Stories',
      'Local Pet Events',
      'Pet Owner Support Groups',
    ],
    'Pet Products & Services': [
      'Toy & Gear Recommendations',
      'Food & Treats',
    ],
  };

  void _toggleInterest(String interest) {
    setState(() {
      if (_selectedInterests.contains(interest)) {
        _selectedInterests.remove(interest);
      } else {
        _selectedInterests.add(interest);
      }
    });
  }

  void _onContinuePressed() {
    // Ana sayfaya yönlendir
    Navigator.pushReplacementNamed(context, '/home');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              // Logo ve başlık
              _buildHeader(),
              const SizedBox(height: 40),
              // Pet sahibi sorusu
              _buildPetQuestion(),
              const SizedBox(height: 32),
              // İlgi alanları kategorileri
              ..._buildInterestCategories(),
              const SizedBox(height: 40),
              // Continue butonu
              _buildContinueButton(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // Logo
        Image.asset(
          'assets/Logo Splash Screen.png',
          height: 60,
          width: 60,
        ),
        const SizedBox(height: 16),
        // Uygulama adı
        const Text(
          'PAWPALS',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B46C1), // Mor renk
          ),
        ),
        const SizedBox(height: 16),
        // Ana başlık
        const Text(
          'We wanna get to know you!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF6B46C1), // Mor renk
          ),
        ),
        const SizedBox(height: 8),
        // Alt başlık
        const Text(
          'Select your interests for a personalized experience!',
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey,
            height: 1.4,
          ),
        ),
      ],
    );
  }

  Widget _buildPetQuestion() {
    return Row(
      children: [
        const Text(
          'Do you have a pet?',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B46C1), // Mor renk
          ),
        ),
        const Spacer(),
        Checkbox(
          value: _hasPet,
          onChanged: (value) {
            setState(() {
              _hasPet = value ?? false;
            });
          },
          activeColor: const Color(0xFF6B46C1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
        ),
      ],
    );
  }

  List<Widget> _buildInterestCategories() {
    return _interestCategories.entries.map((entry) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            entry.key,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF6B46C1), // Mor renk
            ),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: entry.value.map((interest) {
              final isSelected = _selectedInterests.contains(interest);
              return _buildInterestButton(interest, isSelected);
            }).toList(),
          ),
          const SizedBox(height: 24),
        ],
      );
    }).toList();
  }

  Widget _buildInterestButton(String interest, bool isSelected) {
    return GestureDetector(
      onTap: () => _toggleInterest(interest),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFFFF6B35) : Colors.white,
          border: Border.all(
            color: const Color(0xFFFF6B35),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          interest,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? Colors.white : const Color(0xFFFF6B35),
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return SizedBox(
      width: double.infinity,
      height: 44,
      child: ElevatedButton(
        onPressed: _onContinuePressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFFF6B35), // Turuncu
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          elevation: 0,
        ),
        child: const Text(
          'Continue',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
