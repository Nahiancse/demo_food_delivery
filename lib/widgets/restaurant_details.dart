import 'package:ass2/data/data.dart';
import 'package:ass2/models/food.dart';
import 'package:ass2/models/restaurant.dart';
import 'package:flutter/material.dart';

class RestarantDetails extends StatefulWidget {
  Restaurant? restaurant;

  RestarantDetails({this.restaurant});

  @override
  State<RestarantDetails> createState() => _RestarantDetailsState();
}

class _RestarantDetailsState extends State<RestarantDetails> {
  buildMenuItem(Food menuItem) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.all(8.0),
          height: 140,
          width: 140,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(
                '${menuItem.imageUrl}',
              ),
            ),
          ),
          child: Positioned(
            bottom: 10,
            left: 20,
            child: Column(
              children: [
                Text(
                  '${menuItem.name}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  '\$ ${menuItem.price}',
                  style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.red,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Image(
                image: AssetImage('${widget.restaurant!.imageUrl}'),
                height: 210,
                width: MediaQuery.of(context).size.width,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.deepOrangeAccent,
                        )),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('${widget.restaurant!.name}'),
                  Text('${widget.restaurant!.address}'),
                ],
              ),
              Text('0.2 Miles'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Center(child: Text('Review')),
              ),
              Container(
                child: Center(child: Text('Contact')),
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    color: Colors.deepOrangeAccent,
                    borderRadius: BorderRadius.circular(25.0)),
              ),
            ],
          ),
          SizedBox(
            height: 8.0,
          ),
          Text('Menu'),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              children: List.generate(widget.restaurant!.menu!.length, (index) {
                Food food = widget.restaurant!.menu![index];
                return buildMenuItem(food);
              }),
            ),
          )
        ],
      ),
    );
  }
}
