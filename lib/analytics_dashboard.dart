import 'package:flutter/material.dart';

class AnalyticsApp extends StatelessWidget {
  const AnalyticsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AnalyticsDashboard(),
    );
  }
}

class AnalyticsDashboard extends StatelessWidget {
  const AnalyticsDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Analytics Dashboard',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Download Report',
                style: TextStyle(color: Colors.black)),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildStatCard(
                  'Total Users',
                  '2,543',
                  '+12.5%',
                  Icons.people,
                  Colors.blue,
                ),
                _buildStatCard(
                  'Active Sessions',
                  '1,875',
                  '+8.2%',
                  Icons.show_chart,
                  Colors.purple,
                ),
                _buildStatCard(
                  'Revenue',
                  '\$45,231',
                  '-3.1%',
                  Icons.attach_money,
                  Colors.red,
                ),
                _buildStatCard(
                  'Avg. Session Time',
                  '4m 32s',
                  '+18.4%',
                  Icons.timer,
                  Colors.green,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            _buildChartCard(),
            const SizedBox(height: 20.0),
            _buildRecentActivity(),
          ],
        ),
      ),
    );
  }

  Widget _buildStatCard(String title, String value, String change,
      IconData icon, Color iconColor) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 30),
                const SizedBox(width: 10.0),
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Text(
              value,
              style: const TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            Text(
              change,
              style: TextStyle(
                color: change.contains('-') ? Colors.red : Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChartCard() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'User Growth',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
                Icon(Icons.bar_chart),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 200.0,
              color: Colors.grey[200], // Placeholder for a chart
              alignment: Alignment.center,
              child: const Text(
                'Chart Placeholder',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Recent Activity',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
            ),
            const SizedBox(height: 10.0),
            _buildActivityItem('New user registration',
                'John Doe joined the platform', '2m ago'),
            const Divider(),
            _buildActivityItem('New user registration',
                'Jane Smith joined the platform', '5m ago'),
            const Divider(),
            _buildActivityItem('New user registration',
                'Alice Johnson joined the platform', '10m ago'),
          ],
        ),
      ),
    );
  }

  Widget _buildActivityItem(String title, String description, String time) {
    return Row(
      children: [
        const Icon(Icons.person, size: 30, color: Colors.blue),
        const SizedBox(width: 10.0),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                description,
                style: const TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
        Text(
          time,
          style: const TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}
