import 'package:flutter/material.dart';

class WithdrawalScreen extends StatelessWidget {
  const WithdrawalScreen({super.key});
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
            items(1, 'NAME'),
            items(3, 'AMOUNT'),
            items(2, 'BANK NAME'),
            items(2, 'BANK ACCOUNT'),
            items(1, 'EMAIL'),
            items(1, 'PHONE'),
          ],
        )
      ],
    );
  }
}
