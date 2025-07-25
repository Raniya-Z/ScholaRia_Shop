import 'package:flutter/material.dart';
import 'favoris.dart';       // <-- Import pour la page Favoris
import 'panier.dart';       // <-- Import pour la page Panier
import 'notifications.dart';// <-- Import pour la page Notifications
import 'compte.dart';       // <-- Import pour la page Compte

class PageAccueil extends StatefulWidget {
  const PageAccueil({super.key});

  @override
  State<PageAccueil> createState() => _PageAccueilState();
}

class _PageAccueilState extends State<PageAccueil> {
  int _selectedIndex = 0;

  final Color rose = const Color(0xFFE61580);

  final String nomUtilisateur = "Nom Utilisateur";
  final String nomEntreprise = "Nom Entreprise";

  // Widget personnalisé pour la page Accueil
  Widget _pageAccueil(Color backgroundColor, Color iconColor, Color textColor) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart_outlined, size: 40, color: iconColor),
            const SizedBox(height: 12),
            Text(
              'Ajoutez des produits à votre liste.',
              style: TextStyle(color: textColor, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final Color grisClair = isDark ? const Color(0xFF121212) : const Color(0xFFFAFAFA);
    final Color gris = isDark ? const Color(0xFF1E1E1E) : Colors.grey.shade200;
    final Color grisTexte = isDark ? Colors.white70 : Colors.grey.shade600;
    final Color iconTextColor = isDark ? Colors.grey.shade400 : Colors.grey.shade500;

    final List<Widget> _pages = [
      _pageAccueil(grisClair, iconTextColor, iconTextColor),
      const PageFavoris(),
      const PagePanier(),
      const PageNotifications(),
      PageCompte(nomUtilisateur: nomUtilisateur, nomEntreprise: nomEntreprise),
    ];

    return Scaffold(
      backgroundColor: grisClair,

      // AppBar visible uniquement si on n'est pas sur la page Compte (index 4)
      appBar: _selectedIndex != 4
          ? PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: Container(
          margin: const EdgeInsets.only(top: 15),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            automaticallyImplyLeading: false,
            title: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(
                    isDark ? 'assets/logo1_sombre.png' : 'assets/logo2.png',
                    width: 105,
                    height: 105,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: gris,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      children: [
                        Icon(Icons.search, color: iconTextColor),
                        const SizedBox(width: 6),
                        Text(
                          'Recherche',
                          style: TextStyle(
                            color: iconTextColor,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                IconButton(
                  icon: Icon(Icons.camera_alt, color: rose),
                  onPressed: () {
                    // Action caméra
                  },
                ),
              ],
            ),
          ),
        ),
      )
          : null,

      // Affiche la page sélectionnée
      body: Stack(
        children: [
          Container(
            color: grisClair,
            child: _pages[_selectedIndex],
          ),

          // Flèche retour (bas gauche)
          Positioned(
            bottom: 20,
            left: 20,
            child: FloatingActionButton(
              mini: true,
              backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
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
        backgroundColor: isDark ? const Color(0xFF1E1E1E) : Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: rose,
        unselectedItemColor: grisTexte,
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
