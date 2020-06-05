import 'package:flutter/material.dart';

Color getColor(double percent) {
  Color color = Colors.white;

  if (percent > 0.5) {
    color = Colors.green;
  } else if (percent > 0.25) {
    color = Colors.yellow;
  } else if (percent <= 0.25) {
    color = Colors.red;
  }
   return color;
}
