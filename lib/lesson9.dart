import 'package:flutter/material.dart';

class Lesson9 extends StatefulWidget {
  const Lesson9({super.key});

  @override
  State<Lesson9> createState() => _Lesson9State();
}

class _Lesson9State extends State<Lesson9> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Вторая страница'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text('Какой-то текст'),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Вернуться назад',
                  style: TextStyle(color: Colors.black, fontSize: 17),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
          )
        ],
      ),
    );
  }
}
