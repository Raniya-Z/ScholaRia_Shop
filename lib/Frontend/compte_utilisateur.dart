import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scholaria_shop_v1/Frontend/theme_provider.dart';

class CompteUtilisateurPage extends StatefulWidget {
  final String nomUtilisateur;

  const CompteUtilisateurPage({super.key, required this.nomUtilisateur});

  @override
  State<CompteUtilisateurPage> createState() => _CompteUtilisateurPageState();
}

class _CompteUtilisateurPageState extends State<CompteUtilisateurPage> {
  bool showThemeSwitch = false;
  int selectedIndex = -1;

  final Color rose = const Color(0xFFE61580);

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
    final themeProvider = Provider.of<ThemeProvider>(context);
    final bool isDarkMode = themeProvider.isDarkMode;

    final Color backgroundColor = Theme.of(context).scaffoldBackgroundColor;
    final Color cardColor = Theme.of(context).cardColor;
    final Color borderColor = isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;
    final Color textColor = isDarkMode ? Colors.white70 : Colors.grey.shade800;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back_ios),
                    color: rose,
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // --- Utilisateur ---
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: borderColor),
              ),
              child: Row(
                children: [
                  Stack(
                    children: [
                      const CircleAvatar(
                        radius: 28,
                        backgroundColor: Colors.grey,
                        child: Icon(Icons.person, color: Colors.white, size: 26),
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: rose,
                          child: const Icon(Icons.edit, size: 12, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Text(
                      widget.nomUtilisateur,
                      style: TextStyle(
                        fontSize: 16,
                        color: textColor,
                        fontWeight: FontWeight.w600,
                      ),
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
                  final bool isTheme = item["label"] == "Thème / Mode sombre";

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                        showThemeSwitch = isTheme ? !showThemeSwitch : false;
                      });
                    },
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      margin: const EdgeInsets.symmetric(vertical: 6),
                      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 12),
                      decoration: BoxDecoration(
                        color: selectedIndex == index ? rose.withOpacity(0) : cardColor,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: selectedIndex == index ? rose : borderColor,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(item["icon"], color: rose),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Text(
                                  item["label"],
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: textColor,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              isTheme
                                  ? Icon(
                                showThemeSwitch
                                    ? Icons.expand_less
                                    : Icons.expand_more,
                                color: Colors.grey,
                              )
                                  : const Icon(Icons.chevron_right, color: Colors.grey),
                            ],
                          ),
                          if (isTheme && showThemeSwitch)
                            Padding(
                              padding: const EdgeInsets.only(top: 12, left: 40),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Activer le mode sombre",
                                    style: TextStyle(color: textColor),
                                  ),
                                  Switch(
                                    value: isDarkMode,
                                    activeColor: rose,
                                    onChanged: (val) {
                                      themeProvider.toggleTheme(val);
                                    },
                                  ),
                                ],
                              ),
                            ),
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
