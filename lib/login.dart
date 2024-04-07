import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:lesson4/profile1.dart';
import 'package:lesson4/registration.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool hidePassword = true;
  bool loading = false;
  Future login() async {
     setState(() {
       loading = true;
     });
    print('login');
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => Profile1(
                  name: '',
                  surname: '',
                  patronymic: '',
                  login: emailController.text,
                  password: passwordController.text)));
    } on FirebaseAuthException catch (e) {

      print('error-> ${e.code}');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
        duration: Duration(seconds: 4),
        content: Text(e.code),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(60))),
      ));
    }
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Log In',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'e-mail',
                    hintText: 'Enter your e-mail',
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
            loading == true ? Center(child: CircularProgressIndicator()):
            ElevatedButton(
                onPressed: () async {
                  FocusScope.of(context).unfocus();
                    login();
                },
                child: Text('Log In')),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Registration()));
                },
                child: Text('Registration'))
          ],
        ),
      ),
    );
  }
}
