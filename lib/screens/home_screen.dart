import 'package:ass2/data/data.dart';
import 'package:ass2/models/restaurant.dart';
import 'package:ass2/screens/cart_screen.dart';
import 'package:ass2/screens/profile.dart';
import 'package:ass2/widgets/recent_orders.dart';
import 'package:ass2/widgets/restaurant_details.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  buildRestaurant() {
    List<Widget> restaurantList = [];

    restaurants.forEach(
      (Restaurant restaurant) {
        restaurantList.add(
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => RestarantDetails(
                      restaurant: restaurant,
                    ),
                  ));
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0)),
              child: Row(children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Image(
                      image: AssetImage('${restaurant.imageUrl}'),
                      height: 150,
                      width: 150,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('${restaurant.name}'),
                    Text('${restaurant.address}'),
                    Text('0.2 Miles'),
                  ],
                )
              ]),
            ),
          ),
        );
      },
    );
    return Column(
      children: restaurantList,
    );
  }
  void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;
  });
}
int _selectedIndex = 0;
 static const List<Widget> _pages = <Widget>[
     Icon(
    Icons.shopping_bag,
    size: 150,
  ),
  Profile(),


 Profile()
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Food Delivery', style: TextStyle(color: Colors.white),),
        // leading: IconButton(
        //   icon: Icon(Icons.account_circle),
        //   onPressed: () {},
        // ),
        actions: [
          TextButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => CartScreen()));
              },
              child: Text(
                '(${currentUser.cart!.length})',
                style: TextStyle(color: Colors.white),
              ))
        ],
      ),
      drawer: DDR(),
  //     bottomNavigationBar: BottomNavigationBar(
  //        backgroundColor: Colors.white10,
  // elevation: 0,
  // iconSize: 40,
  //       currentIndex: _selectedIndex, //New
  // onTap: _onItemTapped, 
  //   items: const <BottomNavigationBarItem>[
      
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.shopping_bag),
  //       label: 'Cart',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //       label: 'Home',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.person),
  //       label: 'Profile',
  //     ),
  //   ],
  // ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: TextField(
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search',
                  suffixIcon: Icon(Icons.close)),
            ),
          ),
          Text('Recent Orders'),
          RecentOrders(),
          Column(
            children: [
              Text('Near by Restaurant'),
              buildRestaurant(),
            ],
          )
        ],
      ),
    );
  }
}

class DDR extends StatelessWidget {
  const DDR({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(  
      child: ListView(  
        // Important: Remove any padding from the ListView.  
        padding: EdgeInsets.zero,  
        children: <Widget>[  
          UserAccountsDrawerHeader(  
            accountName: Text("Nahian"),  
            accountEmail: Text("nahian@gmail.com"),  
            currentAccountPicture: CircleAvatar(  
              backgroundColor: Colors.orange,  
              child: Text(  
                "N",  
                style: TextStyle(fontSize: 40.0),  
              ),  
            ),  
          ),  
          ListTile(  
            leading: Icon(Icons.home), title: Text("Home"),  
            onTap: () {  
              Navigator.pop(context);  
            },  
          ),  
          ListTile(  
            leading: Icon(Icons.settings), title: Text("Settings"),  
            onTap: () {  
              Navigator.pop(context);  
            },  
          ),  
          ListTile(  
            leading: Icon(Icons.contacts), title: Text("Contact Us"),  
            onTap: () {  
              Navigator.pop(context);  
            },  
          ),  
        ],  
      ),  
    );
  }
}
