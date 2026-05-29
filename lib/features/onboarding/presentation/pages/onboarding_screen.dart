import 'package:flutter/material.dart';
import '../../../home/presentation/pages/home_screen.dart';
import '../controllers/onboarding_controller.dart';
import '../widgets/feature_card.dart';
import '../widgets/hero_banner.dart';
import '../widgets/onboarding_header.dart';
import '../widgets/pagination_indicator.dart';
import '../widgets/primary_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final OnboardingController _controller = OnboardingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const HomeScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: Column(
        children: [
          // 1. Top Header (Sticky)
          OnboardingHeader(
            onClose: () {
              _navigateToHome();
            },
          ),

          // Main Scrollable/Paging Content
          Expanded(
            child: PageView.builder(
              controller: _controller.pageController,
              onPageChanged: _controller.onPageChanged,
              itemCount: 3, // Support multiple pages dynamically
              itemBuilder: (context, index) {
                return SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 2. Hero Section
                      HeroBanner(
                        // Dynamic image based on index
                        imageUrl: index == 0
                            ? 'https://images.unsplash.com/photo-1586528116311-ad8ed7c1590f?q=80&w=1000&auto=format&fit=crop'
                            : (index == 1
                                ? 'https://images.unsplash.com/photo-1553413077-206dd5c3c1e3?q=80&w=1000&auto=format&fit=crop'
                                : 'https://images.unsplash.com/photo-1504328345606-18bbc8c9d7d1?q=80&w=1000&auto=format&fit=crop'),
                      ),
                      const SizedBox(height: 32),

                      // 3. Welcome Content
                      FadeTransition(
                        opacity: const AlwaysStoppedAnimation(1.0), // Can add complex animation here
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              index == 0
                                  ? 'Welcome to JaXmart'
                                  : (index == 1
                                      ? 'Scale Your Business'
                                      : 'Start Sourcing Today'),
                              style: const TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF0F172A),
                                letterSpacing: -1,
                                height: 1.2,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Text(
                              index == 0
                                  ? 'Engineered for high-velocity global supply chains. We bridge the gap between verified buyers and professional suppliers.'
                                  : (index == 1
                                      ? 'Leverage our advanced tools to manage your procurement process from start to finish seamlessly.'
                                      : 'Join thousands of enterprise partners already using JaXmart to revolutionize their supply chain.'),
                              style: TextStyle(
                                fontSize: 16,
                                color: const Color(0xFF0F172A).withValues(alpha: 0.65),
                                height: 1.6,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 32),

                      // 4. Feature Cards
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: index == 0 ? 2 : 1, // Dynamic based on page
                        itemBuilder: (context, featureIndex) {
                          final feature = index == 0
                              ? _controller.features[featureIndex]
                              : _controller.features[2]; // Use bulk ops for other pages
                          return FeatureCard(
                            icon: feature.icon,
                            title: feature.title,
                            subtitle: feature.subtitle,
                          );
                        },
                      ),
                      const SizedBox(height: 16),

                      // 5. CTA Button (Main content CTA)
                      if (index == 2) ...[
                        const SizedBox(height: 16),
                        PrimaryButton(
                          text: 'Explore JaXmart',
                          icon: Icons.arrow_forward_rounded,
                          onPressed: () {
                            _navigateToHome();
                          },
                        ),
                      ]
                    ],
                  ),
                );
              },
            ),
          ),

          // 6. Bottom Pagination + CTA Row
          Container(
            padding: EdgeInsets.only(
              left: 24,
              right: 24,
              top: 20,
              bottom: MediaQuery.of(context).padding.bottom + 20,
            ),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              border: Border(
                top: BorderSide(
                  color: const Color(0xFF0F172A).withValues(alpha: 0.05),
                ),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Back button (Left)
                Opacity(
                  opacity: _controller.currentIndex == 0 ? 0.0 : 1.0,
                  child: GestureDetector(
                    onTap: () {
                      if (_controller.currentIndex > 0) {
                        _controller.previousPage();
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(color: const Color(0xFF0F172A).withValues(alpha: 0.1)),
                        shape: BoxShape.circle,
                      ),
                      child: const Padding(
                        padding: EdgeInsets.only(left: 4.0),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Color(0xFF0F172A),
                          size: 18,
                        ),
                      ),
                    ),
                  ),
                ),
                
                // Pagination Indicator (Center)
                PaginationIndicator(
                  itemCount: 3,
                  currentIndex: _controller.currentIndex,
                ),
                
                // Secondary Explore / Next button
                GestureDetector(
                  onTap: () {
                    if (_controller.currentIndex < 2) {
                      _controller.nextPage();
                    } else {
                      _navigateToHome();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                    decoration: BoxDecoration(
                      color: _controller.currentIndex == 2
                          ? const Color(0xFF10B981)
                          : const Color(0xFF0F172A),
                      borderRadius: BorderRadius.circular(100), // Pill shape
                      boxShadow: [
                        BoxShadow(
                          color: (_controller.currentIndex == 2
                                  ? const Color(0xFF10B981)
                                  : const Color(0xFF0F172A))
                              .withValues(alpha: 0.2),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _controller.currentIndex == 2 ? 'Get Started' : 'Next',
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Icon(
                          _controller.currentIndex == 2
                              ? Icons.check_rounded
                              : Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                          size: 14,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
