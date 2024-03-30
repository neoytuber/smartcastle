import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/info.dart';

class ApiList extends StatefulWidget {
  const ApiList({super.key});

  @override
  State<ApiList> createState() => _ApiListState();
}

class _ApiListState extends State<ApiList> {

  
  List<String> products = ['apple', 'banana', 'cola'];
  List<Info> infoList = [];
  bool listLoading = false;
  @override

  void initState() {
    super.initState();
    getInfoList();
  }

  Future getInfoList() async {
    setState(() {
      listLoading = true;
    });
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/albums'));

    if (response.statusCode == 200) {
      List<Info> apiList = List.from(jsonDecode(response.body))
          .map((map) => Map<String, dynamic>.from(map))
          .map((Map<String, dynamic> map) => Info.fromJson(map))
          .toList();
          setState(() {
            infoList = apiList;

          });
          infoList.sort((a, b) => a.title!.compareTo(b.title!));
          setState(() {
            listLoading = false;
          });

      print('Vse ok !!!');

    } else {
      throw '4to to ne tak !';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Api_List',
            style: TextStyle(color: Colors.white, fontSize: 26)),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: 
      listLoading == true ? Center(child: CircularProgressIndicator()):
      ListView.separated(
          itemCount: infoList.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(4.0),
              child: Column(
                children: [
                  Text(
                    infoList[index].title!,
                    style: TextStyle(fontSize: 26),
                  
                  ),
                  Text(
                    infoList[index].userId!.toString(),
                    style: TextStyle(fontSize: 26),
                  
                  ),
                  Text(
                    infoList[index].id!.toString(),
                    style: TextStyle(fontSize: 26),
                  
                  ),
      
                ],
              ),
              
            );
          },
          separatorBuilder: (BuildContext context, int index) {
            return Divider(
               thickness: 2,
               height: 0,
            );
          }),
    );
  }
}
