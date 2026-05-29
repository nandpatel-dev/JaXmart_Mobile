import 'package:flutter/material.dart';

class PaginationIndicator extends StatelessWidget {
  final int itemCount;
  final int currentIndex;

  const PaginationIndicator({
    super.key,
    required this.itemCount,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        itemCount,
        (index) {
          final isActive = index == currentIndex;
          return AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            margin: const EdgeInsets.symmetric(horizontal: 4),
            height: 8,
            width: isActive ? 32 : 8,
            decoration: BoxDecoration(
              color: isActive
                  ? const Color(0xFF10B981)
                  : const Color(0xFF0F172A).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(4),
            ),
          );
        },
      ),
    );
  }
}
