import 'package:flutter/material.dart';
import 'package:lesson4/lesson9.dart';

class Lesson8 extends StatefulWidget {
  const Lesson8({super.key});

  @override
  State<Lesson8> createState() => _Lesson8State();
}

class _Lesson8State extends State<Lesson8> {
  List<String> products = ['Хлеб', 'Масло', 'Сок', 'Торт'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Продукты'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Column(children: [
        InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder:(context)=> Lesson9()));
          },
          child: Container(
            color: Colors.yellow,
            child: Row(
              children: [
                 Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    'assets/hleb.png',
                    height: 100,
                    width: 100,
                  ),
                ),
                Column(
                  children: [
                    Text(
                      products.first,
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                    Text('500тг')
                  ],
                ),
               
              ],
            ),
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 10,
        ),
        Container(
          color: Colors.blue,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/hleb.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Column(
                children: [
                  Text(
                    products[1],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text('500тг'),
                ],
              ),
              
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 10,
        ),
        Container(
          color: Colors.pink,
          child: Row(
            children: [
               Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/hleb.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Column(
                children: [
                  Text(
                    products[2],
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text('500тг')
                ],
              ),
             
            ],
          ),
        ),
        Divider(
          color: Colors.black,
          thickness: 10,
        ),
        Container(
          color: Colors.orange,
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  'assets/hleb.png',
                  height: 100,
                  width: 100,
                ),
              ),
              Column(
                children: [
                  Text(
                    products.last,
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text('500тг'),
                ],
              ),
              
            ],
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.only(left:20,right: 20),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> Lesson9()));
            },
            child: Text(
              'Далее',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
        SizedBox(height: 20),
        Container(
          padding: EdgeInsets.only(left:20,right: 20),
          width: double.infinity,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder:(context)=> Lesson9()));
            },
            child: Text(
              'Далее',
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20))),
          ),
        ),
      ]),
    );
  }
}
