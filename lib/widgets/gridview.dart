import 'package:flutter/material.dart';

class GridWidget extends StatelessWidget {
  const GridWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: 9,
      itemBuilder:
          (context, index) => GestureDetector(
            child: Container(
              color: index % 2 == 0 ? Colors.red : Colors.green,
              child: Center(child: Text("X")),
            ),
          ),
    );
  }
}
