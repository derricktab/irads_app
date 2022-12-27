import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var _key = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  FocusNode focusNode = FocusNode();
  var errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Flexible(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGIN TEXT
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    // fontFamily: "times new roman",
                  ),
                ),

                const SizedBox(height: 50),

                // LOGIN FORM WRAPPER
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 40, vertical: 50),
                  width: MediaQuery.of(context).size.width * 0.3,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(30),
                  ),

                  // LOGIN FORM
                  child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          // EMAIL FORM FIELD
                          TextFormField(
                            decoration: InputDecoration(
                              prefixIcon: const Icon(
                                Icons.email_rounded,
                                color: Colors.black87,
                              ),
                              border: InputBorder.none,
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              fillColor: Colors.white,
                              filled: true,
                              labelText: "Email Address",
                              labelStyle: const TextStyle(
                                color: Colors.pink,
                              ),
                            ),
                            controller: email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The Email Field Is required";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 20),

                          // PASSWORD FIELD
                          TextFormField(
                            decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.lock,
                                  color: Colors.black87,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                border: InputBorder.none,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                fillColor: Colors.white,
                                filled: true,
                                labelText: "Password",
                                labelStyle: TextStyle(
                                  color: Colors.pink,
                                )),
                            controller: password,
                            obscureText: true,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "The Password Field Cant Be Empty";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 25),

                          // LOGIN BUTTON
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 23, horizontal: 160),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20)),
                                backgroundColor: Colors.black),
                            onPressed: (() async {
                              // CHECKING IF THERE ARE NO ERRORS IN THE FORM
                              if (_key.currentState!.validate()) {
                                // AUTHENTICATING THE USER
                                await FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                        email: email.text,
                                        password: password.text)
                                    .then((value) {
                                  print("LOGIN SUCCESFULL");

                                  // Sending the user to the homepage if login was succesfull
                                  Navigator.pushNamed(
                                    context,
                                    "home",
                                  );
                                }).onError((error, stackTrace) {
                                  setState(() {
                                    errorMessage = error;
                                  });
                                });
                              }
                            }),
                            child: const Text("LOGIN"),
                          ),
                        ],
                      )),
                ),

                // if(errorMessage != null)
                // ScaffoldMesseng
              ],
            ),

            // RIGHT ACCIDENT IMAGE
            Image.asset(
              "assets/images/accident.png",
              width: MediaQuery.of(context).size.width * 0.45,
            ),
          ],
        ),
      ),
    );
  }
}
