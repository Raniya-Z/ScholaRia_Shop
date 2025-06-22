import 'package:flutter/material.dart';
import 's_inscrire.dart'; // Assure-toi que ce fichier existe

class SeConnecter extends StatefulWidget {
  const SeConnecter({super.key});

  @override
  _SeConnecterState createState() => _SeConnecterState();
}

class _SeConnecterState extends State<SeConnecter> {
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String motDePasse = '';
  bool cacherMotDePasse = true;
  bool rememberMe = false;

  final Color couleurGris = Colors.grey.shade600;

  final FocusNode focusEmail = FocusNode();
  final FocusNode focusMotDePasse = FocusNode();

  @override
  void dispose() {
    focusEmail.dispose();
    focusMotDePasse.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const SizedBox(height: 20),
                Center(
                  child: Container(
                    margin: const EdgeInsets.only(bottom: 0),
                    child: Image.asset(
                      'assets/logo2.png',
                      width: 250,
                      height: 250,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Email
                TextFormField(
                  focusNode: focusEmail,
                  cursorColor: couleurGris,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Adresse Email', style: TextStyle(color: couleurGris, fontSize: 16)),
                    prefixIcon: Icon(Icons.email, color: couleurGris),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                ),

                const SizedBox(height: 16),

                // Mot de passe
                TextFormField(
                  focusNode: focusMotDePasse,
                  cursorColor: couleurGris,
                  obscureText: cacherMotDePasse,
                  decoration: InputDecoration(
                    label: Text('Mot de passe', style: TextStyle(color: couleurGris, fontSize: 16)),
                    prefixIcon: Icon(Icons.lock, color: couleurGris),
                    suffixIcon: IconButton(
                      icon: Icon(
                        cacherMotDePasse ? Icons.visibility_off : Icons.visibility,
                        color: couleurGris,
                      ),
                      onPressed: () {
                        setState(() {
                          cacherMotDePasse = !cacherMotDePasse;
                        });
                      },
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.symmetric(vertical: 6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                  ),
                  onChanged: (val) {
                    setState(() {
                      motDePasse = val;
                    });
                  },
                ),

                const SizedBox(height: 30),

                // Remember Me + Forgot Password
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: rememberMe,
                          onChanged: (value) {
                            setState(() {
                              rememberMe = value ?? false;
                            });
                          },
                        ),
                        Text("Se souvenir de moi", style: TextStyle(color: couleurGris)),
                      ],
                    ),
                    TextButton(
                      onPressed: () {
                        // action mot de passe oublié
                      },
                      child: const Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(color: Color(0xFFE61580), fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),

                const SizedBox(height: 16),

                // Bouton Se connecter
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      // Ici tu peux utiliser email, motDePasse et rememberMe
                      print('Email: $email');
                      print('Mot de passe: $motDePasse');
                      print('Remember Me: $rememberMe');
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Connexion tentée avec $email')),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFE61580),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                    child: const Text("Se connecter"),
                  ),
                ),

                const SizedBox(height: 16),

                // OU
                Row(
                  children: [
                    const Expanded(child: Divider(color: Color(0xFFE61580))),
                    const SizedBox(width: 8),
                    Text("ou", style: TextStyle(color: couleurGris)),
                    const SizedBox(width: 8),
                    const Expanded(child: Divider(color: Color(0xFFE61580))),
                  ],
                ),

                const SizedBox(height: 16),

                // Google / Facebook
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset("assets/google.png", height: 20),
                      label: const Text("Google"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: Image.asset("assets/facebook.png", height: 20),
                      label: const Text("Facebook"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Lien vers inscription
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const PageInscription()),
                    );
                  },
                  child: const Text(
                    "Don’t have an account? Register",
                    style: TextStyle(
                      color: Color(0xFFE61580),
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
