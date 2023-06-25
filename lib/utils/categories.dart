import 'package:flutter/material.dart';

class CategoriesButton extends StatelessWidget {
  final String imgPath;
  final String text;
  const CategoriesButton({
    super.key,
    required this.imgPath,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  blurRadius: 40,
                  spreadRadius: 10,
                )
              ]),
          child: Image.asset(
            imgPath,
            width: 50,
            height: 50,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          text,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.grey[700],
          ),
        ),
      ],
    );
  }
}
