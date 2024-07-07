// ignore_for_file: public_member_api_docs, sort_constructors_first, use_build_context_synchronously
import 'package:flutter/material.dart';
import 'package:foodorderapp/common%20widgets/my_button.dart';
import 'package:foodorderapp/common%20widgets/my_custom_textfield.dart';
import 'package:foodorderapp/pages/home%20page/ui/home_page.dart';
import 'package:foodorderapp/services/auth/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final VoidCallback onTap;
  const RegisterPage({
    super.key,
    required this.onTap,
  });

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();

  void register() async {
    //get the auth services
    final authService = AuthService();

    //check of the password match -> create user
    if (emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPassword.text.isNotEmpty) {
      if (passwordController.text == confirmPassword.text) {
        try {
          await authService.signUpWithEmailAndPassword(
              emailController.text, passwordController.text);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        }
        //display any error
        catch (e) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text(
                  e.toString(),
                  style: const TextStyle(fontSize: 16),
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
              title: Text(
                "Password don't match",
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
            title: Text(
              "Some field are empty !!",
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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //logo
          Icon(
            Icons.lock_open_rounded,
            size: height * 0.124,
            color: Theme.of(context).colorScheme.inversePrimary,
          ),

          SizedBox(
            height: height * 0.0311,
          ),

          //message, app slogan
          Text(
            "Lets create an account for you",
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
            height: height * .024,
          ),

          //Comform password Text field
          MyCustomTextField(
            controller: confirmPassword,
            hintText: "Confirm password",
            obscureText: true,
          ),

          SizedBox(
            height: height * .035,
          ),

          //login or sign button
          MyButton(
            text: "Register",
            onTap: () {
              register();
            },
          ),

          SizedBox(
            height: height * .012,
          ),

          //Already have an account? Login now
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Already have an account?",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
              const SizedBox(
                width: 5,
              ),
              GestureDetector(
                onTap: widget.onTap,
                child: Text(
                  "Login now",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
