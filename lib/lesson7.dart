import 'package:flutter/material.dart';

class Lesson7 extends StatefulWidget {
  const Lesson7({super.key});

  @override
  State<Lesson7> createState() => _Lesson7State();
}

class _Lesson7State extends State<Lesson7> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(221, 29, 27, 27),
        appBar: AppBar(
          leading: Icon(Icons.arrow_back_ios_new_outlined,color: Colors.white,),
          title: Text(
            'Сегодня в кино',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Row(
              children: [
                Icon(Icons.location_on_outlined,color: Colors.white,),
                Text(
                  ' Город',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                
                Spacer(),
                Text(
                  'Шымкент',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Icon(Icons.arrow_forward_ios,color:Colors.white)
              ],
            ),
            Divider(),
            Row(
              children: [
                Icon(Icons.calendar_month_outlined,color: Colors.white,),
                Text(
                  ' Дата',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),
                Text(
                  '12 декабря, 2023',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Icon(Icons.arrow_forward_ios,color:Colors.white),
              ],
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Жанры',
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Spacer(),
                Text(
                  'Все жанры',
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Icon(Icons.arrow_forward_ios,color:Colors.white),
              ],
            ),
            Divider(),
            SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.only(left: 10, right: 10),
              child: Container(
                color: Colors.black,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Image.asset(
                    'assets/fffg.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мальчик и птица',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Kimitachi wa Dou Ikiru ka(2023)',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'аниме, мультфильм, драма',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                color: Colors.black,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Image.asset(
                    'assets/fffg.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мальчик и птица',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Kimitachi wa Dou Ikiru ka(2023)',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'аниме, мультфильм, драма',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
            ),
             SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                color: Colors.black,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Image.asset(
                    'assets/fffg.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мальчик и птица',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Kimitachi wa Dou Ikiru ka(2023)',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'аниме, мультфильм, драма',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left:10,right: 10),
              child: Container(
                color: Colors.black,
                child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Image.asset(
                    'assets/fffg.png',
                    height: 150,
                    width: 150,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Мальчик и птица',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Kimitachi wa Dou Ikiru ka(2023)',
                        style: TextStyle(color: Colors.white),
                      ),
                      Text(
                        'аниме, мультфильм, драма',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  ),
                ]),
              ),
            ),
          ]),
        ));
  }
}
