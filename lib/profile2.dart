import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:lesson4/profile2.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/info3.dart';

class Profile2 extends StatefulWidget {
  Profile2({
    super.key,
  });

  @override
  State<Profile2> createState() => _Profile2State();
}

class _Profile2State extends State<Profile2> {
  String name = '';
  String username = '';
  String email = '';
  String phone = '';
  String website = '';
  String adress = '';
  String company = '';

  bool listLoading = false;

  @override
  void initState() {
    super.initState();

    getInfo();
  }

  Future<Info3> getInfo() async {
    setState(() {
      listLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/users/8'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      Info3 infoModel = Info3.fromJson(jsonDecode(response.body));

      setState(() {
        name = infoModel.name!;
        username = infoModel.username!;
        email = infoModel.email!;
        adress = infoModel.address!.city!;
        phone = infoModel.phone!;
        website = infoModel.website!;
        company = infoModel.company!.catchPhrase!;

        setState(() {
          listLoading = false;
        });
      });

      return infoModel;
    } else {
      throw 'Ошибка запроса';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(children: [
        Center(child: Image.asset('assets/pic.png', width: 150, height: 150)),
        SizedBox(height: 20),
        Text(
          name,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 20),
        Text(
          username,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(height: 20),
        Text(
          email,
          style: TextStyle(fontSize: 30),
        ),
        SizedBox(
          height: 10,
        ),
        Text(phone, style: TextStyle(fontSize: 30)),
        SizedBox(height: 10),
        Text(website, style: TextStyle(fontSize: 30)),
        SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Назад',
            style: TextStyle(color: Colors.black),
          ),
          style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
        )
      ]),
    );
  }
}