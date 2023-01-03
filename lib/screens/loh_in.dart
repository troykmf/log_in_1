import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

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
                'Welcome.',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              const Text(
                'Glad to see you!.',
                style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.w400,
                    fontStyle: FontStyle.italic,
                    color: Colors.white70),
              ),
              const SizedBox(
                height: 30.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white38,
                    labelText: 'Username',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'must have capital letter',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10.0,
              ),
              const Divider(
                indent: 15.0,
                endIndent: 15.0,
                thickness: 1.0,
                color: Colors.white,
              ),
              const SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: TextFormField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    suffixIcon: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility,
                        color: Colors.black,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white38,
                    labelText: 'Password',
                    labelStyle: const TextStyle(color: Colors.white),
                    hintText: 'must have capital letter',
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      'forgotten passord?',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40.0,
              ),
              InkWell(
                onTap: () {
                  _fetchAccount();
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white)),
                  child: const Center(
                    child: Text(
                      'Log In',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchAccount() async {
    final Dio dio = Dio();
    log(_username.text);
    log(_password.text);
    try {
      await dio.get('https://bookstore.demoqa.com/Account/v1/User/{UUID}');
      log(result.toString());
    } catch (e, s) {
      log('$e$s');
    }
  }
}
