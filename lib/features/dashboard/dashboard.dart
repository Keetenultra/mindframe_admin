import 'package:flutter/material.dart';
import 'package:flutter_application_1/features/idea/idea_managements.dart';

import '../../common_widget/custom_search.dart';
import '../buildoverview.dart';

class DashBoardSection extends StatelessWidget {
  const DashBoardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Dashboard Overview section
          const Text(
            'Dashboard Overview',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          const Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Buildoverview(
                title: 'Active Users',
                icon: Icons.person,
                value: '1234',
              ),
              Buildoverview(
                title: 'Pending Ideas',
                icon: Icons.lightbulb_outline,
                value: '56',
              ),
              Buildoverview(
                title: 'Total Ideas',
                icon: Icons.trending_up,
                value: '789',
              ),
              Buildoverview(
                title: 'Open Disputes',
                icon: Icons.warning,
                value: '12',
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Recent Users section

          Row(
            children: [
              Expanded(
                child: const Text(
                  'Pending Idea',
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
                    status: "Pending",
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
