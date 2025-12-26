import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.transparent,
      ),
      extendBodyBehindAppBar: true,
      body: Stack(
        children: [
          // Background
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [
                  Theme.of(context).colorScheme.secondary,
                  Theme.of(context).colorScheme.primary,
                ],
              ),
            ),
          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(24),
              child: GlassCard(
                opacity: 0.15,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Create Account',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 32),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Full Name',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.person, color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Email Address',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.email, color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white.withOpacity(0.1),
                        hintText: 'Password',
                        hintStyle: const TextStyle(color: Colors.white70),
                        prefixIcon: const Icon(Icons.lock, color: Colors.white70),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Theme.of(context).colorScheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text('Sign Up', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
