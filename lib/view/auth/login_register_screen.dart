import 'package:flutter/material.dart';

class LoginRegisterScreen extends StatelessWidget {
  const LoginRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 60),
              // Logo resmi
              Image.asset(
                'assets/Logo Splash Screen.png',
                height: 250,
                width: 250,
              ),
              const SizedBox(height: 40),
              // Alt yazı
              const Text(
                'Share moments, connect with pet lovers, and discover your pet community!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                  height: 1.4,
                ),
              ),
              const Spacer(),
              // Butonlar
              _buildButtons(context),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildButtons(BuildContext context) {
    return Column(
      children: [
        // Create An Account butonu
        SizedBox(
          width: double.infinity,
          height: 56,
          child: ElevatedButton(
            onPressed: () {
              // Kayıt ol sayfasına yönlendir
              Navigator.pushNamed(context, '/register');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFFF6B35), // Turuncu
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 0,
            ),
            child: const Text(
              'Create An Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        // Already Have An Account butonu
        SizedBox(
          width: double.infinity,
          height: 56,
          child: OutlinedButton(
            onPressed: () {
              // Giriş yap sayfasına yönlendir
              Navigator.pushNamed(context, '/login');
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFF6B46C1), // Mor
              side: const BorderSide(
                color: Color(0xFF6B46C1), // Mor kenarlık
                width: 2,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: const Text(
              'Already Have An Account',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
