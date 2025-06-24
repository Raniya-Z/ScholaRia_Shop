import 'package:flutter/material.dart';

class PageCompte extends StatefulWidget {
  final String nomUtilisateur;
  final String nomEntreprise;

  const PageCompte({
    super.key,
    required this.nomUtilisateur,
    required this.nomEntreprise,
  });

  @override
  State<PageCompte> createState() => _PageCompteState();
}

class _PageCompteState extends State<PageCompte> {
  final Color rose = const Color(0xFFE61580);
  final Color grisClair = const Color(0xFFFAFAFA);
  final Color grisTexte = Colors.grey.shade600;

  bool _selectedUser = false;
  bool _selectedEntreprise = false;

  void _selectUser() {
    setState(() {
      _selectedUser = true;
      _selectedEntreprise = false;
    });
  }

  void _selectEntreprise() {
    setState(() {
      _selectedUser = false;
      _selectedEntreprise = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grisClair,
      body: SafeArea(
        child: Column(
          children: [
            // Logo centré en haut
            Container(
              padding: const EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              child: Image.asset(
                'assets/logo2.png',
                width: 250,
                height:250,
                fit: BoxFit.contain,
              ),
            ),

            const SizedBox(height: 10),

            // Contenu principal : 2 containers cliquables
            Center(
              child: Container(
                padding: const EdgeInsets.all(16),
                width: MediaQuery.of(context).size.width * 0.82,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade300,
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Container Nom complet
                    GestureDetector(
                      onTap: _selectUser,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: _selectedUser ? rose.withOpacity(0) : Colors.transparent,
                          border: Border.all(color: _selectedUser ? rose : Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.person, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.nomUtilisateur,
                              style: TextStyle(fontSize: 20, color: grisTexte),
                            ),
                          ],
                        ),
                      ),
                    ),

                    // Container Nom entreprise
                    GestureDetector(
                      onTap: _selectEntreprise,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        decoration: BoxDecoration(
                          color: _selectedEntreprise ? rose.withOpacity(0) : Colors.transparent,
                          border: Border.all(color: _selectedEntreprise ? rose : Colors.grey.shade400),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          children: [
                            const SizedBox(width: 12),
                            const CircleAvatar(
                              radius: 22,
                              backgroundColor: Colors.grey,
                              child: Icon(Icons.business, color: Colors.white),
                            ),
                            const SizedBox(width: 16),
                            Text(
                              widget.nomEntreprise,
                              style: TextStyle(fontSize: 20, color: grisTexte),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
