import "package:dio/dio.dart";
import "../models/user_model.dart";

abstract class IPass {
  Future<UserModel?> passRecovery(String password, String email) async {
    const api = "http://10.0.2.2:3003/api/v1/update_pass";
    final data = {
      "email": email,
      "password": password,
    };
    final dio = Dio();
    Response response;
    response = await dio.post(api, data: data);
    if (response.statusCode == 200) {
      final body = response.data['data'];
      return UserModel(email: body['email'], name: body['name']);
    } else {
      return null;
    }
  }
}
