import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/category/custom_category_card.dart';

import '../../common_widget/custom_search.dart';

class IdeaManagements extends StatelessWidget {
  final String? title;
  final String? status;
  const IdeaManagements({super.key, this.status, this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  title ?? 'Idea Management',
                  style: TextStyle(
                      fontSize: 24,
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: 300,
                child: CustomSearch(onSearch: (search) {}),
              )
            ],
          ),
          const SizedBox(height: 16),
          Expanded(
            child: SingleChildScrollView(
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: List.generate(
                  10,
                  (index) => CustomIdeaCard(
                    status: status,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CustomIdeaCard extends StatelessWidget {
  final String? status;
  const CustomIdeaCard({super.key, this.status});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 404,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image: NetworkImage(
              'https://plus.unsplash.com/premium_photo-1682124802983-594778066eb5?q=80&w=1932&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          if (status == 'Pending')
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: FeatureCard(
                  icon: Icons.pending,
                  text: 'Pending',
                  backgroundColor: Colors.black.withAlpha(150),
                  color: Colors.orange,
                  borderColor: Colors.orange,
                ),
              ),
            ),
          // Gradient Overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              gradient: LinearGradient(
                colors: [
                  Colors.black.withOpacity(0.5),
                  Colors.transparent,
                ],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight,
              ),
            ),
          ),

          // Text Content
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Adventurer",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    "VR Shows",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Circular Arrow Button
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.2),
                ),
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
