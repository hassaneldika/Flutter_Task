// ignore_for_file: no_leading_underscores_for_local_identifiers, non_constant_identifier_names

import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

  RegExp pass_valid = RegExp(r"(?=.*\d)(?=.*[A-Z])(?=.*\W)");

  bool validatePassword(String pass) {
    String _password = pass.trim();
    if (pass_valid.hasMatch(_password)) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 6, 51, 88),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                  child: Text(
                    'Registration Form',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                // User name
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: TextFormField(
                      controller: _usernameController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your name',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please emter your name';
                        }
                        return null;
                      }),
                ),

                // Email
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        icon: Icon(Icons.email),
                        border: OutlineInputBorder(),
                        hintText: 'Enter your email',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please enter your email';
                        } else if (!value.contains('@') ||
                            !value.contains('.')) {
                          return 'Please enter @ email address';
                        }
                        return null;
                      }),
                ),

                // Password
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        } else {
                          bool result = validatePassword(value);
                          if (result) {
                            return null;
                          } else if (value.length < 7) {
                            return 'length of password must be at least 7 ';
                          } else {
                            return " contain Capital,Number,Special";
                          }
                        }
                      }),
                ),

                // Confirm Password
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
                  child: TextFormField(
                      controller: _confirmpasswordController,
                      obscureText: true,
                      obscuringCharacter: '*',
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        hintText: 'Confirm password',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please re-enter your password';
                        } else if (value.length < 7) {
                          return 'length of password must be at least 7 ';
                        } else if (value != _passwordController.text) {
                          return 'Password not match';
                        }
                        return null;
                      }),
                ),

                // Submit button
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 32.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 6, 51, 88),
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        var snackBar = const SnackBar(
                            content: Text('Thanks for your joining'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      }
                    },
                    child: const SizedBox(
                      width: double.infinity,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Register",
                            style: TextStyle(fontSize: 20.0),
                            textAlign: TextAlign.center),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
    // )
    // );
  }
}
