import 'package:flutter/material.dart';

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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Buildoverview(
                title: 'Active Users',
                subtitle: '+12% from last month',
                icon: Icons.person,
                value: '1234',
              ),
              Buildoverview(
                title: 'Pending Ideas',
                subtitle: '+',
                icon: Icons.lightbulb_outline,
                value: '56',
              ),
              Buildoverview(
                title: 'Total Ideas',
                subtitle: '+8% from last month',
                icon: Icons.trending_up,
                value: '789',
              ),
              Buildoverview(
                title: 'Open Disputes',
                subtitle: '',
                icon: Icons.warning,
                value: '12',
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Recent Users section
          const Text(
            'Recent Users',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Card(
            child: ListTile(
              leading: CircleAvatar(
                child: Text('J'),
              ),
              title: Text('John Doe'),
              subtitle: Text('john@example.com'),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'active',
                    style: TextStyle(color: Colors.green),
                  ),
                  SizedBox(width: 8),
                  Text('2 minutes ago'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),
          // Pending Ideas section
          const Text(
            'Pending Ideas',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Sustainable Urban Farming',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'A system for implementing vertical farming in urban areas...',
                        ),
                        SizedBox(height: 4),
                        Text('Submitted by Jane Smith'),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_up, color: Colors.green),
                  ),
                  const SizedBox(width: 8),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.thumb_down, color: Colors.red),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
