import 'package:flutter/material.dart';

class Buildoverview extends StatelessWidget {
  final String title;
  final IconData icon;
  final String value;
  final String subtitle;
  const Buildoverview(
      {super.key,
      required this.title,
      required this.icon,
      required this.value,
      required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty)
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.green),
                  ),
              ],
            ),
            Icon(icon, size: 48, color: Colors.deepPurple),
          ],
        ),
      ),
    );
  }
}
