import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_search_icon.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(
              fontSize: 30,
            ),
          ),
          CustomSearchIcon(),
        ],
      ),
    );
  }
}
