
import 'package:flutter/material.dart';

class Lesson6 extends StatefulWidget {
  const Lesson6({super.key});

  @override
  State<Lesson6> createState() => _Lesson6State();
}

class _Lesson6State extends State<Lesson6> {

  String a = "Smart";
  String b = "Castle";
  int c = 25;
  double d = 30.5;
  bool f = true; //true and false;
  
   


  @override
  Widget build(BuildContext context) {

    List<int> fruits = [1,20,45,200,4500];
     fruits.add(100);
    // fruits.add('banana');
    // fruits.add('orange');


    return Scaffold(
      appBar: AppBar(title: Text('Lesson6',style: TextStyle(color: Colors.white),
    
      ),
      backgroundColor: Colors.orange,
      centerTitle: true,
      ),
      body: 
      Center(child: Column(children: [
      SizedBox(height: 20,),
      Text(fruits.toString(),style: TextStyle(fontSize: d),)
      ]),
      ),
      
    );
  }
}