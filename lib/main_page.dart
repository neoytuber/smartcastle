import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 46, 64, 100),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(0, 46, 64, 100),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80),
        child: Column(children: [
          Center(
              child: Image.asset(
            'assets/pyramid.png',
            width: 150,
            height: 150,
          )),
          SizedBox(height: 200),
          Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'SIGN IN',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )),
              SizedBox(height: 20),
              Container(
              padding: EdgeInsets.only(left: 20, right: 20),
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'SIGN UP',
                  style: TextStyle(color: Colors.white),
                ),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
              )),
        ]),
      ),
    );
  }
}
