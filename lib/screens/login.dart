import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hackerkernel/apis/login_api.dart';
import 'package:hackerkernel/screens/cstm_txt_field.dart';
import 'package:hackerkernel/screens/homepage.dart';
import 'package:hackerkernel/shared_pref/shared_pref.dart';
import 'package:sign_in_button/sign_in_button.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();
  var pwdController = TextEditingController();

  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.jpg",
                height: 350,
              ),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Login",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CstmTxtField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                hintText: "Email Id",
                labelText: "Email Id",
                prefixIcon: const Icon(Icons.alternate_email_rounded),
              ),
              CstmTxtField(
                obscureText: obscureText,
                controller: pwdController,
                hintText: "Password",
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock_open_rounded),
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText = !obscureText;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye_outlined)),
              ),
              Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: const Text("Forgot Password?"))),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      onPressed: () {
                        login(
                          email: emailController.text,
                          password: pwdController.text,
                        ).then((value) {
                          if (value.token != null) {
                            SP.saveLoginData(value);
                            Fluttertoast.showToast(
                                msg: value.error ?? "Login successfully");
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const HomePage()));
                          } else {
                            Fluttertoast.showToast(
                                msg: value.error ?? "Login failed");
                          }
                        }).onError((error, stackTrace) {
                          Fluttertoast.showToast(msg: error.toString());
                        });
                      },
                      child: const Text(
                        "Login",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ))),
              const SizedBox(
                height: 10,
              ),
              const Text("OR"),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: SignInButton(
                  Buttons.google,
                  text: "Login with Google",
                  onPressed: () {},
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New to Logistics? ",
                    style: TextStyle(color: Colors.grey),
                  ),
                  Text(
                    "Register",
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
