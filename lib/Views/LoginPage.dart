import 'package:booking_hotel/Controllers/AccountController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:booking_hotel/Controllers/AuthController.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final AccountController _accountController = Get.put(AccountController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _accountController.isLoading.value
                    ? null
                    : () async {
                  await _accountController.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
                  if (_accountController.isLoggedIn.value) {
                    Get.offNamed('/home'); // Navigate to home page after successful login
                  }
                },
                child: _accountController.isLoading.value
                    ? CircularProgressIndicator()
                    : Text('Login'),
              );

            }),
            InkWell(
              onTap: () {
                Get.toNamed('/registration');
              },
              child: Ink(
                child: const Text(
                  'Dont have an account?',
                  style: TextStyle(
                    color: Color.fromRGBO(139, 103, 204, 0.5),
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}
class _LoginPageState extends State<LoginPage> {
  final AuthController _authController = Get.put(AuthController());
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: _passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16),
            Obx(() {
              return ElevatedButton(
                onPressed: _authController.isLoading.value
                    ? null
                    : () {
                    _authController.loginUser(
                    _emailController.text,
                    _passwordController.text,
                  );
                },
                child: _authController.isLoading.value
                    ? SizedBox (
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(),
                      )
                    : Text('Login'),
              );
            }),
            InkWell(
              onTap: () {
                Get.toNamed('/registration');
              },
              child: Ink(
                child: const Text(
                  'Dont have an account?',
                  style: TextStyle(
                    color: Color.fromRGBO(139, 103, 204, 0.5),
                    fontWeight: FontWeight.w800,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}*/