import 'package:flutter/material.dart';

class myIconButton extends StatelessWidget {
  const myIconButton({super.key, required this.imagePath});

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.circular(16),
          color: Colors.white),
      child: Image.asset(
        imagePath,
        height: 40,
      ),
    );
  }
}
