import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Zametki extends StatefulWidget {
  const Zametki({super.key});

  @override
  State<Zametki> createState() => _ZametkiState();
}

class _ZametkiState extends State<Zametki> {
  List<String> zametki = [];

  TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getZametkiFromShared();
  }

  Future getZametkiFromShared() async {
    SharedPreferences sp = await SharedPreferences.getInstance();

    setState(() {
      zametki = sp.getStringList('zametki_key') ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Заметки',
          style: TextStyle(fontSize: 26),
        ),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.separated(
        itemCount: zametki.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return Dialog(
                        child: SizedBox(
                          height: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Вы точно хотите удалить?',
                                style: TextStyle(fontSize: 24),
                              ),
                              SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: Text('Нет')),
                                  SizedBox(width: 20),
                                  ElevatedButton(
                                    onPressed: () async {
                                      SharedPreferences sp =
                                          await SharedPreferences.getInstance();
                                      setState(() {
                                        zametki.removeAt(index);
                                        sp.setStringList(
                                            'zametki_key', zametki);
                                      });
                                      Navigator.pop(context);
                                    },
                                    child: Text('Да'),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    });
              },
              child: Text(
                zametki[index],
                style: TextStyle(fontSize: 24),
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) => Divider(
          thickness: 2,
          height: 0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          textController.clear();
          showDialog(
              context: context,
              builder: (context) {
                return Dialog(
                  backgroundColor: Colors.orangeAccent,
                  child: SizedBox(
                    height: 200,
                    child: Padding(
                      padding: EdgeInsets.all(20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextField(
                            controller: textController,
                          ),
                          SizedBox(height: 10),
                          ElevatedButton(
                            onPressed: () async {
                              SharedPreferences sp =
                                  await SharedPreferences.getInstance();
                              setState(() {
                                if (textController.text != '') {
                                  zametki.add(textController.text);
                                  sp.setStringList('zametki_key', zametki);
                                }
                              });

                              Navigator.pop(context);
                            },
                            child: Text('Добавить'),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.add),
      ),
    );
  }
}