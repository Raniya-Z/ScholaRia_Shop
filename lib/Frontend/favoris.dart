import 'package:flutter/material.dart';

class PageFavoris extends StatelessWidget {
  const PageFavoris({super.key});

  final Color grisClair = const Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grisClair,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.favorite_border, size: 40, color: Colors.grey.shade500),
            const SizedBox(height: 12),
            Text(
              'Ajoutez des produits à vos favoris.',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
