import 'package:e_commerce/data/api_manger/api_manger.dart';
import 'package:e_commerce/data/model/Register_response.dart';
import 'package:e_commerce/presentaion/Home.dart';
import 'package:flutter/material.dart';

import 'Sign_in.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                spacing: 10,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Create Account",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "Sign Up to get started",
                    style: TextStyle(color: Colors.grey, fontSize: 15),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.name,
                    controller: nameController,
                    style: TextStyle(color: Colors.white),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      } else if (value.length < 2) {
                        return 'enter valid name';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person_outline,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      label: Text(
                        'Full Name',
                        style: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.emailAddress,

                    style: TextStyle(color: Colors.white),
                    controller: emailController,
                    validator: (input) =>
                        input!.isValidEmail() ? null : "Check your email",
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.mail_outline,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      label: Text(
                        'Email Address',
                        style: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                    controller: passwordController,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'this field is required';
                      } else if (value.length < 5) {
                        return 'enter valid name';
                      }
                    },
                    decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Colors.white,
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      label: Text(
                        'Password',
                        style: TextStyle(color: Colors.grey),
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade900,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(50)),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
register(nameController.text, emailController.text, passwordController.text,context);                      }
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 17),
                    ),
                    style: ElevatedButton.styleFrom(minimumSize: Size(200, 50)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account ?",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SignIn(),
                                ));
                          },
                          child: Text(
                            "Sign In",
                            style: TextStyle(color: Colors.red),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
        ));
  }

  register(
    String name,
    String email,
    String password,
    BuildContext context
  ) async{
    ApiManger apiManger = ApiManger();
showDialog(context: context, builder: (context) => Center(child: CircularProgressIndicator(),),);
   RegisterResponse? response =await apiManger.register(name: name, email: email, password: password);
    Navigator.pop(context);
    if(response != null){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Successfully'))
      );
      Future.delayed(Duration(seconds:1 ),() {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
          return Homepage();
        },));
      },);
    }
    else{
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error'))
      );
    }

  }
}

extension EmailValidator on String {
  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(this);
  }
}


