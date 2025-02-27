import 'package:flutter/material.dart';
import 'package:flutter_application_1/common_widget/custom_drawer.dart';
import 'package:flutter_application_1/features/category/category_screen.dart';
import 'package:flutter_application_1/features/idea/idea_managements.dart';

import 'dashboard/dashboard.dart';
import 'users/user_management.dart';

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
    tabController = TabController(vsync: this, length: 5);
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
          CustomDrawer(tabController: tabController),
          Expanded(
            child: TabBarView(
              controller: tabController,
              children: const [
                DashBoardSection(),
                UserManagementSection(),
                IdeaManagements(),
                IdeaManagements(
                  title: 'Pending Idea',
                  status: 'Pending',
                ),
                CategoryScreen(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
