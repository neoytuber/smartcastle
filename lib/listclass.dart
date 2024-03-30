import 'package:flutter/material.dart';
import 'package:lesson4/filmdetail.dart';
import 'package:lesson4/movie.dart';

class ListClass extends StatefulWidget {
  const ListClass({super.key});

  @override
  State<ListClass> createState() => ListClassState();
}

class ListClassState extends State<ListClass> {
  List<Movie> films = [
    Movie(
      'Аватар',
      'https://images.disneymovieinsiders.com/3836ad6fbd0491e0fbe9c3fe2f6786aa/9f684517-cf81-42c9-a85d-51a046ce942d.jpg',
      ' Фантасика',
      9.0,
      'Полное описание фильма'),
    Movie(
        'Мадагаскар',
        'https://image.pmgstatic.com/cache/resized/w420/files/images/film/posters/159/513/159513716_33238b.jpg',
        ' Комедия',
        9.0,
        'Полное описание фильма'),
    Movie(
        'Гарри Поттер',
        'https://picfiles.alphacoders.com/420/420268.jpg',
        ' Фэнтези',
        8.6,
        'Полное описание фильма'),
    Movie(
        'Властелин колец',
        'https://upload.wikimedia.org/wikipedia/ru/f/f0/The_Lord_of_the_Rings._The_Two_Towers_%E2%80%94_movie.jpg',
        ' Фентези',
        7.5,
        'Полное описание фильма')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Список фильмов'),
        backgroundColor: Colors.yellow,
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: films.length,
          itemBuilder: (BuildContext context, int index) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 3, bottom: 0),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => FilmDetail(
                                image: films[index].Image,
                                filmName: films[index].name,
                                genre: films[index].genre,
                                rating: films[index].rating,
                                description: films[index].description)));
                  },
                  child: Container(
                    color: Colors.blue,
                    child: Row(
                      children: [
                        Image.network(
                          films[index].Image,
                          width: 150,
                          height: 150,
                        ),
                        Column(
                          children: [
                            Text(
                              films[index].name,
                              style:
                                  TextStyle(fontSize: 20, color: Colors.black),
                            ),
                            Text(films[index].genre),
                            Text(films[index].rating.toString())
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }),
    );
  }
}
