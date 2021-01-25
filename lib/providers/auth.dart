import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/http_exception.dart';

class Auth with ChangeNotifier {
  String _token;
  DateTime _expiryDate;
  String _userId;

  Future<void> _authenticate(String email, String password, String part) async {
    try {
      final url =
          "https://identitytoolkit.googleapis.com/v1/accounts:$part?key=AIzaSyAO8GeCHReKxTmk-J66V2YLwMPkf7ai1xM";
      final response = await http.post(
        url,
        body: json.encode(
          {
            'email': email,
            'password': password,
            'returnSecureToken': true,
          },
        ),
      );
      //checking for error in try block as error code of get and post request in rest api is also 200, so only message body can tell there is an error.

      final responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        //there is an error.
        throw HttpException(responseData['error']['message']);
      }
    } catch (error) {
      throw (error);
    }
  }

  Future<void> signup(String email, String password) async {
    return _authenticate(email, password, 'signUp');
  }

  Future<void> login(String email, String password) async {
    return _authenticate(email, password, 'signInWithPassword');
  }
}
