import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/choice.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  late List<User> loginResult;
  Future<void> loginState(email, password) async {
    var parameter = {
      'email': email,
      'password': password,
    };
    var uri = Uri.http("10.116.0.231:3000", "users", parameter);
    var resp = await http.get(uri);
    loginResult = userFromJson(resp.body);
    if (loginResult.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('email or password invalid')),
      );
    } else {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Choice()));
    }
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 182, 253, 223),
      body: Container(
        padding: EdgeInsets.only(top: 100.0),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Text(
                'Prom Moh',
                style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 60.0),
            Form(
              key: _formkey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: Offset(80.0, 2.0),
                    child: Text(
                      'User',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: emailInputField(),
                    ),
                  ),
                  SizedBox(height: 50.0),
                  Transform.translate(
                    offset: Offset(80, 2.0),
                    child: Text(
                      'Password',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25.0,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      width: 250,
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white),
                      child: passwordInputField(),
                    ),
                  ),
                  SizedBox(height: 70.0), // ร
                  Center(
                    child: Container(
                      width: 250,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Choice()));
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromARGB(255, 106, 238, 255),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 40.0),
                        ),
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget emailInputField() {
    return TextFormField(
      decoration: InputDecoration(
          labelText: "Email:",
          hintText: "Input your email",
          icon: Icon(Icons.email)),
      validator: (value) {
        if (value!.isEmpty) {
          return "this field is required!";
        }

        if (!EmailValidator.validate(value)) {
          return "It is not email format";
        }
        return null;
      },
      onSaved: (newValue) => email = newValue!,
    );
  }

  Widget passwordInputField() {
    return TextFormField(
      obscureText: true,
      decoration: InputDecoration(
          labelText: "Password:",
          hintText: "Input your password",
          icon: Icon(Icons.lock)),
      validator: (value) {
        if (value!.isEmpty) {
          return "this field is required!";
        }
        return null;
      },
      onSaved: (newValue) => password = newValue!,
    );
  }

  Widget submitButton() {
    return ElevatedButton(
        onPressed: () {
          if (_formkey.currentState!.validate()) {
            _formkey.currentState!.save();
            loginState(email, password);
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('connect to server')),
            );
            print("$email $password");
          }
        },
        child: Text("Login"));
  }
}
