import 'package:flutter/material.dart';

class BarChart extends StatelessWidget {
  final List<double> weeklySpending;

  BarChart(this.weeklySpending);
  @override
  Widget build(BuildContext context) {
    double _mostExpensive = 0;
    weeklySpending.forEach((amount) {
      if (amount > _mostExpensive) {
        _mostExpensive = amount;
      }
    });
    return Padding(
      padding: const EdgeInsets.all(14.0),
      child: Column(
        children: <Widget>[
          Text(
            'Weekly Spending',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 1.2),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.arrow_back),
                iconSize: 30,
                onPressed: () {},
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'May 29, 2020 - June 04, 2020',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_forward),
                iconSize: 30,
                onPressed: () {},
              ),
            ],
          ),
          SizedBox(
            height: 6,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              Expanded(
                child: Bar(
                  label: 'Su',
                  amountSpent: weeklySpending[0],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'Mo',
                  amountSpent: weeklySpending[1],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'Tu',
                  amountSpent: weeklySpending[2],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'We',
                  amountSpent: weeklySpending[3],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'Th',
                  amountSpent: weeklySpending[4],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'Fr',
                  amountSpent: weeklySpending[5],
                  mostExpensive: _mostExpensive,
                ),
              ),
              Expanded(
                child: Bar(
                  label: 'Sa',
                  amountSpent: weeklySpending[6],
                  mostExpensive: _mostExpensive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Bar extends StatelessWidget {
  final label;
  final amountSpent;
  final mostExpensive;
  final double _maxBarHeight = 150;
  Bar({
    this.label,
    this.amountSpent,
    this.mostExpensive,
  });

  @override
  Widget build(BuildContext context) {
    final barHeight = amountSpent / mostExpensive * _maxBarHeight;
    return Column(
      children: <Widget>[
        Text(
          '\$${amountSpent.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(
          height: 6,
        ),
        Container(
          height: barHeight,
          width: 20,
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: Offset(0, 2),
                  blurRadius: 6,
                )
              ]),
        ),
        SizedBox(
          height: 6,
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
