import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lesson4/news_api.dart';
import 'package:http/http.dart' as http;

class NewsList extends StatefulWidget {
  const NewsList({Key? key}) : super(key: key);

  @override
  State<NewsList> createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  List<Articles>? newsFromServer = [];

  bool listLoading = false;
  DateTime currentTime = DateTime.now();
  @override
  void initState() {
    super.initState();
    getNewsList();
  }

  Future getNewsList() async {
    setState(() {
      listLoading = true;
    });
    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?apiKey=d14db04d12c348a6bac286ea1cd84620&language=ru'));
    if (response.statusCode == 200) {
      News newsModel = News.fromJson(jsonDecode(response.body));

      setState(() {
        newsFromServer = newsModel.articles;

        print(newsFromServer);
      });

      setState(() {
        listLoading = false;
      });
      print('Ok');
    } else {
      throw 'Stop!';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'News List',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: RefreshIndicator( onRefresh: () async {
        setState(() {
          currentTime = DateTime.now();
        });
          getNewsList();
      },
      
     child: listLoading == true
          ? Center(
              child: Platform.isIOS
                  ? CupertinoActivityIndicator()
                  : CircularProgressIndicator())
          : Column(
            children: [
              Expanded(child: Text('Дата обновления: ${DateFormat('HH:mm:ss').format(currentTime)}',style: TextStyle(fontSize: 24),)),
              ListView.separated(
                  itemCount: newsFromServer!.length,
                  shrinkWrap: true,
                  // ignore: body_might_complete_normally_nullable
                  itemBuilder: (context, index) {
                    return Padding(
                      
                      padding: const EdgeInsets.all(4.0),
                      child: Column(children: [
                        
                        Text(
                          newsFromServer![index].title!,
                          style:
                              TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          newsFromServer![index].author!,
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          DateFormat('dd MMMM yyyy').format(
                              DateTime.parse(newsFromServer![index].publishedAt!)),
                          style: TextStyle(fontSize: 20),
                        ),
                      ]),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider(
                      thickness: 2,
                      height: 0,
                    );
                  }),
            ],
          ),
    ),
    );
  }
}
