import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Shared extends StatefulWidget {
  const Shared({Key? key}) : super(key: key);

  @override
  State<Shared> createState() => _SharedState();
}

class _SharedState extends State<Shared> {
  TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shared Preferences'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(children: [
        TextField(
          controller: textController,
          decoration: InputDecoration(labelText: 'Текст'),
          style: TextStyle(fontSize: 24),
        ),
        SizedBox(height: 20),
        ElevatedButton(
            onPressed: () async {
              SharedPreferences sp = await SharedPreferences.getInstance();
              sp.setString('keyText', textController.text);

              String? newText;
              newText = sp.getString('keyText');
              print(newText);
            },
            child: Text('Сохранить'))
      ]),
    );
  }
}