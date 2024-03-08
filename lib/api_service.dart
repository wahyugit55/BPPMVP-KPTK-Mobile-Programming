import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:resting/constant.dart';
import 'user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    // Try & Catch Error
    try {
      var url = Uri.parse(ApiConstant.baseUrl + ApiConstant.userEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        List<UserModel> _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}
