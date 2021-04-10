import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      child: Text(
        "VIRA",
        style: TextStyle(
            fontFamily: "SpaceAge", color: Color(0xFF6F8D67), fontSize: 18.0),
      ),
    );
  }
}
