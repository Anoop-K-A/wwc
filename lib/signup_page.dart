import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:work_wave_connect/login_page.dart';
import 'package:work_wave_connect/signup_controller.dart';

import 'package:work_wave_connect/validator.dart';

class SignupScreen extends StatefulWidget {
  static String routeName = '/signup-email-password';
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final controller = SignUpController();
  @override
  void dispose() {
    super.dispose();
    controller.email.dispose();
    controller.password.dispose();
  }

  void signUpUser() async {
    context.read<SignUpController>().registerUser(
          controller.email.text,
          controller.password.text,
          context,
        );
  }

  bool passshow = true;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // ignore: unused_element

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image(
                  image: const AssetImage('assets/images/logo.jpg'),
                  height: size.height * 0.3,
                ),
                Text(
                  'Get Started',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 5),
                Text(
                  'First create a profile to start your journey',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          // controller: name,
                          validator: (value) =>
                              FValidator.validateEmtyText('First Name', value),
                          decoration: const InputDecoration(
                            label: Text('Full Name'),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.person),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.email,
                          //validator: (value) => FValidator.validateEmail(value),
                          decoration: const InputDecoration(
                            label: Text('Email'),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.email),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          //controller: phone,
                          validator: (value) =>
                              FValidator.validatePhoneNo(value),
                          decoration: const InputDecoration(
                            label: Text('Phone No.'),
                            border: OutlineInputBorder(),
                            prefixIcon: Icon(Icons.phone_android),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          controller: controller.password,
                          validator: (value) =>
                              FValidator.validatePassword(value),
                          decoration: InputDecoration(
                            label: const Text('Password'),
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  passshow ? passshow = false : passshow = true;
                                });
                              },
                              icon: Icon(passshow == true
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                            labelStyle: const TextStyle(
                              color: Colors.black,
                            ),
                            focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(width: 2.0, color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: signUpUser, //{
                            // if (_formKey.currentState!.validate()) {
                            //   SignUpController.instance.registerUser(
                            //       controller.email.text.trim(),
                            //       controller.password.text.trim());
                            // }
                            // },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              backgroundColor: Colors.lightBlueAccent,
                            ),
                            child: const Text(
                              'SIGNUP',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Text('OR'),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                icon: const Image(
                                  image: AssetImage('assets/images/th.jpeg'),
                                  width: 30.0,
                                ),
                                onPressed: () {},
                                label: const Text(
                                  'Sign-In With Google',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return const LoginScreen();
                                }));
                              },
                              child: Text.rich(
                                TextSpan(
                                  children: [
                                    TextSpan(
                                        text: 'Already Have An Account?',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                    const TextSpan(
                                        text: ' Login',
                                        style:
                                            TextStyle(color: Colors.blueAccent))
                                  ],
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
