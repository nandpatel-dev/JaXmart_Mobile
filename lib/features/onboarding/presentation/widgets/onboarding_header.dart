import 'package:flutter/material.dart';

class OnboardingHeader extends StatelessWidget {
  final VoidCallback onClose;

  const OnboardingHeader({
    super.key,
    required this.onClose,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + 16,
        left: 24,
        right: 24,
        bottom: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo placeholder or text
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: BoxDecoration(
                  color: const Color(0xFFB45309),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Center(
                  child: Text(
                    'J',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'JaXmart',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF0F172A),
                  letterSpacing: -0.5,
                ),
              ),
            ],
          ),
          
          // Close button
          GestureDetector(
            onTap: onClose,
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F7),
                borderRadius: BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.close_rounded,
                color: Color(0xFF0F172A),
                size: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
