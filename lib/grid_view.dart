import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lesson4/catalog_api.dart';
import 'package:lesson4/catalog_details.dart';
import 'package:lesson4/first.dart';

class GridViewScreen extends StatefulWidget {
  const GridViewScreen({super.key});

  @override
  State<GridViewScreen> createState() => _GridViewScreenState();
}

class _GridViewScreenState extends State<GridViewScreen> {
  List<Products>? products;
  bool listLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProducts();
  }

  Future getProducts() async {
    setState(() {
      listLoading = true;
    });
    final response = await http.get(Uri.parse('http://dummyjson.com/products'));
    if (response.statusCode == 200) {
      Catalog infoModel = Catalog.fromJson(jsonDecode(response.body));

      setState(() {
        products = infoModel.products;
      });
      setState(() {
        listLoading = false;
      });
    } else {
      throw 'Error';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Каталог товаров'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        ),
        body: RefreshIndicator(
            onRefresh: () async {
              getProducts();
            },
            child: listLoading == true
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                        itemCount: products!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CatalogDetails(
                                              image: products![index]
                                                  .images!
                                                  .first,
                                              title: products![index].title!,
                                              price: products![index].price.toString(),
                                              description:products![index].description!
                                            )));
                              },
                              child: Container(
                                padding: EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        width: 1, color: Colors.blue),
                                    borderRadius: BorderRadius.circular(16)),
                                child: Column(
                                  children: [
                                    Expanded(
                                        child: Image.network(
                                      products![index].images!.first,
                                      fit: BoxFit.contain,
                                      width: double.infinity,
                                    )),
                                    Text(products![index].title!),
                                    Text(products![index].price.toString()),
                                    Expanded(child: Text(products![index].description!)),
                                    // Text(products![index].description!),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  )));
  }
}
