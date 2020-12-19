import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:nekidaem_kanban/models/Tickets.dart';

//This class is a Singleton
class ApiClient {
  static final ApiClient _apiClient = ApiClient._internal();

  factory ApiClient() {
    return _apiClient;
  }

  ApiClient._internal();

  bool isAuthenticated = false;
  String token =
      'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoyMzksInVzZXJuYW1lIjoiYXJtYWRhIiwiZXhwIjoxNjA4NDEyMTc0LCJlbWFpbCI6IiIsIm9yaWdfaWF0IjoxNjA4NDA4NTc0fQ.O2kJC-P6-DbsmbSCnYpzfg6ZSJaRKSUh-AZ_F1DPWVo';

  Future<List<Ticket>> getTickets() async {
    final url = 'https://trello.backend.tests.nekidaem.ru/api/v1/cards/';
    final response = await http.get(url, headers: {
      'content-type': 'application/json',
      'accept': 'application/json',
      'Authorization': 'JWT $token',
    });
    return Ticket.fromJsonArray(utf8.decode(response.bodyBytes));
  }

  Future<ApiResponse> logIn({String username, String password}) async {
    final url = 'https://trello.backend.tests.nekidaem.ru/api/v1/users/login/';
    final response = await http.post(url,
        headers: {
          'content-type': 'application/json',
          'accept': 'application/json',
        },
        body: jsonEncode(
            <String, String>{'username': username, 'password': password}));
    if (response.statusCode == 200) {
      token = jsonDecode(response.body)['token'];
      return ApiResponse(true, '');
    } else {
      return ApiResponse(false, response.body);
    }
  }
}

class ApiResponse {
  String error;
  bool isAuthenticated;

  ApiResponse(isAuthenticated, error);
}
