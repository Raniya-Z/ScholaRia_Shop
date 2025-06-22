
import 'package:flutter/material.dart';
import 's_inscrire.dart'; // la page d’inscription

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA), // fond blanc-gris
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Logo centré en haut
                Center(
                  child: Image.asset(
                    'assets/logo2.png',
                    width: 350,
                    height: 350,
                  ),
                ),
                const SizedBox(height: 30),

                // Titre rose
                const Text(
                  'Bienvenue sur ScholaRia Shop !',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFE61580),
                  ),
                ),

                const SizedBox(height: 10),

                // Texte noir
                const Text(
                  'Trouvez toutes vos fournitures scolaires en quelques clics, avec notre entreprise de confiance.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                  ),
                ),

                const Spacer(),
              ],
            ),
          ),

          // Bouton flèche positionné en haut à droite (plus haut que dans la colonne)
          Positioned(
            bottom: 90,
            right: 20,
            child: IconButton(
              icon: const Icon(Icons.arrow_forward_ios),
              color: Color(0xFFE61580), // flèche rose
              iconSize: 30,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PageInscription()),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
