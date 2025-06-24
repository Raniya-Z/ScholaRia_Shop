import 'package:flutter/material.dart';

class PageNotifications extends StatelessWidget {
  const PageNotifications({super.key});

  final Color grisClair = const Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: grisClair,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.notifications_none_outlined, size: 40, color: Colors.grey.shade500),
            const SizedBox(height: 12),
            Text(
              'Aucune notification pour le moment.',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
