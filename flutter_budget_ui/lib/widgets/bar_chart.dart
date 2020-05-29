import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> weeklySpending;

  BarChart(this.weeklySpending);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          'Weekly Spending',
          style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 30,
              onPressed: () {},
            ),
            Text(
              'May 29, 2020 - June 04, 2020',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              iconSize: 30,
              onPressed: () {},
            ),
          ],
        ),
        Row(
          children: <Widget>[
            Bar(
                label: 'Su',
                amountSpent: weeklySpending[0],
                mostExpensive: 200),
          ],
        ),
      ],
    );
  }
}

class Bar extends StatelessWidget {
  final label;
  final amountSpent;
  final mostExpensive;
  Bar({
    this.label,
    this.amountSpent,
    this.mostExpensive,
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text('\$${amountSpent.toStringAsFixed(2)}'),
        Text(label)
      ],
    );
  }
}
