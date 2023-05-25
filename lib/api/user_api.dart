import 'dart:convert';
import 'package:codixel_task/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserApi {
  final String apiUrl = 'https://random-data-api.com/api/v2/users';

  Future<UserModel> fetchRandomUserData() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);

      final firstName = jsonData['first_name'];
      final lastName = jsonData['last_name'];
      final phoneNumber = jsonData['phone_number'];
      final dateOfBirth = jsonData['date_of_birth'];
      final avatar = jsonData['avatar'];

      return UserModel(
        firstName: firstName,
        lastName: lastName,
        phoneNumber: phoneNumber,
        dateOfBirth: dateOfBirth,
        avatar: avatar,
      );
    } else {
      throw Exception('Failed to fetch user data');
    }
  }
}
