import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiServices {
  // Android emulator:
  // static const String baseUrl = 'http://10.0.2.2:8080/api';

  // For Windows desktop use:
  static const String baseUrl = 'http://localhost:8080/api';

  // =========================
  // REGISTER
  // =========================

  static Future<Map<String, dynamic>> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/register'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'fullName': fullName,
        'email': email,
        'phone': phone,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      return data;
    }

    throw Exception(
      data['message'] ?? 'Registration failed',
    );
  }

  // =========================
  // LOGIN
  // =========================

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
  }) async {
    final response = await http.post(
      Uri.parse('$baseUrl/auth/login'),
      headers: {
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      final token = data['token'];

      if (token == null) {
        throw Exception('Token not returned by server');
      }

      final prefs =
          await SharedPreferences.getInstance();

      await prefs.setString('token', token);

      return data;
    }

    throw Exception(
      data['message'] ?? 'Login failed',
    );
  }

  // =========================
  // CURRENT USER
  // =========================

  static Future<Map<String, dynamic>>
      getCurrentUser() async {
    final prefs =
        await SharedPreferences.getInstance();

    final token = prefs.getString('token');

    if (token == null || token.isEmpty) {
      throw Exception('User is not logged in');
    }

    final response = await http.get(
      Uri.parse('$baseUrl/users/me'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );

    final data = jsonDecode(response.body);

    if (response.statusCode >= 200 &&
        response.statusCode < 300) {
      return data;
    }

    throw Exception(
      data['message'] ??
          'Failed to load user profile',
    );
  }

  // =========================
  // LOGOUT
  // =========================

  static Future<void> logout() async {
    final prefs =
        await SharedPreferences.getInstance();

    await prefs.remove('token');
  }


}