
import 'package:bookstore/data/login_list2.dart';
import 'package:bookstore/page/Imports.dart';
import 'package:bookstore/page/bookPage1.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import 'registeration _page.dart';

class hotel_registration extends StatefulWidget {
  const hotel_registration({super.key});

  @override
  State<hotel_registration> createState() => _hotel_registrationState();
}

class _hotel_registrationState extends State<hotel_registration> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();

  bool isObs = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.35,
                  width: MediaQuery.of(context).size.width * 0.999,
                  color: Colors.black,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(70),
                      Text(
                        '    Log in to your',
                        style: mystyle(35, Colors.white, FontWeight.bold),
                      ),
                      Text(
                        '    Account',
                        style: mystyle(35, Colors.white, FontWeight.bold),
                      ),
                      Gap(10),
                      Text(
                        '       ',
                        style: mystyle(18, Colors.white),
                      )
                    ],
                  ),
                ),
                Gap(50),
                Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      ///email
                      TextFormField(
                        controller: _email,
                        decoration: InputDecoration(
                            label: Text('Email'),
                            hintText: 'Email',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'enter your email';
                          }
                          if (!value.contains('@')) {
                            return 'invalid Email';
                          }
                        },
                      ),
                      Gap(20),

                      ///password
                      TextFormField(
                        controller: _password,
                        decoration: InputDecoration(
                            label: Text('Password'),
                            hintText: 'password',
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter your password';
                          }
                          // if (value.length<8);
                          // return'Passwrod must contain atleast 8 characters';
                        },
                      ),
                      Gap(50),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.black,
                          child: Text(
                            'Log In',
                            style: mystyle(20, Colors.white),
                          ),
                          onPressed: () {
                            if (_formkey.currentState!.validate() &&
                                _email.text.toString() == login[0].email &&
                                _password.text.toString() ==
                                    login[0].password) {
                              final hotel_registration = SnackBar(
                                content: Text(' Login Sucessful'),
                                behavior: SnackBarBehavior.floating,
                              );


                              ScaffoldMessenger.of(context)
                                  .showSnackBar(hotel_registration);
                              Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                      builder: (builder) => books()),
                                  (routes) => false);
                            }
                          }),
                      Gap(10),
                      Text('OR'),
                      Gap(10),
                      MaterialButton(
                          minWidth: MediaQuery.of(context).size.width * 0.5,
                          color: Colors.black,
                          child: Text(
                            'Sign Up',
                            style: mystyle(20, Colors.white),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (builder) => registration()));
                          }),
                    ],
                  ),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
