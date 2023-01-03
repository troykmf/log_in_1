import 'package:flutter/material.dart';
import 'package:log_in_1/screens/loh_in.dart';
import 'package:log_in_1/screens/sign_up.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void NavToLogInPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return const LogIn();
          }),
        ),
      );
    }

    void NavToSignUpPage() {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: ((context) {
            return const SignUpScreen();
          }),
        ),
      );
    }

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
              const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.purpleAccent,
                child: Icon(
                  Icons.person,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              const Text(
                'PixelPro Digital',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 30.0,
              ),
              InkWell(
                onTap: () => NavToLogInPage(),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InkWell(
                onTap: () => NavToSignUpPage(),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15.0),
                  height: 50.0,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(10.0),
                      border: Border.all(color: Colors.white)),
                  child: const Center(
                    child: Text(
                      'Sign Up',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
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
}
