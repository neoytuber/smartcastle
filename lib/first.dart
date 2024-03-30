import 'package:flutter/material.dart';


class First extends StatefulWidget {
  const First ({super.key});

  @override
  State<First> createState() => _FirstState();
}

class _FirstState extends State<First> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Информация о фильме",style: TextStyle(color: Colors.black),
      ),
      ),
      body:
      SingleChildScrollView(child:
      Center(child:
      Column(
       children: [

        Container(
          height: 200,
          width: 200,
          child: Image.network('https://upload.wikimedia.org/wikipedia/ru/3/3f/%D0%93%D1%83%D0%B1%D0%BA%D0%B0_%D0%91%D0%BE%D0%B1_%D0%BF%D0%B5%D1%80%D1%81%D0%BE%D0%BD%D0%B0%D0%B6.png'),
       
        ),
        Image.asset('assets/pic.png',
        height: 200,
        width: 200,
        ),
       
        SizedBox(height: 20),
        Container(
          height: 200,
          width: 200,
          color: Colors.red,
        ),
        ]
      
      ),
      ),
    ),
    );
  }
}
