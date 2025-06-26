
import 'package:flutter/material.dart';
import 'package:scholaria_shop_v1/Frontend/se_connecter.dart';

class PageInscription extends StatefulWidget {
  const PageInscription({super.key});

  @override
  _PageInscriptionState createState() => _PageInscriptionState();
}

class _PageInscriptionState extends State<PageInscription> {
  final _formKey = GlobalKey<FormState>();

  String nomComplet = '';
  String email = '';
  String motDePasse = '';
  String confirmationMotDePasse = '';

  bool etoileErreurNom = false;
  bool etoileErreurEmail = false;
  bool etoileErreurMotDePasse = false;
  bool etoileErreurConfirmation = false;

  bool cadreVertValideNom = false;
  bool cadreVertValideEmail = false;
  bool cadreVertValideMotDePasse = false;
  bool cadreVertValideConfirmation = false;

  final RegExp _regexNom = RegExp(r'^[a-zA-Z\s]{3,}$');
  final RegExp _regexEmail = RegExp(r'^.+@.+\..+$');
  final RegExp _regexMotDePasse = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[_#@]).{6,}$');

  bool cacherMotDePasse = true;
  bool cacherConfirmation = true;

  final Color couleurGris = Colors.grey.shade600;
  late FocusNode focusNom;
  late FocusNode focusEmail;
  late FocusNode focusMotDePasse;
  late FocusNode focusConfirmation;


  @override
  void initState() {
    super.initState();

    focusNom = FocusNode();
    focusEmail = FocusNode();
    focusMotDePasse = FocusNode();
    focusConfirmation = FocusNode();

    focusNom.addListener(() {
      if (focusNom.hasFocus) {
        setState(() {
          etoileErreurNom = true;
        });
      }
    });

    focusEmail.addListener(() {
      if (focusEmail.hasFocus) {
        setState(() {
          etoileErreurEmail = true;
        });
      }
    });

    focusMotDePasse.addListener(() {
      if (focusMotDePasse.hasFocus) {
        setState(() {
          etoileErreurMotDePasse = true;
        });
      }
    });

    focusConfirmation.addListener(() {
      if (focusConfirmation.hasFocus) {
        setState(() {
          etoileErreurConfirmation = true;
        });
      }
    });
  }

  @override
  void dispose() {
    focusNom.dispose();
    focusEmail.dispose();
    focusMotDePasse.dispose();
    focusConfirmation.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: const Color(0xFFFAFAFA),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                margin: const EdgeInsets.only(bottom: 0),
                child: Image.asset(
                  isDark ? 'assets/logo1_sombre.png' : 'assets/logo2.png',
                  width: 250,
                  height: 250,
                ),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Nom complet
                  TextFormField(
                    focusNode: focusNom,
                    cursorColor: couleurGris,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      label: RichText(
                        text: TextSpan(
                          text: 'Nom complet',
                          style: TextStyle(color: couleurGris, fontSize: 16),
                          children: etoileErreurNom
                              ? [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Colors.red),
                            )
                          ]
                              : [],
                        ),
                      ),
                      prefixIcon: Icon(Icons.person, color: couleurGris),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideNom ? Colors.green : Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideNom ? Colors.green : Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideNom ? Colors.green : Colors.grey.shade400),
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty &&
                          val.length >= 3 &&
                          _regexNom.hasMatch(val)) {
                        setState(() {
                          etoileErreurNom = false;
                          cadreVertValideNom = true;
                        });
                      } else {
                        setState(() {
                          etoileErreurNom = true;
                          cadreVertValideNom = false;
                        });
                      }
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        setState(() {
                          etoileErreurNom = true;
                          cadreVertValideNom = false;
                        });
                        return 'Ce champ est obligatoire';
                      }
                      if (val.length < 3) {
                        setState(() {
                          etoileErreurNom = true;
                          cadreVertValideNom = false;
                        });
                        return 'Au moins 3 caractères';
                      }
                      if (!_regexNom.hasMatch(val)) {
                        setState(() {
                          etoileErreurNom = true;
                          cadreVertValideNom = false;
                        });
                        return "Entrez votre nom complet Ex. 'Prénom' ou 'Prénom Nom' (lettres et espaces uniquement)";
                      }
                      setState(() {
                        etoileErreurNom = false;
                        cadreVertValideNom = true;
                      });
                      return null;
                    },
                    onSaved: (val) => nomComplet = val ?? '',
                  ),
                  if (cadreVertValideNom)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Correct',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                    ),


                  const SizedBox(height: 15),

                  // Email
                  TextFormField(
                    focusNode: focusEmail,
                    cursorColor: couleurGris,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      label: RichText(
                        text: TextSpan(
                          text: 'Adresse Email',
                          style: TextStyle(color: couleurGris, fontSize: 16),
                          children: etoileErreurEmail
                              ? [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Colors.red),
                            )
                          ]
                              : [],
                        ),
                      ),
                      prefixIcon: Icon(Icons.email, color: couleurGris),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideEmail ? Colors.green : Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideEmail ? Colors.green : Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: cadreVertValideEmail ? Colors.green : Colors.grey.shade400),
                      ),
                    ),
                    onChanged: (val) {
                      if (val.isNotEmpty && RegExp(r'^[\w\.\-]+@gmail\.com$').hasMatch(val)) {
                        setState(() {
                          etoileErreurEmail = false;
                          cadreVertValideEmail = true;
                        });
                      } else {
                        setState(() {
                          etoileErreurEmail = true;
                          cadreVertValideEmail = false;
                        });
                      }
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        setState(() {
                          etoileErreurEmail = true;
                          cadreVertValideEmail = false;
                        });
                        return 'Ce champ est obligatoire';
                      }
                      if (!RegExp(r'^[\w\.\-]+@gmail\.com$').hasMatch(val)) {
                        setState(() {
                          etoileErreurEmail = true;
                          cadreVertValideEmail = false;
                        });
                        return 'Email invalide Ex. exemple@gmail.com';
                      }
                      setState(() {
                        etoileErreurEmail = false;
                        cadreVertValideEmail = true;
                      });
                      return null;
                    },
                    onSaved: (val) => email = val ?? '',
                  ),

                  if (cadreVertValideEmail)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Correct',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                    ),


                  const SizedBox(height: 15),

                  // Mot de passe
                  TextFormField(
                    focusNode: focusMotDePasse,
                    cursorColor: couleurGris,
                    obscureText: cacherMotDePasse,
                    decoration: InputDecoration(
                      label: RichText(
                        text: TextSpan(
                          text: 'Mot de passe',
                          style: TextStyle(color: couleurGris, fontSize: 16),
                          children: etoileErreurMotDePasse
                              ? [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Colors.red),
                            )
                          ]
                              : [],
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock, color: couleurGris),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideMotDePasse ? Colors.green : Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideMotDePasse ? Colors.green : Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideMotDePasse ? Colors.green : Colors.grey.shade400),
                      ),
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
                    ),
                    onChanged: (val) {
                      motDePasse = val;
                      if (_regexMotDePasse.hasMatch(val)) {
                        setState(() {
                          cadreVertValideMotDePasse = true;
                          etoileErreurMotDePasse = false;
                        });
                      } else {
                        setState(() {
                          cadreVertValideMotDePasse = false;
                        });
                      }
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        setState(() {
                          etoileErreurMotDePasse = true;
                          cadreVertValideMotDePasse = false;
                        });
                        return 'Ce champ est obligatoire';
                      }
                      if (!_regexMotDePasse.hasMatch(val)) {
                        setState(() {
                          etoileErreurMotDePasse = true;
                          cadreVertValideMotDePasse = false;
                        });
                        return 'Min. 6 caractères avec une lettre, un chiffre et un caractère spécial (_, #, @)';
                      }
                      setState(() {
                        etoileErreurMotDePasse = false;
                        cadreVertValideMotDePasse = true;
                      });
                      return null;
                    },
                  ),
                  if (cadreVertValideMotDePasse)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Correct',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                    ),

                  const SizedBox(height: 15),

                  // Confirmation mot de passe
                  TextFormField(
                    focusNode: focusConfirmation,
                    cursorColor: couleurGris,
                    obscureText: cacherConfirmation,
                    decoration: InputDecoration(
                      label: RichText(
                        text: TextSpan(
                          text: 'Confirmer le mot de passe',
                          style: TextStyle(color: couleurGris, fontSize: 16),
                          children: etoileErreurConfirmation
                              ? [
                            TextSpan(
                              text: ' *',
                              style: TextStyle(color: Colors.red),
                            )
                          ]
                              : [],
                        ),
                      ),
                      prefixIcon: Icon(Icons.lock, color: couleurGris),
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: const EdgeInsets.symmetric(vertical: 6),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideConfirmation ? Colors.green : Colors.grey.shade400),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideConfirmation ? Colors.green : Colors.grey.shade400),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: cadreVertValideConfirmation ? Colors.green : Colors.grey.shade400),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          cacherConfirmation ? Icons.visibility_off : Icons.visibility,
                          color: couleurGris,
                        ),
                        onPressed: () {
                          setState(() {
                            cacherConfirmation = !cacherConfirmation;
                          });
                        },
                      ),
                    ),
                    onChanged: (val) {
                      confirmationMotDePasse = val;
                      if (val == motDePasse && val.length >= 6) {
                        setState(() {
                          cadreVertValideConfirmation = true;
                          etoileErreurConfirmation = false;
                        });
                      } else {
                        setState(() {
                          cadreVertValideConfirmation = false;
                        });
                      }
                    },
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        setState(() {
                          etoileErreurConfirmation = true;
                          cadreVertValideConfirmation = false;
                        });
                        return 'Ce champ est obligatoire';
                      }
                      if (val != motDePasse) {
                        setState(() {
                          etoileErreurConfirmation = true;
                          cadreVertValideConfirmation = false;
                        });
                        return 'Les mots de passe ne correspondent pas';
                      }
                      setState(() {
                        etoileErreurConfirmation = false;
                        cadreVertValideConfirmation = true;
                      });
                      return null;
                    },
                    onSaved: (val) => confirmationMotDePasse = val ?? '',
                  ),
                  if (cadreVertValideConfirmation)
                    Padding(
                      padding: const EdgeInsets.only(top: 4, right: 12),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'Correct',
                          style: TextStyle(color: Colors.green, fontSize: 12),
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),

                  // Bouton S'inscrire
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(0,10),
                        backgroundColor: const Color(0xFFE61580),
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                        padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 4),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Bienvenue, $nomComplet !')),
                          );
                        }
                      },
                      child: const Text(
                        'S’inscrire',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),

                  // "ou"
                  Row(
                    children: [
                      Expanded(child: Divider(color: Color(0xFFE61580))),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text("ou"),
                      ),
                      Expanded(child: Divider(color: Color(0xFFE61580))),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Google
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image.asset('assets/google.jpeg', height: 20),
                      label: const Text(
                        'Continuer avec Google',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Facebook
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      icon: Image.asset('assets/facebook.jpeg', height: 20),
                      label: const Text(
                        'Continuer avec Facebook',
                        style: TextStyle(color: Colors.black),
                      ),
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),

// Message avec lien "Login"
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Déjà vous avez un compte ? ',
                        style: TextStyle(color: Colors.grey.shade600),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_formKey.currentState?.validate() ?? false) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SeConnecter(nomComplet: '',)),
                            );
                          }
                        },
                        child: const Text(
                          ' Login',
                          style: TextStyle(
                            color: Color(0xFFE61580), // rose
                            fontWeight: FontWeight.bold,

                          ),
                        ),
                      ),

                    ],
                  ),



                  // effacer apres selement pour passer voir le design facilement
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
                          MaterialPageRoute(builder: (context) => const SeConnecter(nomComplet: '',)),
                        );
                      },
                    ),
                  ),

                  Positioned(
                    bottom: 90,
                    left: 20,
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back_ios), // flèche vers la gauche
                      color: Color(0xFFE61580), // rose
                      iconSize: 30,
                      onPressed: () {
                        Navigator.pop(context); // revenir à la page précédente
                      },
                    ),
                  ),




                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
