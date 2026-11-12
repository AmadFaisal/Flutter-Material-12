import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:rpl2/constants/api_constants.dart';
import 'package:rpl2/models/user.dart';

class UserService {
  Future<List<UserModel>> fetchUsers() async {
    final url = Uri.parse(
      '${ApiConstants.baseUrl}${ApiConstants.usersEndpoint}',
    );

    try {
      final response = await http.get(url).timeout(const Duration(seconds: 10));

      if (response.statusCode == 200) {
        final data = json.decode(response.body) as List;
        return data.map((json) => UserModel.fromJson(json)).toList();
      } else {
        throw Exception(
          'Gagal memuat data. Status code: ${response.statusCode}',
        );
      }
    } catch (e) {
      throw Exception('Terjadi kesalahan saat memuat data: $e');
    }
  }
}