import 'package:flutter/material.dart';

class UserManagementSection extends StatelessWidget {
  const UserManagementSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildStatsCard('Total Users', '3', Icons.person,
                      subtitle: ''),
                  _buildStatsCard('Active Users', '2', Icons.person_outline,
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
                    borderRadius: BorderRadiusDirectional.circular(10)),
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
                                              fontWeight: FontWeight.bold))),
                                  DataColumn(label: Text('STATUS')),
                                  DataColumn(label: Text('LAST ACTIVE')),
                                  DataColumn(label: Text('ACTIONS')),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    const DataCell(Text('John Doe')),
                                    const DataCell(Text('Active')),
                                    const DataCell(Text('2 minutes ago')),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.person),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_vert),
                                          onPressed: () {},
                                        ),
                                      ],
                                    )),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('Jane Smith')),
                                    const DataCell(Text('Active')),
                                    const DataCell(Text('5 minutes ago')),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.person),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_vert),
                                          onPressed: () {},
                                        ),
                                      ],
                                    )),
                                  ]),
                                  DataRow(cells: [
                                    const DataCell(Text('James Johnson')),
                                    const DataCell(Text('Inactive')),
                                    const DataCell(Text('1 hour ago')),
                                    DataCell(Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(Icons.person),
                                          onPressed: () {},
                                        ),
                                        IconButton(
                                          icon: const Icon(Icons.more_vert),
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
    );
  }
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
