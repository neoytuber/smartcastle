import 'package:flutter/material.dart';
import 'package:lesson4/main_page.dart';
import 'package:lesson4/register.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'profile.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  TextEditingController loginController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool hidePassword = true;

  final _formkey = GlobalKey<FormState>();
  String? login = '';

  @override
  void initState() {
    super.initState();
    getFormShared();
  }

  Future getFormShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    login = sp.getString('login');

    setState(() {
      login = sp.getString('login');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin'),
        centerTitle: true,
        backgroundColor: Colors.orange,
      ),
      body: Form(
        key: _formkey,
        child: Column(
          children: [
            SizedBox(height: 20),
            TextFormField(
              controller: loginController,
              decoration: InputDecoration(
                labelText: 'Login',
                hintText: 'Введите логин',
                prefixIcon: Icon(Icons.login),
                suffixIcon: IconButton(
                    onPressed: () {
                      loginController.clear();
                    },
                    icon: Icon(Icons.delete)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(16)),
              ),
              keyboardType: TextInputType.name,
              validator: (value) {
                if (value == '') {
                  return 'Заполните Логин';
                }
              },
            ),
            SizedBox(height: 20),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
                hintText: 'Введите пароль',
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        if (hidePassword == true) {
                          hidePassword = false;
                        } else {
                          hidePassword = true;
                        }
                      });
                    },
                    icon: Icon(hidePassword == true
                        ? Icons.visibility_off
                        : Icons.visibility)),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red, width: 2),
                    borderRadius: BorderRadius.circular(16)),
              ),
              keyboardType: TextInputType.text,
              obscureText: hidePassword,
              validator: (value) {
                if (value == '') {
                  return 'Заполните пароль';
                }
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                if (_formkey.currentState!.validate()) {
                  SharedPreferences sp = await SharedPreferences.getInstance();
                  sp.setString('login', loginController.text);

                  // ignore: use_build_context_synchronously
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Profile(
                                name: '',
                                familya: '',
                                otchestvo: '',
                                email: '',
                                city: '',
                              )));
                }
              },
              child: Text('Войти'),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Register()));
              },
              child: Text(
                'Если нет аккаунта, то зарегистрируйтесь',
                style: TextStyle(
                    color: Colors.blue, decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}