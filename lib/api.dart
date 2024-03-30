import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/info.dart';

class Api extends StatefulWidget {
  const Api({super.key});

  @override
  State<Api> createState() => _ApiState();
}

class _ApiState extends State<Api> {
  String textFromServer = '';
  int textFromId = 0;
  int userId = 0;

  @override
  void initState() {
    super.initState();

    getInfo();
  }

  Future<Info> getInfo() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

    print(response.statusCode);

    if (response.statusCode == 200) {
      //return Info.fromJson(jsonDecode(response.body)as Map<String,dynamic>);
      Info infoModel = Info.fromJson(jsonDecode(response.body));

      setState(() {
        textFromServer = infoModel.title!;
        textFromId = infoModel.id!;
        userId = infoModel.userId!;
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
        title: Text('API'),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Row(
            children: [
              Text(
                'Текст из сервера: ',
                style: TextStyle(fontSize: 26),
              ),
              Flexible(
                  child: Text(
                textFromServer,
                style: TextStyle(fontSize: 26),
              )),
              Text(
                textFromId.toString(),
                style: TextStyle(fontSize: 26),
              ),
              Text(
                userId.toString(),
                style: TextStyle(fontSize: 26),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
