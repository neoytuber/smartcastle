import 'package:flutter/material.dart';

class ReceptDetails extends StatefulWidget {
  String name;
  String image;
  String rating;
  String cookTime;
  List<String> ingredients;
  String kuhnya;

  ReceptDetails(
      {super.key,
      required this.name,
      required this.image,
      required this.rating,
      required this.cookTime,
      required this.ingredients,
      required this.kuhnya});

  @override
  State<ReceptDetails> createState() => _ReceptDetailsState();
}

class _ReceptDetailsState extends State<ReceptDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
          backgroundColor: Colors.orangeAccent,
          title: Text(
            widget.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          )),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(children: [
            Image.network(widget.image),
            Positioned(
              top: 20,
              right: 20,
              child: Text(
                widget.rating,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ]),
          
          Row(
            children: [
              Text(
                'CookTime: ',
                style: TextStyle(fontSize: 20),
              ),
              Text(
            widget.cookTime,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
            ],
          ),
          
          SizedBox(height: 40),
          ListView.builder(
            itemCount: widget.ingredients.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Text(
                widget.ingredients[index],
                style: TextStyle(fontSize: 20),
              );
            },
          )
        ],
      ),
    );
  }
}
