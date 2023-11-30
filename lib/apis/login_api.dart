import "package:hackerkernel/models/login_response.dart";
import "package:http/http.dart" as http;

Future<LoginResponse> login({
  required String email,
  required String password,
}) async {
  var response = await http.post(
    Uri.parse("https://reqres.in/api/login"),
    body: {
      "email": email,
      "password": password,
    },
  );
  if (response.statusCode == 200) {
    return loginResponseFromJson(response.body);
  } else {
    throw Exception(response.body);
  }
}
