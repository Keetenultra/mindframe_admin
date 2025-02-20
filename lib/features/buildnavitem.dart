import 'package:flutter/material.dart';

class Buildnavitem extends StatelessWidget {
  final Function() ontap;
  final IconData icon;
  final String title;
  final bool isActive;

  const Buildnavitem(
      {super.key,
      required this.icon,
      required this.title,
      required this.ontap,
      required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? const Color.fromARGB(255, 149, 63, 247)
          : Colors.deepPurple,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: ontap,
      ),
    );
  }
}
