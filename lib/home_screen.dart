import 'package:flutter/material.dart';
import 'package:flutter_application_1/analytics_dashboard.dart';
import 'package:flutter_application_1/buildnavitem.dart';
import 'package:flutter_application_1/buildoverview.dart';
import 'package:flutter_application_1/content_mon.dart';

void main() {
  runApp(const HomeScreen());
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Admin Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const AdminDashboard(),
    );
  }
}

class AdminDashboard extends StatefulWidget {
  const AdminDashboard({super.key});

  @override
  State<AdminDashboard> createState() => _AdminDashboardState();
}

class _AdminDashboardState extends State<AdminDashboard>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(vsync: this, length: 4);
    tabController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Side navigation bar
          Container(
            width: 250,
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: Column(
              children: [
                const Text(
                  'Mindframe',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'Admin Portal',
                  style: TextStyle(color: Colors.white),
                ),
                const SizedBox(height: 32),
                Buildnavitem(
                  isActive: tabController.index == 0,
                  icon: Icons.dashboard,
                  title: 'Dashboard',
                  ontap: () {
                    tabController.animateTo(0);
                  },
                ),
                Buildnavitem(
                  isActive: tabController.index == 1,
                  icon: Icons.people,
                  title: 'User Management',
                  ontap: () {
                    tabController.animateTo(1);
                  },
                ),
                Buildnavitem(
                  isActive: tabController.index == 2,
                  icon: Icons.lightbulb_outline,
                  title: 'Content Moderation',
                  ontap: () {
                    tabController.animateTo(2);
                  },
                ),
                Buildnavitem(
                  isActive: tabController.index == 3,
                  icon: Icons.analytics,
                  title: 'Analytics',
                  ontap: () {
                    tabController.animateTo(3);
                  },
                ),
              ],
            ),
          ),
          // Main content area
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
              child: TabBarView(
                controller: tabController,
                children: [
                  const DashBoardSection(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      const Text(
                        'User Management',
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 0, 0, 0),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Manage your platform users and their access',
                              style: TextStyle(
                                  fontSize: 16, color: Colors.grey[700]),
                            ),
                            const SizedBox(
                              height: 16,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                _buildStatsCard(
                                    'Total Users', '3', Icons.person,
                                    subtitle: ''),
                                _buildStatsCard(
                                    'Active Users', '2', Icons.person_outline,
                                    subtitle: '+12% from last month'),
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.1),
                                      spreadRadius: 1,
                                      blurRadius: 30,
                                    ),
                                  ],
                                  color: Colors.grey.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadiusDirectional.circular(10)),
                              width: 1500,
                              height: 400,
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 20, vertical: 20),
                                          child: Container(
                                            height: 50,
                                            color: Colors.white,
                                            child: DataTable(
                                              dataTextStyle: const TextStyle(
                                                  fontWeight: FontWeight.w900),
                                              columns: const [
                                                DataColumn(
                                                    label: Text('USER',
                                                        style: TextStyle(
                                                            fontSize: 15,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold))),
                                                DataColumn(
                                                    label: Text('STATUS')),
                                                DataColumn(
                                                    label: Text('LAST ACTIVE')),
                                                DataColumn(
                                                    label: Text('ACTIONS')),
                                              ],
                                              rows: [
                                                DataRow(cells: [
                                                  const DataCell(
                                                      Text('John Doe')),
                                                  const DataCell(
                                                      Text('Active')),
                                                  const DataCell(
                                                      Text('2 minutes ago')),
                                                  DataCell(Row(
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.person),
                                                        onPressed: () {},
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  const DataCell(
                                                      Text('Jane Smith')),
                                                  const DataCell(
                                                      Text('Active')),
                                                  const DataCell(
                                                      Text('5 minutes ago')),
                                                  DataCell(Row(
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.person),
                                                        onPressed: () {},
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  )),
                                                ]),
                                                DataRow(cells: [
                                                  const DataCell(
                                                      Text('James Johnson')),
                                                  const DataCell(
                                                      Text('Inactive')),
                                                  const DataCell(
                                                      Text('1 hour ago')),
                                                  DataCell(Row(
                                                    children: [
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.person),
                                                        onPressed: () {},
                                                      ),
                                                      IconButton(
                                                        icon: const Icon(
                                                            Icons.more_vert),
                                                        onPressed: () {},
                                                      ),
                                                    ],
                                                  )),
                                                ]),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const ContentMon(),
                  const AnalyticsDashboard()
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildStatsCard(String title, String value, IconData icon,
      {String subtitle = ''}) {
    return Expanded(
      child: Card(
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
      ),
    );
  }

  Widget _buildOverviewCard(
      String title, String value, String subtitle, IconData icon) {
    return Expanded(
      child: Card(
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
      ),
    );
  }
}

class DashBoardSection extends StatelessWidget {
  const DashBoardSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
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
              Row(
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
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    child: Text('J'),
                  ),
                  title: const Text('John Doe'),
                  subtitle: const Text('john@example.com'),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
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
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
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
        ),
      ),
    );
  }
}
