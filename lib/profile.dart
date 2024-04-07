import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/info2.dart';


class Profile extends StatefulWidget {
  String name;
  String familya;
  String otchestvo;
  String email;
  String city;
  String password;

  Profile(
      {super.key,
      required this.name,
      required this.familya,
      required this.otchestvo,
      required this.email,
      required this.city,
      required this.password}
      );

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(child: Image.asset('assets/Kim.png', width: 200, height: 200)),
          SizedBox(height: 20),
          Text(
            //login!,
            widget.name,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            widget.familya,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            widget.otchestvo,
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(height: 10),
          Text(
            widget.email,
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(height: 10),
          Text(
            widget.city,
            style: TextStyle(fontSize: 20),
          ),
          Text(widget.password,
          style: TextStyle(fontSize:20 ),
          ),

          SizedBox(height: 20),
          ElevatedButton(
              onPressed: () {
                showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      return Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        backgroundColor: Colors.black,
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: SizedBox(
                            height: 150,
                            width: 400,
                            child: Column(
                              children: [
                                Text('Вы уверены, что хотите выйти?',
                                    style: TextStyle(
                                        fontSize: 17, color: Colors.orange)),
                                SizedBox(height: 80),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет',
                                          style:
                                              TextStyle(color: Colors.black)),
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange),
                                    ),
                                    SizedBox(width: 20),
                                    OutlinedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('Да',
                                            style: TextStyle(
                                                color: Colors.orange)),
                                        style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: Colors.orange,
                                                width: 2))),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    });
              },
              child: Text('Выйти')),
          SizedBox(height: 50),
          Container(
            width: 200,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    duration: Duration(seconds: 10),
                    backgroundColor: Colors.yellow,
                    content: Expanded(child: Text('Всем привет'))));
              },
              child: Row(
                children: [
                  Icon(Icons.accessibility_new_rounded),
                  Text('show snackbar', style: TextStyle(color: Colors.white)),
                ],
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            ),
          ),
        ],
      ),
    );
  }
}