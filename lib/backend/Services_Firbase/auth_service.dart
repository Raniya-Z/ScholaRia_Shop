// auth_service.dart
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  // Instance FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Récupérer l'utilisateur actuel
  User? get currentUser => _auth.currentUser;

  // Stream pour écouter les changements d'état de connexion
  Stream<User?> get authStateChanges => _auth.authStateChanges();

  /// ----------------------
  /// INSCRIPTION avec nom + email + mot de passe
  /// ----------------------
  Future<User?> signUpWithName(String nom, String email, String password) async {
    try {
      // Créer le compte Firebase Auth
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      User? user = userCredential.user;

      if (user != null) {
        // Mettre à jour le displayName
        await user.updateDisplayName(nom);

        // 🔹 Important : recharger l'utilisateur pour que displayName soit à jour
        await user.reload();
        user = _auth.currentUser;

        // Sauvegarder dans Firestore
        await FirebaseFirestore.instance.collection('users').doc(user!.uid).set({
          'uid': user.uid,
          'nom': nom,
          'email': email,
          'date_creation': DateTime.now(),
        });
      }

      return user;
    } on FirebaseAuthException catch (e) {
      print('Erreur d\'inscription : ${e.message}');
      return null;
    } catch (e) {
      print('Erreur inattendue : $e');
      return null;
    }
  }

  /// ----------------------
  /// CONNEXION avec email + mot de passe
  /// ----------------------
  Future<User?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('Erreur de connexion : ${e.message}');
      return null;
    } catch (e) {
      print('Erreur inattendue : $e');
      return null;
    }
  }

  /// ----------------------
  /// DÉCONNEXION
  /// ----------------------
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Erreur lors de la déconnexion : $e');
    }
  }

  /// ----------------------
  /// RÉINITIALISATION MOT DE PASSE
  /// ----------------------
  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      print('Erreur réinitialisation mot de passe : ${e.message}');
    }
  }

  /// ----------------------
  /// RÉCUPÉRER INFOS UTILISATEUR DE FIRESTORE
  /// ----------------------
  Future<DocumentSnapshot<Map<String, dynamic>>?> getUserInfo(String uid) async {
    try {
      return await FirebaseFirestore.instance.collection('users').doc(uid).get();
    } catch (e) {
      print("Erreur récupération infos user: $e");
      return null;
    }
  }
}
