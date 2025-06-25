import 'package:flutter/material.dart';

class CompteEntreprisePage extends StatefulWidget {
  final String nomEntreprise;

  const CompteEntreprisePage({super.key, required this.nomEntreprise});

  @override
  State<CompteEntreprisePage> createState() => _CompteEntreprisePageState();
}

class _CompteEntreprisePageState extends State<CompteEntreprisePage> {
  final Color rose = const Color(0xFFE61580);
  final Color grisClair = const Color(0xFFFAFAFA);
  final Color grisTexte = Colors.grey.shade700;

  // Controllers pour les champs modifiables
  final TextEditingController nomController = TextEditingController();
  final TextEditingController adresseController = TextEditingController();
  final TextEditingController telephoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool showContactBox = false;
  final TextEditingController contactMessageController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialiser les valeurs
    nomController.text = widget.nomEntreprise;
    adresseController.text = "123 Rue Exemple";
    telephoneController.text = "+212 6 12 34 56 78";
    emailController.text = "contact@entreprise.com";
  }

  @override
  void dispose() {
    nomController.dispose();
    adresseController.dispose();
    telephoneController.dispose();
    emailController.dispose();
    contactMessageController.dispose();
    super.dispose();
  }

  Widget buildEditableField(String label, TextEditingController controller, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Icon(icon, color: rose),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: label,
                border: const OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 10),
          IconButton(
            icon: Icon(Icons.edit, color: rose),
            onPressed: () {
              // Optionnel: focus le champ ou autre action
              FocusScope.of(context).requestFocus(FocusNode());
            },
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grisClair,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Row(
          children: [
            Image.asset('assets/logo2.png', width: 40, height: 40),
            const SizedBox(width: 8),
            Text('Compte Entreprise', style: TextStyle(color: rose)),
          ],
        ),
        iconTheme: IconThemeData(color: rose),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Grande image avec petit bouton icone (type Youtube)
            Stack(
              children: [
                Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: AssetImage('assets/entreprise_bg.jpg'), // remplace par ta grande image
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: CircleAvatar(
                    backgroundColor: Colors.white70,
                    child: IconButton(
                      icon: Icon(Icons.camera_alt, color: rose),
                      onPressed: () {
                        // Action modifier image
                      },
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Petit container avec image + nom entreprise
            Container(
              padding: const EdgeInsets.all(16),
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
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey.shade400,
                    child: Icon(Icons.business, color: Colors.white, size: 30),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Text(
                      widget.nomEntreprise,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: grisTexte),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.edit, color: rose),
                    onPressed: () {
                      // Modifier info entreprise ?
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Nos Coordonnées titre + ligne rose
            Text('Nos Coordonnées', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: grisTexte)),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              height: 3,
              width: 80,
              decoration: BoxDecoration(
                color: rose,
                borderRadius: BorderRadius.circular(2),
              ),
            ),

            // Infos modifiables
            Container(
              padding: const EdgeInsets.all(16),
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
                children: [
                  buildEditableField("Nom", nomController, Icons.business),
                  buildEditableField("Adresse", adresseController, Icons.location_on),
                  buildEditableField("Téléphone", telephoneController, Icons.phone),
                  buildEditableField("Email", emailController, Icons.email),

                  const SizedBox(height: 20),

                  // Bouton valider
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: rose,
                      minimumSize: const Size.fromHeight(50),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    ),
                    onPressed: () {
                      // Valider modifications
                    },
                    child: const Text('Valider', style: TextStyle(fontSize: 18)),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // Bouton Contacter
            Center(
              child: OutlinedButton.icon(
                icon: Icon(Icons.contact_mail, color: rose),
                label: Text('Contacter', style: TextStyle(color: rose)),
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: rose),
                  minimumSize: const Size(150, 45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  setState(() {
                    showContactBox = !showContactBox;
                  });
                },
              ),
            ),

            const SizedBox(height: 20),

            // Zone de texte de contact et bouton envoyer
            if (showContactBox) ...[
              TextField(
                controller: contactMessageController,
                maxLength: 100,
                maxLines: 3,
                decoration: InputDecoration(
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                  hintText: "Écrire un message...",
                  counterText: "${contactMessageController.text.length}/100",
                ),
                onChanged: (_) {
                  setState(() {}); // pour mettre à jour le compteur
                },
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  side: BorderSide(color: rose),
                  minimumSize: const Size.fromHeight(45),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  shadowColor: rose.withOpacity(0.5),
                  elevation: 4,
                ),
                onPressed: () {
                  // Envoyer le message
                  String msg = contactMessageController.text.trim();
                  if (msg.isNotEmpty) {
                    // Envoyer action ici
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text("Message envoyé")),
                    );
                    contactMessageController.clear();
                    setState(() {
                      showContactBox = false;
                    });
                  }
                },
                child: Text('Envoyer', style: TextStyle(color: rose)),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
