import 'package:flutter/material.dart';
import 'package:lesson4/profile.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController name = TextEditingController();
  TextEditingController familya = TextEditingController();
  TextEditingController otchestvo = TextEditingController();
  TextEditingController email = TextEditingController();

  //final _formkey = GlobalKey();

  List<String> cities = ['Шымкент', 'Алматы', 'Астана', 'Кокшетау', 'Актау'];
  String selectedCity = 'Шымкент';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(children: [
            TextField(
                controller: name,
                decoration:
                    InputDecoration(labelText: 'Имя', hintText: 'Напишите имя'),
                keyboardType: TextInputType.name),
            TextField(
                controller: familya,
                decoration: InputDecoration(
                    labelText: 'Фамилия', hintText: 'Напишите фамилию'),
                keyboardType: TextInputType.name),
            TextField(
                controller: otchestvo,
                decoration: InputDecoration(
                    labelText: 'Отчество', hintText: 'Напишите отчество'),
                keyboardType: TextInputType.name),

            DropdownButtonFormField(
                items: cities
                    .map((city) => DropdownMenuItem(
                          value: city,
                          child: Text(city),
                        ))
                    .toList(),
                    value: selectedCity,
                    onChanged:(newCity){
                  selectedCity = newCity!;
                }),



            TextField(
                decoration: InputDecoration(
                    labelText: 'Номер телефона', hintText: 'Напишите номер'),
                keyboardType: TextInputType.phone),
            TextField(
                controller: email,
                decoration: InputDecoration(
                    labelText: 'e-mail', hintText: 'Напишите почту'),
                keyboardType: TextInputType.emailAddress),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Profile(
                              name: name.text,
                              familya: familya.text,
                              otchestvo: otchestvo.text,
                              email: email.text,
                              city: selectedCity,
                            )));
              },
              child: Text(
                'Зарегистрироваться',
                style: TextStyle(color: Colors.black, fontSize: 16),
              ),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            )
          ]),
        ),
      ),
    );
  }
}
