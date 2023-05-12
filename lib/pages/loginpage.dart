import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var _passwordVisible = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _userPasswordController = TextEditingController();
  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Center(
          child: SingleChildScrollView(
            child: Column(children: [
              const Center(
                child: const Text(
                  'Login',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email Address', icon: Icon(Icons.email)),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _userPasswordController,
                obscureText:
                    !_passwordVisible, //This will obscure text dynamically
                decoration: InputDecoration(
                  labelText: 'Password', icon: Icon(Icons.key),
                  // Here is key idea
                  suffixIcon: IconButton(
                    icon: Icon(
                      // Based on passwordVisible state choose the icon
                      _passwordVisible
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Theme.of(context).primaryColorDark,
                    ),
                    onPressed: () {
                      // Update the state i.e. toogle the state of passwordVisible variable
                      setState(() {
                        _passwordVisible = !_passwordVisible;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    'Dont have an account ?',
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                height: 10,
              ),
              TextButton(
                  onPressed: onPressed,
                  child: Text(
                    'Forgot password',
                    style: TextStyle(color: Colors.black),
                  )),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: 130,
                height: 50,
                child: FilledButton(
                    onPressed: onPressed,
                    child: Text(
                      'Login',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }

  void onPressed() {}
}
