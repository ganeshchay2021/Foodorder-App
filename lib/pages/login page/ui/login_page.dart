// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_button.dart';
import 'package:foodorderapp/common%20widgets/my_custom_textfield.dart';
import 'package:foodorderapp/pages/home%20page/ui/home_page.dart';
import 'package:foodorderapp/services/auth/auth_services.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback onTap;
  const LoginPage({
    super.key,
    required this.onTap,
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  void login() async {
    final authService = AuthService();
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await authService.signInWithEmailAndPassword(
            emailController.text, passwordController.text);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomePage(),
          ),
        );
      } catch (e) {
        showDialog(
          context: context,
          builder: (context) {
            return const AlertDialog(
              backgroundColor: Colors.white,
              title: Text(
                "Bad Crediantial",
                style: TextStyle(fontSize: 16),
              ),
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.white,
            title: Text(
              "Some fields are empty",
              style: TextStyle(fontSize: 16),
            ),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    // final width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Image.asset("assets/icons/file.png", height: height * 0.2,),

            SizedBox(
              height: height * 0.0311,
            ),

            //message, app slogan
            Text(
              "Hamro Fast Food",
              style: TextStyle(
                fontSize: height * 0.0199,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),

            SizedBox(
              height: height * 0.0311,
            ),

            //Email Text Field
            MyCustomTextField(
              controller: emailController,
              hintText: "Email",
            ),

            SizedBox(
              height: height * .024,
            ),

            //Password Text Field
            MyCustomTextField(
              controller: passwordController,
              hintText: "Password",
              obscureText: true,
            ),

            SizedBox(
              height: height * .035,
            ),

            //login or sign button
            MyButton(
              text: "Sign In",
              onTap: () {
                login();
              },
            ),

            SizedBox(
              height: height * .012,
            ),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                  onTap: widget.onTap,
                  child: Text(
                    "Register now",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
