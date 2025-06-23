import 'package:flutter/material.dart';

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final Color rose = const Color(0xFFE61580);
  final Color gris = Colors.grey.shade600;
  final Color grisClair = const Color(0xFFFAFAFA);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grisClair,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            // Logo petit à gauche
            Image.asset(
              'assets/logo.png',
              width: 40,
              height: 40,
            ),

            const SizedBox(width: 10),

            // Barre de recherche
            Expanded(
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Icon(Icons.search, color: gris),
                    const SizedBox(width: 6),
                    Text(
                      'Recherche',
                      style: TextStyle(color: gris),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(width: 10),

            // Bouton caméra rose
            IconButton(
              icon: Icon(Icons.camera_alt, color: rose),
              onPressed: () {
                // Action caméra
              },
            ),
          ],
        ),
      ),

      // ✅ BODY avec Stack + flèche de retour en bas
      body: Stack(
        children: [
          Container(color: grisClair), // fond

          // 🔙 Flèche de retour en bas à gauche
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: Colors.white,
              onPressed: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back_ios, color: rose),
            ),
          ),
        ],
      ),

      // BottomNavigationBar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        selectedItemColor: rose,
        unselectedItemColor: gris,
        type: BottomNavigationBarType.fixed,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: 'Favoris',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Panier',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_outlined),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: 'Compte',
          ),
        ],
      ),
    );
  }
}
