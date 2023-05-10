import "package:dio/dio.dart";
import "package:veterinaria_app/services/recover_pass_interface.dart";
import "../models/user_model.dart";

class PassRecoveryService extends IPass {
  @override
  Future<UserModel?> passRecovery(String password, String email) async {
    const api = "http://10.0.2.2:3003/api/v1/update_pass";
    final data = {
      "password": password,
      "email": email
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
