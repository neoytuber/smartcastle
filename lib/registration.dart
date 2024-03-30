import 'package:flutter/material.dart';
import 'package:lesson4/profile1.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  TextEditingController nameController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController patronymicController = TextEditingController();
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Column(
            children: [
              TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      labelText: 'Name',
                      hintText: 'Enter your name',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)))),
              SizedBox(height: 20),
              TextField(
                controller: surnameController,
                decoration: InputDecoration(
                    labelText: 'Surname',
                    hintText: 'Enter your surname',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 20),
              TextField(
                controller: patronymicController,
                decoration: InputDecoration(
                    labelText: 'Patronymic',
                    hintText: 'Enter your patronymic',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 40),
              TextField(
                  controller: loginController,
                  decoration: InputDecoration(
                      labelText: 'Login',
                      hintText: 'Enter your login',
                      contentPadding: EdgeInsets.all(10),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)))),
              SizedBox(height: 20),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    contentPadding: EdgeInsets.all(10),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Profile1(
                                  name: nameController.text,
                                  surname: surnameController.text,
                                  patronymic: patronymicController.text,
                                  login: loginController.text,
                                  password: passwordController.text,
                                )));
                  },
                  child: Text('Log In')),
            ],
          ),
        ),
      ),
    );
  }
}
