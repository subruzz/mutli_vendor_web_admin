import 'package:flutter/material.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});
  Widget items(int flex, String name) {
    return Expanded(
      flex: flex,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.yellow.shade900,
          border: Border.all(),
        ),
        child: Text(
          name,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          'Manage Vendors',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        Row(
          children: [
            items(1, 'IMAGE'),
            items(3, 'NAME'),
            items(2, 'PRICE'),
            items(2, 'QUANTITY'),
            items(1, 'ACTION'),
            items(1, 'VIEW MORE'),
          ],
        )
      ],
    );
  }
}
