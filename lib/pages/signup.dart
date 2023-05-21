import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

/*Future<User> createUser(String name, String username, String email,
    String password, String cellphone, String address) async {
  final response = await http.post(
    Uri.parse('https://sneakerhead-production.up.railway.app/api/auth/signUp'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'cellphone': cellphone,
      'address': address,
    }),
  );
  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    return User.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class User {
  final String name;
  final String username;
  final String email;
  final String password;
  final String cellphone;
  final String address;

  const User(
      {required this.name,
      required this.username,
      required this.email,
      required this.password,
      required this.cellphone,
      required this.address});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      username: json['username'],
      email: json['email'],
      password: json['password'],
      cellphone: json['cellphone'],
      address: json['address'],
    );
  }
}
*/
class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _usernameController = TextEditingController();
  final _userPasswordController = TextEditingController();
  final _addressController = TextEditingController();
  late bool _passwordVisible;
  //Future<User>? _futureUser;
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
                  labelText: 'Password', icon: const Icon(Icons.key),
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
                  child: const Text(
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
                    onPressed: () {},
                    child: const Text(
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
