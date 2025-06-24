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
  final Color gris = Colors.grey.shade200;
  final Color grisClair = const Color(0xFFFAFAFA);
  final Color grisTexte = Colors.grey.shade600;

  final String nomUtilisateur = "Nom Utilisateur";
  final String nomEntreprise = "Nom Entreprise";

  // Widget personnalisé pour la page Accueil
  Widget _pageAccueil() {
    return Container(
      color: grisClair,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.add_shopping_cart_outlined, size: 40, color: Colors.grey.shade500),
            const SizedBox(height: 12),
            Text(
              'Ajoutez des produits à votre liste.',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }

  // Liste des pages affichées selon l'index sélectionné
  late final List<Widget> _pages = [
    _pageAccueil(),
    const PageFavoris(),
    const PagePanier(),
    const PageNotifications(),
    PageCompte(nomUtilisateur: nomUtilisateur, nomEntreprise: nomEntreprise),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    'assets/logo2.png',
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
                        Icon(Icons.search, color: Colors.grey.shade500),
                        const SizedBox(width: 6),
                        Text(
                          'Recherche',
                          style: TextStyle(
                            color: Colors.grey.shade500,
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
          : null, // Pas d'AppBar sur la page Compte

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
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: rose,
        unselectedItemColor: Colors.grey.shade700,
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
