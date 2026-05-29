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
                        imageUrl: index == 0
                            ? 'assets/images/b2b_world_map_green.png'
                            : null,
                        customChild: index == 0
                            ? null
                            : (index == 1
                                ? _ScaleBusinessBanner()
                                : _StartSourcingBanner()),
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

// ─── Page 2 Banner: Scale Your Business ──────────────────────────────────────
class _ScaleBusinessBanner extends StatelessWidget {
  const _ScaleBusinessBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF064E3B), Color(0xFF10B981), Color(0xFF34D399)],
          stops: [0.0, 0.55, 1.0],
        ),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            top: -30, right: -30,
            child: Container(
              width: 140, height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.07),
              ),
            ),
          ),
          Positioned(
            bottom: -20, left: -20,
            child: Container(
              width: 100, height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withValues(alpha: 0.05),
              ),
            ),
          ),
          // Main content
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top label
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.trending_up_rounded, color: Colors.white, size: 14),
                      SizedBox(width: 6),
                      Text('Growth Engine', style: TextStyle(color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                // Central icon cluster
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _BannerIconCard(icon: Icons.inventory_2_rounded, label: 'Inventory'),
                      const SizedBox(width: 16),
                      _BannerIconCard(icon: Icons.receipt_long_rounded, label: 'Orders', large: true),
                      const SizedBox(width: 16),
                      _BannerIconCard(icon: Icons.local_shipping_rounded, label: 'Delivery'),
                    ],
                  ),
                ),
                // Bottom stats row
                Row(
                  children: [
                    _StatChip(value: '10K+', label: 'Suppliers'),
                    const SizedBox(width: 10),
                    _StatChip(value: '99.9%', label: 'Uptime'),
                    const SizedBox(width: 10),
                    _StatChip(value: '24/7', label: 'Support'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Page 3 Banner: Start Sourcing Today ─────────────────────────────────────
class _StartSourcingBanner extends StatelessWidget {
  const _StartSourcingBanner();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Color(0xFF0F172A), Color(0xFF1E3A5F), Color(0xFF0F172A)],
          stops: [0.0, 0.5, 1.0],
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: -40, left: -40,
            child: Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10B981).withValues(alpha: 0.12),
              ),
            ),
          ),
          Positioned(
            bottom: 10, right: -30,
            child: Container(
              width: 110, height: 110,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: const Color(0xFF10B981).withValues(alpha: 0.08),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(28),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10B981).withValues(alpha: 0.2),
                    borderRadius: BorderRadius.circular(100),
                    border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.5)),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.rocket_launch_rounded, color: Color(0xFF10B981), size: 14),
                      SizedBox(width: 6),
                      Text('Ready to Launch', style: TextStyle(color: Color(0xFF10B981), fontSize: 12, fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
                Center(
                  child: Container(
                    width: 88, height: 88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF10B981).withValues(alpha: 0.15),
                      border: Border.all(color: const Color(0xFF10B981).withValues(alpha: 0.4), width: 2),
                    ),
                    child: const Icon(Icons.storefront_rounded, color: Color(0xFF10B981), size: 42),
                  ),
                ),
                Row(
                  children: [
                    _StatChip(value: '500+', label: 'Partners', dark: false),
                    const SizedBox(width: 10),
                    _StatChip(value: '\$2B+', label: 'Volume', dark: false),
                    const SizedBox(width: 10),
                    _StatChip(value: '40+', label: 'Countries', dark: false),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Shared Helper Widgets ────────────────────────────────────────────────────
class _BannerIconCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool large;
  const _BannerIconCard({required this.icon, required this.label, this.large = false});

  @override
  Widget build(BuildContext context) {
    final size = large ? 56.0 : 44.0;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: size, height: size,
          decoration: BoxDecoration(
            color: Colors.white.withValues(alpha: large ? 0.25 : 0.15),
            borderRadius: BorderRadius.circular(large ? 16 : 12),
            border: Border.all(color: Colors.white.withValues(alpha: 0.3)),
          ),
          child: Icon(icon, color: Colors.white, size: large ? 28 : 22),
        ),
        const SizedBox(height: 6),
        Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.85), fontSize: 11, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class _StatChip extends StatelessWidget {
  final String value;
  final String label;
  final bool dark;
  const _StatChip({required this.value, required this.label, this.dark = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: dark ? Colors.white.withValues(alpha: 0.12) : const Color(0xFF10B981).withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: dark ? Colors.white.withValues(alpha: 0.2) : const Color(0xFF10B981).withValues(alpha: 0.4)),
      ),
      child: Column(
        children: [
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 14, fontWeight: FontWeight.w700)),
          Text(label, style: TextStyle(color: Colors.white.withValues(alpha: 0.7), fontSize: 10)),
        ],
      ),
    );
  }
}
