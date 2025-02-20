import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/custom_button.dart';

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
    return SizedBox(
      width: 300,
      child: Material(
        shadowColor: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Left Side: Image
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  coverImageUrl,
                  height: 80,
                  width: 80,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(width: 12),

              /// Right Side: Text & Buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Name
                    Text(
                      name,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    const SizedBox(height: 8),

                    /// Buttons (Edit & Delete)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomButton(
                          onPressed: onEdit,
                          label: 'Edit',
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 10),
                        CustomButton(
                          onPressed: onDelete,
                          color: Colors.red,
                          label: 'Delete',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
