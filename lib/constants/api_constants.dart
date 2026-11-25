

import 'package:flutter/foundation.dart' show kIsWeb;

class ApiConstants {
  // static const String baseUrl = 'https://jsonplaceholder.typicode.com';
  static const String postsEndpoint = '/posts';
  static const String usersEndpoint = '/users';
  // Android emulator : 10.0.2.2
  // iOS simulator    : 127.0.0.1
  // HP asli          : IP laptop kamu (contoh 192.168.1.10)
  // Flutter Web      : localhost
  static const String baseUrl = kIsWeb
      ? 'http://10.10.8.184:8000/api'
      : 'http://10.10.8.184:8000/api'; // ganti sesuai IP laptop kamu

  static const String register = '$baseUrl/register';
  static const String login = '$baseUrl/login';
  static const String logout = '$baseUrl/logout';
  static const String user = '$baseUrl/user';

  static const String articles = '$baseUrl/articles'; // baru
}