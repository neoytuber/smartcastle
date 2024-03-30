import 'package:flutter/material.dart';

class CatalogDetails extends StatefulWidget {
  String image;
  String title;
  String price;
  String description;
  CatalogDetails(
      {super.key,
      required this.image,
      required this.title,
      required this.price,
      required this.description
      });

  @override
  State<CatalogDetails> createState() => _CatalogDetailsState();
}

class _CatalogDetailsState extends State<CatalogDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('название продукта'),
      ),
      body: Column(
        children: [
          Image.network(widget.image),
          SizedBox(
            height: 20,
          ),
          Text(
            widget.title,
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
           '${widget.price} ₸',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
           widget.description,
            style: TextStyle(fontSize: 18),
          ),
        ],
      ),
    );
  }
}
