import 'package:flutter/material.dart';
import 'package:flutter_application_1/theme/app_theme.dart';

class CustomCategoryCard extends StatelessWidget {
  final String coverImageUrl;
  final String name;
  final Function() onEdit, onDelete;

  const CustomCategoryCard({
    super.key,
    required this.coverImageUrl,
    required this.name,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      shadowColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Left Side: Image
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                coverImageUrl,
                height: 80,
                width: 200,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(width: 12),
            Text(
              name,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Colors.black,
                  ),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FeatureCard(
                  icon: Icons.edit,
                  text: "Edit",
                  ontap: onEdit,
                ),
                const SizedBox(
                  width: 10,
                ),
                FeatureCard(
                  icon: Icons.delete,
                  text: "Delete",
                  ontap: onDelete,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String text;
  final Function()? ontap;
  final Color color, backgroundColor, borderColor;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.text,
    this.ontap,
    this.color = Colors.black87,
    this.backgroundColor = Colors.white,
    this.borderColor = outlineColor,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: backgroundColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: borderColor),
      ),
      child: InkWell(
        onTap: ontap,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 20,
                color: color,
              ),
              SizedBox(width: 4),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: color,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
