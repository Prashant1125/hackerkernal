import 'package:hackerkernel/models/login_response.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SP {
  static const isLogin = "isLogin";
  static const token = "token";
  static saveLoginData(LoginResponse loginResponse) async {
    var pref = await SharedPreferences.getInstance();
    await pref.setBool(isLogin, true);
    await pref.setString(token, loginResponse.token ?? "");
  }

  static Future<bool> getIsLogin() async {
    var pref = await SharedPreferences.getInstance();
    return pref.getBool(isLogin) ?? false;
  }
}
