import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> authenticate(String email, String password, String part) async {
    final url =
        "https://identitytoolkit.googleapis.com/v1/accounts:$part?key=AIzaSyAO8GeCHReKxTmk-J66V2YLwMPkf7ai1xM";
    final response = await http.post(url,
        body: json.encode({
          'email': email,
          'password': password,
          'returnSecureToken': true,
        }));
    print(
      json.decode(response.body),
    );
  }

  Future<void> signup(String email, String password) async {
    authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    authenticate(email, password, 'signInWithPassword');
  }
}
