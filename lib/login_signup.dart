
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginAndSignup extends StatefulWidget {
  const LoginAndSignup({super.key});

  @override
  State<LoginAndSignup> createState() => _LoginAndSignupState();
}

class _LoginAndSignupState extends State<LoginAndSignup> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void signup() async {
    try {
      final response =
          await http.post(Uri.parse('https://reqres.in/api/register'), body: {
        "email": "eve.holt@reqres.in",
        "password": "pistol",
      });

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: const Text(' login Up Successfully '), backgroundColor:  Colors.green,));
      }
    } catch (e) {
      ScaffoldMessenger.of(context) 
          .showSnackBar(SnackBar(content: Text('${e.toString} '),backgroundColor: Colors.red,));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                hintText: 'Email',
              ),
            ),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                hintText: 'Password',
              ),
            ),
           const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                signup();
              },
              child: Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(child: Text('Sign UP')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
