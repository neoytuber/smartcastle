import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/recept_details.dart';
import 'package:lesson4/recept_model.dart';

class ReceptScreen extends StatefulWidget {
  const ReceptScreen({super.key});

  @override
  State<ReceptScreen> createState() => _ReceptScreenState();
}

class _ReceptScreenState extends State<ReceptScreen> {
  List<Recipes> recipes = [];

  @override
  void initState() {
    super.initState();
    getRecepts();
  }

  Future getRecepts() async {
    final response = await http.get(Uri.parse('https://dummyjson.com/recipes'));

    if (response.statusCode == 200) {
      ReceptModel receptModel = ReceptModel.fromJson(jsonDecode(response.body));

      setState(() {
        recipes = receptModel.recipes!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            title: Text(
              'Рецепт',
              style: TextStyle(color: Colors.white, fontSize: 30),
            )),
        body: ListView.builder(
          itemCount: recipes.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 10, bottom: 10),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ReceptDetails(
                                name: recipes[index].name!,
                                image: recipes[index].image!,
                                rating: recipes[index].rating.toString(),
                                cookTime:
                                    recipes[index].cookTimeMinutes.toString(),
                                ingredients: recipes[index].ingredients!,
                                kuhnya: recipes[index].cuisine!,
                              )));
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black),
                  ),
                  child: Column(
                    children: [
                      Stack(children: [ Image.network(recipes[index].image!),
                      Positioned(
                        top: 20,
                        right: 20,
                        child: Text(
                          recipes[index].rating.toString(),
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      )
                      ]),
                      Text(
                        recipes[index].name!,
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
