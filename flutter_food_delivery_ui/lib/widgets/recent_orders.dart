import 'package:flutter/material.dart';

import '../data/data.dart';
import '../models/order.dart';

class RecentOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal:20.0),
          child: Text(
            'Recent Orders',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
        ),
        Container(
          height: 120,
          
          child: ListView.builder(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: currentUser.orders.length,
            itemBuilder: (BuildContext context, int index) {
              Order order = currentUser.orders[index];
              return _buildRecentOrder(context, order);
            },
          ),
        ),
      ],
    );
  }

  _buildRecentOrder(BuildContext context, Order order) {
    return Container(
      margin: EdgeInsets.all(15),
      width: 320,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
        border: Border.all(width: 0.6, color: Colors.grey),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image(
                    width: 100,
                    height: MediaQuery.of(context).size.width / 3 - 15,
                    fit: BoxFit.cover,
                    image: AssetImage(
                      order.food.imageUrl,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          order.food.name ,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          order.restaurant.name,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        Text(
                          order.date,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w400),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 15),
            child: FloatingActionButton(
              heroTag: null,
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(Icons.add),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
