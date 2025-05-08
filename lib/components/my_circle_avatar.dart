import 'package:flutter/material.dart';

class MyCircleAvatar extends StatelessWidget {
  final double size;
  final double radius;

  const MyCircleAvatar({
    super.key,
    required this.size,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.white,
      child: Icon(
        Icons.person,
        size: size,
        color: Theme.of(context).colorScheme.inverseSurface,
      ),
    );
  }

}