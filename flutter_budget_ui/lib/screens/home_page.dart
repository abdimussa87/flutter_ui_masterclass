import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/data/data.dart';
import 'package:flutter_budget_ui/widgets/bar_chart.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            forceElevated: true,
            floating: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Simple Budget"),
              centerTitle: true,
            ),
            leading: IconButton(
              icon: Icon(Icons.settings),
              iconSize: 30,
              onPressed: () {},
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.add,
                  size: 30,
                ),
                onPressed: () {},
              ),
            ],
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(color: Colors.black12, offset: Offset(0, 2))
                    ],
                  ),
                  child: BarChart(weeklySpending),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
