import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({required this.color , Key? key}) : super(key: key);
  final Color color;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: color,
      actions: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              color: Colors.grey,
            )),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.widgets_sharp, color: Colors.grey)),
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active, color: Colors.grey)),
      ],
    );
  }

  @override
  final Size preferredSize = const Size.fromHeight(60);
}
