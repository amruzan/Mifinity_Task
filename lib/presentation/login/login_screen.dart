import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:mifinity_coding_task/common/config/router.gr.dart';
import 'package:sizer/sizer.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Text(
                'Welcome',
                style: TextStyle(
                    color: Colors.red,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              )),
              SizedBox(
                height: 4.h,
              ),
              const Text(
                'Email',
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: 'Email Address',
                    hintStyle: const TextStyle(color: Colors.white24)),
                controller: email,
                onChanged: (val) {
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please your email id';
                  } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                    return "Please Enter a Valid Email Format";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 2.h,
              ),
              const Text(
                'Password',
                style: TextStyle(color: Colors.white),
              ),
              TextFormField(
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    filled: true,
                    fillColor: Colors.white10,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5)),
                    hintText: 'Password',
                    hintStyle: const TextStyle(color: Colors.white24)),
                obscureText: true,
                controller: password,
                onChanged: (val) {
                  _formKey.currentState?.validate();
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 4.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 7.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white10)),
                      backgroundColor: Colors.black),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content:
                                Text('Invalid Credentials.Login as Guest')),
                      );
                    }
                  },
                  child: const Text('Log In'),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: double.infinity,
                height: 7.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white10)),
                      backgroundColor: Colors.black),
                  onPressed: () {
                    context.router.push(const Dashboard());
                  },
                  child: const Text('Guest LogIn'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
