import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.orange,
        child: Row(
          children: [
            Column(
              children: [
                Text("LOGIN"),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Form(
                      child: Column(
                    children: [

                      // USERNAME FORM FIELD
                      TextFormField(),

                      // PASSWORD FIELD
                      TextFormField(),

                      // LOGIN BUTTON
                      ElevatedButton(
                        onPressed: (() {
                          print("LOGIN");
                        }),
                        child: Text("LOGIN"),
                      ),
                    ],
                  )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
