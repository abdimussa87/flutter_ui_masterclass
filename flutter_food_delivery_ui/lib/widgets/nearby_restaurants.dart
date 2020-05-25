import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/widgets/single_restauant_view.dart';

class NearbyRestaurants extends StatelessWidget {
  List<Widget> _restaurantsView() {
    List<Widget> _restaurantsWidget = [];
    restaurants.forEach((rest) => _restaurantsWidget.add(SingleRestaurantView(
          restaurant: rest,
        )));
    return _restaurantsWidget;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Text(
            'Nearby Restaurants',
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
        ),
        Column(
          children: _restaurantsView(),
        ),
      ],
    );
  }
}
