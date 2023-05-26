import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DataResponse {
  final String message;
  final String status;

  const DataResponse({
    required this.message,
    required this.status,
  });

  factory DataResponse.fromJson(Map<String, dynamic> json) {
    return DataResponse(
      message: json['message'],
      status: json['status'],
    );
  }
}

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

  register(String name, String username, String email, String password,
      String cellphone, String address) async {
    Map data = {
      'name': name,
      'username': username,
      'email': email,
      'password': password,
      'cellphone': cellphone,
      'address': address,
    };
    print(data);

    String body = json.encode(data);
    var url = 'https://sneakerhead-production.up.railway.app/api/auth/signUp';
    var response = await http.post(
      Uri.parse(url),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "accept": "application/json",
        "Access-Control-Allow-Origin": "*"
      },
    );
    final dataresponse = DataResponse.fromJson(jsonDecode(response.body));
    if (response.statusCode == 200) {
      //Or put here your next screen using Navigator.push() method
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(dataresponse.message),
            );
          });
      print(dataresponse.message);
    } else {
      print('error');
    }
  }

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
                  'Register',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 80,
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
                    onPressed: () {
                      register(
                          _nameController.text,
                          _usernameController.text,
                          _emailController.text,
                          _userPasswordController.text,
                          _phoneController.text,
                          _addressController.text);
                    },
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
