import 'package:flutter/material.dart';
import 'package:modul7_app2/components/my_bottom.dart';
import 'package:modul7_app2/components/my_text_filed.dart';
import 'package:modul7_app2/services/auth/aut_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  void singIn() async {
    final authService = Provider.of<AuthService>(context, listen: false);
    try {
      await authService.signInWithEmailAndPassword(
          emailController.text, passwordController.text);
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
          child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 50,
              ),
              Icon(
                Icons.message,
                size: 100,
                color: Colors.grey[800],
              ),
              SizedBox(
                height: 50,
              ),
              Text("Welcome back you've been missed!"),
              SizedBox(
                height: 25,
              ),
              MyTextFiled(
                  controller: emailController,
                  hintext: "Email",
                  obcuretext: false),
              SizedBox(
                height: 10,
              ),
              MyTextFiled(
                  controller: passwordController,
                  hintext: "Password",
                  obcuretext: true),
              SizedBox(
                height: 20,
              ),
              MyBottom(onTap: singIn, text: "Sing In"),
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Not a member? "),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      )),
    );
  }
}
