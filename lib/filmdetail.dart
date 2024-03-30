import 'package:flutter/material.dart';

class FilmDetail extends StatefulWidget {
  String image;
  String filmName;
  String genre;
  double rating;
  String description;

   FilmDetail( { super.key,
   required this.image,
   required this.filmName,
   required this.genre,
   required this.rating,
   required this.description});

  @override
  State<FilmDetail> createState() => FilmDetailState();
}

class FilmDetailState extends State<FilmDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 108, 174, 228),
        title: Text('Avatar'),
        
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: Image.network(
             widget.image,
            width: 190,
            height: 190,
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Название   ',
                style: TextStyle(fontSize: 16),
              ),
              Text(
                widget.filmName,
                style: TextStyle(fontSize: 24),
              ),
            ],
          ),
          SizedBox(height: 10,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Жанр   ',
              style: TextStyle(fontSize: 16),
            ),
             Text(
              widget.genre,
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Рейтинг:   ',
              style: TextStyle(fontSize: 16),
            ),
             Text(
              widget.rating.toString(),
              style: TextStyle(fontSize: 24),
            ),
          ],
        ),
        SizedBox(height: 15),
        Text(widget.description, style: TextStyle(fontSize: 16),),
        ],
      ),
    );
  }
}