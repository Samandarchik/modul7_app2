import 'package:flutter/material.dart';
import 'package:modul7_app2/components/my_bottom.dart';
import 'package:modul7_app2/components/my_text_filed.dart';
import 'package:modul7_app2/services/auth/aut_service.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  const RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  void singUp() async {
    if (passwordController.text != confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password do not match"),
        ),
      );
      return;
    }
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
              Text("Let's create an account for you!"),
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
                height: 10,
              ),
              MyTextFiled(
                  controller: confirmPasswordController,
                  hintext: "Confirm password",
                  obcuretext: true),
              SizedBox(
                height: 20,
              ),
              MyBottom(onTap: singUp, text: "Sing Up"),
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
                      "Login now",
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
