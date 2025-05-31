import 'package:flutter/material.dart';

class Sign extends StatefulWidget {
  @override
  _SignState createState() => _SignState();
}

class _SignState extends State<Sign> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('SIGN UP', style: TextStyle(fontSize: 25, color: Colors.blue)),
              SizedBox(height: 15),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter your username',
                  labelText: 'Username',
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter username';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                decoration: InputDecoration(
                  hintText: 'Enter Email',
                  labelText: 'Email',
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter email';
                  }
                  if (!value.contains('@')) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                  hintText: 'Enter password',
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter password';
                  }
                  if (value.length < 8) {
                    return 'Password too short';
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),

              TextFormField(
                controller: confirmPasswordController,
                decoration: InputDecoration(
                  hintText: 'Confirm password',
                  labelText: 'Confirm Password',
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please confirm your password';
                  }
                  if (value != passwordController.text) {
                    return 'Passwords do not match';
                  }
                  return null;
                },
              ),

              SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Everything is valid
                    print("Signup successful");
                  }
                },
                child: Text('Sign Up'),
              ),

              TextButton(
                onPressed: () {},
                child: Text('Already Have Account? Login', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
