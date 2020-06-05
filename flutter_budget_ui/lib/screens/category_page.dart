import 'package:flutter/material.dart';
import 'package:flutter_budget_ui/helpers/color_helper.dart';
import 'package:flutter_budget_ui/models/category_model.dart';
import 'package:flutter_budget_ui/models/expense_model.dart';
import 'package:flutter_budget_ui/widgets/radial_painter.dart';

class CategoryPage extends StatefulWidget {
  final Category category;
  CategoryPage({this.category});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  @override
  Widget build(BuildContext context) {
    double amountSpent = 0;
    double maxAmount = widget.category.maxAmount;
    widget.category.expenses.forEach((expense) {
      amountSpent += expense.cost;
    });
    double percent = (maxAmount - amountSpent) / maxAmount;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          widget.category.name,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {},
            iconSize: 30,
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              height: 300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(
                  10,
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 2),
                    color: Colors.black12,
                    blurRadius: 6,
                  )
                ],
              ),
              child: CustomPaint(
                painter: RadialPainter(
                    bgColor: Colors.grey[200],
                    lineColor: getColor(percent),
                    width: 15,
                    percent: percent),
                child: Center(
                  child: Text(
                    '\$${(maxAmount - amountSpent).toStringAsFixed(2)}/ \$${maxAmount.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            _buildItemsView(),
          ],
        ),
      ),
    );
  }

  _buildItemsView() {
    List<Widget> items = [];
    widget.category.expenses.forEach((Expense expense) {
      items.add(Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              color: Colors.black12,
              blurRadius: 6,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: Text(
                '${expense.name}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '-\$${(expense.cost).toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ));
    });
    return Column(
      children: items,
    );
  }
}
