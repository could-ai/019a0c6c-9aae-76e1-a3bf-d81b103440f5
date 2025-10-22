import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoggedIn = false;
  bool _isProfessor = false;
  String _userName = '';

  bool get isLoggedIn => _isLoggedIn;
  bool get isProfessor => _isProfessor;
  String get userName => _userName;

  void login(bool isProfessor, String userName) {
    _isLoggedIn = true;
    _isProfessor = isProfessor;
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _isLoggedIn = false;
    _isProfessor = false;
    _userName = '';
    notifyListeners();
  }
}