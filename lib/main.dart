import 'package:flutter/material.dart';
import 'package:lesson4/admin.dart';
import 'package:lesson4/api.dart';
import 'package:lesson4/api_list.dart';
import 'package:lesson4/catalog_details.dart';
import 'package:lesson4/country_screen.dart';
import 'package:lesson4/filmdetail.dart';
import 'package:lesson4/first.dart';
import 'package:lesson4/listclass.dart';
import 'package:lesson4/login.dart';
import 'package:lesson4/main_page.dart';
import 'package:lesson4/news_list.dart';
import 'package:lesson4/profile.dart';
import 'package:lesson4/profile1.dart';
import 'package:lesson4/recept_screen.dart';
import 'package:lesson4/register.dart';
import 'package:lesson4/registration.dart';
import 'package:lesson4/ricki_screen.dart';
import 'package:lesson4/shared.dart';
import 'package:lesson4/weather_screen.dart';
import 'package:lesson4/zametki.dart';
import 'package:lesson4/grid_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

 

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CountryScreen());
  }
}
