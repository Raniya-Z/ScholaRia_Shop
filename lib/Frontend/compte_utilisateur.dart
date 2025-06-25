import 'package:flutter/material.dart';

class CompteUtilisateurPage extends StatefulWidget {
  final String nomUtilisateur;

  const CompteUtilisateurPage({super.key, required this.nomUtilisateur});

  @override
  State<CompteUtilisateurPage> createState() => _CompteUtilisateurPageState();
}

class _CompteUtilisateurPageState extends State<CompteUtilisateurPage> {
  final Color rose = const Color(0xFFE61580);
  final Color grisClair = const Color(0xFFFAFAFA);
  final Color grisTexte = Colors.grey.shade600;

  int selectedIndex = -1;

  List<Map<String, dynamic>> options = [
    {"icon": Icons.person_outline, "label": "Informations personnelles"},
    {"icon": Icons.language, "label": "Langue"},
    {"icon": Icons.dark_mode_outlined, "label": "Thème / Mode sombre"},
    {"icon": Icons.payment_outlined, "label": "Paiement"},
    {"icon": Icons.delete_outline, "label": "Supprimer le compte"},
    {"icon": Icons.feedback_outlined, "label": "Feedback"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grisClair,
      body: SafeArea(
        child: Column(
          children: [
            // --- Logo et retour ---
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Image.asset('assets/logo2.png', width: 50, height: 50),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: rose,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),

            // --- Container principal avec photo + nom ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade300,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 35,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 30),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 12,
                          backgroundColor: rose,
                          child: const Icon(Icons.edit, size: 14, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.nomUtilisateur,
                      style: TextStyle(fontSize: 18, color: grisTexte, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // --- Options ---
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: options.length,
                itemBuilder: (context, index) {
                  final item = options[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                      // TODO: ouvrir une page ou afficher un message
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == index ? rose.withOpacity(0.05) : Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedIndex == index ? rose : Colors.grey.shade300,
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(item["icon"], color: rose),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Text(
                              item["label"],
                              style: TextStyle(
                                fontSize: 16,
                                color: grisTexte,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
