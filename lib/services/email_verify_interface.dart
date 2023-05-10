import "package:dio/dio.dart";
import "../models/user_model.dart";

abstract class IEmail {
  Future<UserModel?> emailVerify(String email) async {
    const api = "http://10.0.2.2:3003/api/v1/get_email";
    final data = {
      "email": email,
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
