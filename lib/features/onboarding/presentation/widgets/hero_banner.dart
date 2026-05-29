import 'package:flutter/material.dart';

class HeroBanner extends StatelessWidget {
  final String? imageUrl;
  final Widget? customChild;

  const HeroBanner({
    super.key,
    this.imageUrl,
    this.customChild,
  }) : assert(imageUrl != null || customChild != null,
            'Either imageUrl or customChild must be provided');

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF0F172A).withValues(alpha: 0.08),
            blurRadius: 24,
            offset: const Offset(0, 12),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28),
        child: customChild != null
            ? customChild!
            : _buildNetworkImage(imageUrl!),
      ),
    );
  }

  Widget _buildNetworkImage(String url) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Container(color: const Color(0xFFE2E8F0)),
        url.startsWith('assets/')
            ? Image.asset(url, fit: BoxFit.cover)
            : Image.network(
                url,
                fit: BoxFit.cover,
                loadingBuilder: (context, child, loadingProgress) {
                  if (loadingProgress == null) return child;
                  return Center(
                    child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              (loadingProgress.expectedTotalBytes ?? 1)
                          : null,
                      valueColor: const AlwaysStoppedAnimation<Color>(
                          Color(0xFF10B981)),
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: const Color(0xFFF1F5F9),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_outlined,
                            size: 64,
                            color:
                                const Color(0xFF0F172A).withValues(alpha: 0.2)),
                        const SizedBox(height: 12),
                        Text(
                          'Image Preview',
                          style: TextStyle(
                            color:
                                const Color(0xFF0F172A).withValues(alpha: 0.4),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
        // Subtle overlay gradient
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.black.withValues(alpha: 0.0),
                Colors.black.withValues(alpha: 0.05),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
