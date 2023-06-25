import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final double balance;
  final int expariedYear;
  final int expariedMonth;
  final int cardNumber;
  // ignore: prefer_typing_uninitialized_variables
  final color;
  const MyCard({
    super.key,
    required this.balance,
    required this.expariedYear,
    required this.expariedMonth,
    required this.cardNumber,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Container(
        width: 300,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Balance",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "\$ ${balance.toString()}",
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "$cardNumber",
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  "$expariedYear/$expariedMonth",
                  style: const TextStyle(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
