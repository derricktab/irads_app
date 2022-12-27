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
        color: Colors.white,
        child: Flexible(
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
                      fontFamily: "times new roman",
                    ),
                  ),

                  const SizedBox(height: 50),

                  // LOGIN FORM WRAPPER
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 70),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 40),
                    width: MediaQuery.of(context).size.width * 0.3,
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
                                  // color: Color.fromARGB(255, 255, 26, 103),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              controller: email,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null) {
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
                                if (value == null) {
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

              // RIGHT ACCIDENT IMAGE
              Image.asset(
                "assets/images/accident.png",
                width: MediaQuery.of(context).size.width * 0.45,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
