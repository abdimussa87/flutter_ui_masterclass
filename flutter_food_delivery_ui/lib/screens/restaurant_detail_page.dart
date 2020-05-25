import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';

class RestaurantDetailPage extends StatefulWidget {
  final Restaurant restaurant;
  RestaurantDetailPage({this.restaurant});
  @override
  _RestaurantDetailPageState createState() => _RestaurantDetailPageState();
}

class _RestaurantDetailPageState extends State<RestaurantDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Hero(
                tag: widget.restaurant.imageUrl,
                child: Container(
                  height: MediaQuery.of(context).size.width * .65,
                  child: Image(
                    width: MediaQuery.of(context).size.width,
                    image: AssetImage(widget.restaurant.imageUrl),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                top: 40,
                right: 15,
                left: 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      color: Colors.white,
                      iconSize: 30,
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                    IconButton(
                      icon: Icon(Icons.favorite),
                      color: Colors.red,
                      iconSize: 30,
                      onPressed: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      widget.restaurant.name,
                      style: TextStyle(
                          fontSize: 22,
                          letterSpacing: 1.2,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    _buildRatingStars(),
                    SizedBox(height: 4),
                    Text(
                      widget.restaurant.address,
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
                Text('0.2 miles away')
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FlatButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Reviews",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
              FlatButton(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    "Contact",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(height: 1.6),
          Center(
              child: Text(
            'Menu',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w600, letterSpacing: 1.2),
          )),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(8),
              crossAxisCount: 2,
              children: _buildGridTile(),
            ),
          )
        ],
      ),
    );
  }

  _buildRatingStars() {
    List<Widget> rate = [];
    for (int i = 0; i < widget.restaurant.rating; i++) {
      rate.add(Text('⭐ '));
    }
    return Row(
      children: rate,
    );
  }

  _buildGridTile() {
    List<Widget> _gridTiles = [];
    widget.restaurant.menu.forEach((menu) => _gridTiles.add(
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: AssetImage(menu.imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                  width: 175,
                  height: 175,
                ),
                Container(
                  width: 175,
                  height: 175,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black54,
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0.3, 0.6]),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      menu.name,
                      style: TextStyle(
                        fontSize: 24,
                        letterSpacing: 1.2,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '\$${menu.price}',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.green[600]),
                    ),
                  ],
                ),
                Positioned(
                  bottom: 18,
                  right: 10,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Theme.of(context).primaryColor,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.add),
                      iconSize: 30,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
    return _gridTiles;
  }
}
