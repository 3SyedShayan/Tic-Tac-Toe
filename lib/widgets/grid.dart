import 'package:flutter/material.dart';

class Grid extends StatelessWidget {
  const Grid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemBuilder:
          (context, index) => GestureDetector(
            child: Container(color: Colors.green, padding: EdgeInsets.all(7)),
          ),
    );
  }
}
