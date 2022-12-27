import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  var _key = GlobalKey<FormState>();
  var email = TextEditingController();
  var password = TextEditingController();
  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // LOGIN TEXT
                const Text(
                  "LOGIN",
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                    fontFamily: "times",
                  ),
                ),

                const SizedBox(height: 50),

                // LOGIN FORM WRAPPER
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 70),
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),

                  // LOGIN FORM
                  child: Form(
                      key: _key,
                      child: Column(
                        children: [
                          // EMAIL FORM FIELD
                          TextFormField(
                            decoration:
                                InputDecoration(fillColor: Colors.white),
                            controller: email,
                            focusNode: focusNode,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value == null) {
                                return "The Email Field Is required";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 15),

                          // PASSWORD FIELD
                          TextFormField(
                            controller: password,
                            focusNode: focusNode,
                            obscureText: true,
                            validator: (value) {
                              if (value == null) {
                                return "The Password Field Cant Be Empty";
                              }
                              return null;
                            },
                          ),

                          const SizedBox(height: 15),

                          // LOGIN BUTTON
                          ElevatedButton(
                            onPressed: (() {
                              print("LOGIN");
                            }),
                            child: const Text("LOGIN"),
                          ),
                        ],
                      )),
                )
              ],
            ),
            Image.asset("assets/images/accident.png"),
          ],
        ),
      ),
    );
  }
}
