import 'package:flutter/material.dart';
import 'view/splash/splash_screen.dart';
import 'view/auth/login_register_screen.dart';
import 'view/auth/login_screen.dart';
import 'view/auth/register_screen.dart';
import 'view/auth/email_verification_screen.dart';
import 'view/auth/email_verification_success_screen.dart';
import 'view/auth/forgot_password_screen.dart';
import 'view/auth/reset_password_screen.dart';
import 'view/auth/password_changed_success_screen.dart';
import 'view/onboarding/interests_screen.dart';
import 'view/main_navigation_screen.dart';
import 'view/messages/chat_screen.dart';
import 'view/profile/edit_profile_screen.dart';
import 'view/profile/settings_screen.dart';
import 'view/messages/messages_screen.dart';
import 'view/notifications/notifications_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PAWPALS',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF6B46C1)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: {
        '/home': (context) => const MainNavigationScreen(),
        '/chat': (context) {
          final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
          return ChatScreen(
            contactName: args['contactName'],
            contactAvatar: args['contactAvatar'],
          );  
        },
        '/messages': (context) => const MessagesScreen(),
        '/notifications': (context) => const NotificationsScreen(),
        '/edit-profile': (context) => const EditProfileScreen(),
        '/settings': (context) => const SettingsScreen(),
        '/login_register': (context) => const LoginRegisterScreen(),
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const RegisterScreen(),
        '/interests': (context) => const InterestsScreen(),
        '/forgot-password': (context) => const ForgotPasswordScreen(),
        '/email-verification': (context) {
          final email = ModalRoute.of(context)!.settings.arguments as String;
          return EmailVerificationScreen(email: email);
        },
        '/email-verification-success': (context) => const EmailVerificationSuccessScreen(),
        '/reset-password': (context) => const ResetPasswordScreen(),
        '/password-changed-success': (context) => const PasswordChangedSuccessScreen(),
      },
    );
  }
}
