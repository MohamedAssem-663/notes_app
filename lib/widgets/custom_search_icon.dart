import 'package:flutter/material.dart';

class CustomSearchIcon extends StatelessWidget {
  const CustomSearchIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      child: Center(
        child: Icon(
          Icons.search,
          size: 28,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.05),
        borderRadius: BorderRadius.circular(16),
      ),
    );
  }
}
