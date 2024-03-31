import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/country_model.dart';

class CountryScreen extends StatefulWidget {
  const CountryScreen({super.key});

  @override
  State<CountryScreen> createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  List<CountryModel> countries = [];
  @override
  void initState() {
    super.initState();
    getCountries();
  }

  Future getCountries() async {
    final response =
        await http.get(Uri.parse('https://restcountries.com/v3.1/all'));

    if (response.statusCode == 200) {
      List<CountryModel> countriesList = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => CountryModel.fromJson(map))
          .toList();

      setState(() {
        countries = countriesList;
        countries.sort((a, b) => a.name!.common!.compareTo(b.name!.common!));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
          backgroundColor: Color.fromRGBO(34, 43, 72, 1),
          title: Text(
            'Список Cтран',
            style: TextStyle(fontSize: 25, color: Colors.white),
          )),
      body: ListView.builder(
          itemCount: countries.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromRGBO(34, 43, 72, 1),
                    borderRadius: BorderRadius.circular(16)),
                child: Theme(
                  data: Theme.of(context)
                      .copyWith(unselectedWidgetColor: Colors.white),
                  child: ExpansionTile(
                    
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(countries[index].flags!.png!)),
                    title: Text(
                      countries[index].name!.common!,
                      style: TextStyle(color: Colors.white),
                    ),
                    children: [
                      Text('Столица: ${countries[index].capital!.first}',style: TextStyle(color: Colors.white),),
                      Text('Население: ${countries[index].population!.toString()}',style: TextStyle(color: Colors.white),),
                      Text('Площадь: ${countries[index].area!.toString()}',style: TextStyle(color: Colors.white),)
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }
}
