import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  int _gender = 0;
  final onPressed = () {};
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  late bool _passwordVisible;
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
                child: Text(
                  'User Information',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                    labelText: 'Name', icon: Icon(Icons.account_circle)),
              ),
              TextFormField(
                controller: _usernameController,
                decoration: const InputDecoration(
                    labelText: 'User Name', icon: Icon(Icons.account_circle)),
              ),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                    labelText: 'Email Address', icon: Icon(Icons.email)),
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
              TextFormField(
                controller: _phoneController,
                validator: (value) {
                  (String value) {
                    String pattern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                    RegExp regExp = RegExp(pattern);
                    if (value.isEmpty) {
                      return 'Please enter mobile number';
                    } else if (!regExp.hasMatch(value)) {
                      return 'Please enter valid mobile number';
                    }
                    return '';
                  };
                },
                decoration: const InputDecoration(
                    labelText: 'Phone Number', icon: Icon(Icons.phone)),
              ),
              TextFormField(
                controller: _addressController,
                decoration: const InputDecoration(
                    labelText: 'Address', icon: Icon(Icons.location_on)),
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                  onPressed: () {
                    widget;
                  },
                  child: Text(
                    'HAVE AN ACCOUNT ?',
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
                      'Create',
                      style: TextStyle(color: Colors.white),
                    )),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
