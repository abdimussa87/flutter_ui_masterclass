import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/models/restaurant.dart';
import 'package:flutter_food_delivery_ui/screens/restaurant_detail_page.dart';

class SingleRestaurantView extends StatelessWidget {
  final Restaurant restaurant;
  SingleRestaurantView({this.restaurant});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (_) => RestaurantDetailPage(restaurant: restaurant))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15), color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Hero(
              tag: restaurant.imageUrl,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image(
                  height: MediaQuery.of(context).size.width * .40,
                  width: MediaQuery.of(context).size.width * .40,
                  fit: BoxFit.cover,
                  image: AssetImage(restaurant.imageUrl),
                ),
              ),
            ),
            Expanded(
                          child: Container(
                            margin: EdgeInsets.all(12),
                            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    restaurant.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  _buildRatingStars(),
                  SizedBox(height: 4),
                  Text(
                    restaurant.address,
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 4),
                  Text(
                    '0.2 miles away',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
                          ),
            ),
          ],
        ),
      ),
    );
  }

  _buildRatingStars() {
    List<Widget> rate = [];
    for (int i = 0; i < restaurant.rating; i++) {
      rate.add(Text('⭐ '));
    }
    return Row(
      children: rate,
    );
  }
}
