import 'package:flutter/material.dart';

class PagePanier extends StatelessWidget {
  const PagePanier({super.key});

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
            Icon(Icons.shopping_cart_outlined, size: 40, color: iconTextColor),
            const SizedBox(height: 12),
            Text(
              'Votre panier est vide.',
              style: TextStyle(color: iconTextColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}






/* 'package:flutter/material.dart';

class PagePanier extends StatelessWidget {
  const PagePanier({super.key});

  final Color grisClair = const Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grisClair,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined, size: 40, color: Colors.grey.shade500),
            const SizedBox(height: 12),
            Text(
              'Votre panier est vide.',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
*/