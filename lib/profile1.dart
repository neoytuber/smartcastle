import 'package:flutter/material.dart';
final TextStyle profileStyle = TextStyle(color: Colors.black, fontSize: 20);
class Profile1 extends StatefulWidget {
  String name;
  String surname;
  String patronymic;
  String login;
  String password;

  Profile1(
      {super.key,
      required this.name,
      required this.surname,
      required this.patronymic,
      required this.login,
      required this.password});

  @override
  State<Profile1> createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: Center(
          child: Column(
        children: [
          Text('Name: ${widget.name}', style: profileStyle),
        
          Text('Surname: ${widget.surname}', style: profileStyle),
          Text('Patronymic: ${widget.patronymic}', style: profileStyle),
          Text('Login: ${widget.login}', style: profileStyle),
          Text('Password: ${widget.password}', style: profileStyle),
        ],
      )),
    );
  }
}
