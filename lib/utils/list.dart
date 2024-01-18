import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

Widget listCoffee(
    {required String title,
    required int index,
    required bool isSelected,
    required VoidCallback onPressed}) {
  return Padding(
    padding: EdgeInsets.only(
      left: index == 0 ? 25 : 10,
    ),
    child: InkWell(
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.orange : Colors.white,
                fontSize: isSelected ? 20 : 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
