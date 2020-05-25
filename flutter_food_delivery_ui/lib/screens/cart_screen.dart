import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_ui/data/data.dart';
import 'package:flutter_food_delivery_ui/models/order.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = 0;
    currentUser.cart.forEach(
        (Order order) => totalPrice += order.quantity * order.food.price);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart(${currentUser.cart.length})'),
      ),
      body: ListView.separated(
        physics: BouncingScrollPhysics(),
        separatorBuilder: (context, index) {
          return Divider(height: 1, color: Colors.grey);
        },
        itemCount: currentUser.cart.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < currentUser.cart.length) {
            Order order = currentUser.cart[index];
            return _buildListItem(order);
          }
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Estimated Delivery Time',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      '25 mins',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Total Price',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    ),
                    Text(
                      ' \$${totalPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.green[700]),
                    ),
                   
                  ],
                ),
                SizedBox(height: MediaQuery.of(context).size.width * .25),
              ],
            ),
          );
        },
      ),
      bottomSheet: Container(
        height: MediaQuery.of(context).size.width * .25,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(0, -1),
              blurRadius: 6,
            ),
          ],
        ),
        child: Center(
          child: FlatButton(
            child: Text(
              "CHECKOUT",
              style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  letterSpacing: 2,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  _buildListItem(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(right: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: DecorationImage(
                        image: AssetImage(order.food.imageUrl),
                        fit: BoxFit.cover,
                      )),
                  width: MediaQuery.of(context).size.width * .4,
                  height: MediaQuery.of(context).size.width * .35,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        order.food.name,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 4,
                      ),
                      Text(
                        order.restaurant.name,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 100,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(width: 0.8, color: Colors.black54),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  order.quantity > 0 ? order.quantity-- : {};
                                });
                              },
                              child: Text(
                                '-',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Text(
                              order.quantity.toString(),
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  order.quantity++;
                                });
                              },
                              child: Text(
                                '+',
                                style: TextStyle(
                                  fontSize: 20,
                                  color: Theme.of(context).primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Text(
            '\$${order.quantity * order.food.price}',
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w600, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
