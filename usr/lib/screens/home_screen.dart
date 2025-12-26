import 'package:flutter/material.dart';
import '../widgets/glass_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.directions_car_filled, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(
              'ForssaCars',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.language),
            onPressed: () {
              // TODO: Implement Language Switcher
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Language Switcher: AR | EN | FR | CN')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.notifications_outlined),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: Stack(
        children: [
          // Background Gradient
          Positioned.fill(
            child: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: isDark
                      ? [const Color(0xFF0F172A), const Color(0xFF1E1B4B)]
                      : [const Color(0xFFF1F5F9), const Color(0xFFDBEAFE)],
                ),
              ),
            ),
          ),
          // Decorative Blobs
          Positioned(
            top: -100,
            right: -100,
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                blurRadius: 100,
              ),
            ),
          ),
          
          // Main Content
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Hero Section
                  GlassCard(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Find Your Dream Car',
                          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: isDark ? Colors.white : Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'AI-Powered Marketplace for Algeria & Beyond',
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: isDark ? Colors.white70 : Colors.black54,
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Search Bar
                        Container(
                          decoration: BoxDecoration(
                            color: isDark ? Colors.black26 : Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            border: Border.all(color: Colors.white24),
                          ),
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: 'Search make, model, or part...',
                              prefixIcon: const Icon(Icons.search),
                              border: InputBorder.none,
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                              suffixIcon: Container(
                                margin: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: Theme.of(context).colorScheme.primary,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: const Icon(Icons.tune, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Categories
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildCategoryItem(context, Icons.directions_car, 'Cars', true),
                      _buildCategoryItem(context, Icons.build, 'Parts', false),
                      _buildCategoryItem(context, Icons.gavel, 'Auctions', false),
                      _buildCategoryItem(context, Icons.local_shipping, 'Shipping', false),
                    ],
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // Featured Section Header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Urgent Sales',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text('View All'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 12),
                  
                  // Featured List (Horizontal)
                  SizedBox(
                    height: 280,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return _buildCarCard(context, index);
                      },
                    ),
                  ),
                  
                  const SizedBox(height: 24),
                  
                  // AI Features Banner
                  GlassCard(
                    color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
                            shape: BoxShape.circle,
                          ),
                          child: Icon(Icons.auto_awesome, color: Theme.of(context).colorScheme.primary, size: 32),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'AI Inspection Assistant',
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                'Upload photos to detect scratches & damage automatically.',
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.arrow_forward_ios, size: 16, color: Theme.of(context).colorScheme.primary),
                      ],
                    ),
                  ),
                  
                  const SizedBox(height: 80), // Bottom padding for FAB
                ],
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home_outlined), selectedIcon: Icon(Icons.home), label: 'Home'),
          NavigationDestination(icon: Icon(Icons.search_outlined), selectedIcon: Icon(Icons.search), label: 'Explore'),
          NavigationDestination(icon: Icon(Icons.add_circle_outline), selectedIcon: Icon(Icons.add_circle), label: 'Sell'),
          NavigationDestination(icon: Icon(Icons.chat_bubble_outline), selectedIcon: Icon(Icons.chat_bubble), label: 'Chat'),
          NavigationDestination(icon: Icon(Icons.person_outline), selectedIcon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildCategoryItem(BuildContext context, IconData icon, String label, bool isSelected) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: isSelected ? colorScheme.primary : colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16),
            boxShadow: isSelected
                ? [BoxShadow(color: colorScheme.primary.withOpacity(0.4), blurRadius: 10, offset: const Offset(0, 4))]
                : [],
          ),
          child: Icon(
            icon,
            color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
            size: 28,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: TextStyle(
            fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
            color: isSelected ? colorScheme.primary : colorScheme.onSurface,
          ),
        ),
      ],
    );
  }

  Widget _buildCarCard(BuildContext context, int index) {
    return Container(
      width: 220,
      margin: const EdgeInsets.only(right: 16),
      child: GlassCard(
        padding: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Placeholder
            Container(
              height: 120,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                image: const DecorationImage(
                  image: NetworkImage('https://images.unsplash.com/photo-1494976388531-d1058494cdd8?q=80&w=2070&auto=format&fit=crop'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Text(
                        'URGENT',
                        style: TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Mercedes-Benz C-Class',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '2023 • 15,000 km',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '8,500,000 DZD',
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
