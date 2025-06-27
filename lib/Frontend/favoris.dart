import 'package:flutter/material.dart';

class PageFavoris extends StatelessWidget {
  const PageFavoris({super.key});

  final Color grisClair = const Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color backgroundColor = isDark ? const Color(0xFF121212) : grisClair;
    final Color iconTextColor = isDark ? Colors.grey.shade400 : Colors.grey.shade500;

    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 40, color: iconTextColor),
            const SizedBox(height: 12),
            Text(
              'Ajoutez des produits à vos favoris.',
              style: TextStyle(color: iconTextColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
