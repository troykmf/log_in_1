import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late final TextEditingController _usernameEditingController;
  // late final TextEditingController _nameEditingController;
  late final TextEditingController _passwordEditingController;
  @override
  void initState() {
    super.initState();
    _usernameEditingController = TextEditingController();
    // _nameEditingController = TextEditingController();
    _passwordEditingController = TextEditingController();
  }

  var result;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomLeft,
              colors: [Colors.purpleAccent, Colors.blueAccent]),
        ),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Create Account',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Text(
                'to get started now!',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70),
              ),
              const SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      labelText: 'Username',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter a Username',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 15.0),
              //   child: TextFormField(

              //     textAlign: TextAlign.start,
              //     decoration: InputDecoration(
              //         filled: true,
              //         fillColor: Colors.white38,
              //         labelText: 'First Name',
              //         labelStyle: const TextStyle(color: Colors.white),
              //         hintText: 'Enter First Name',
              //         border: OutlineInputBorder(
              //           borderSide: BorderSide.none,
              //           borderRadius: BorderRadius.circular(10.0),
              //         )),
              //   ),
              // ),
              // const SizedBox(
              //   height: 15.0,
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.white38,
                      labelText: 'Password',
                      labelStyle: const TextStyle(color: Colors.white),
                      hintText: 'Enter Your Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10.0),
                      )),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        elevation: 2.0,
                        primary: Colors.white,
                        side: const BorderSide(color: Colors.white)),
                    onPressed: () {
                      _CreateAccount();
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _usernameEditingController.dispose();
    _passwordEditingController.dispose();
    super.dispose();
  }

  Future<void> _CreateAccount() async {
    final Dio dio = Dio();
    log(_usernameEditingController.text);
    log(_passwordEditingController.text);
    try {
      await dio.post('https://bookstore.demoqa.com/Account/v1/User', data: {
        'userName': _usernameEditingController.text,
        'password': _passwordEditingController.text
      });
      log(result.toString());
    } catch (e, s) {
      log('$e$s');
    }
  }
}
