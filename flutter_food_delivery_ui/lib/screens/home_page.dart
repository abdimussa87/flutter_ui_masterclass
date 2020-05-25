import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/screens/cart_screen.dart';
import 'package:flutter_food_delivery_ui/widgets/nearby_restaurants.dart';
import 'package:flutter_food_delivery_ui/widgets/recent_orders.dart';

import '../data/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Food Delivery',
        ),
        leading: IconButton(
          icon: Icon(
            Icons.account_circle,
            size: 30,
          ),
          onPressed: () {},
        ),
        actions: <Widget>[
          FlatButton(
            child: Text(
              "Cart (${currentUser.cart.length})",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            ),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (_) => CartScreen())),
          ),
        ],
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 15),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 0.8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(
                    width: 0.8,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                hintText: 'Search Food or Restaurants',
                fillColor: Colors.white,
                filled: true,
                prefixIcon: Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 30,
                  ),
                  onPressed: () {
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      _searchController.clear();
                      FocusScope.of(context).unfocus();
                    });
                  },
                ),
              ),
            ),
          ),
          RecentOrders(),
          NearbyRestaurants(),
        ],
      ),
    );
  }
}
