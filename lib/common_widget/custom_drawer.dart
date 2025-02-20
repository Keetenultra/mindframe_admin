import 'package:flutter/material.dart';

class CustomDrawer extends StatefulWidget {
  final TabController tabController;
  const CustomDrawer({
    super.key,
    required this.tabController,
  });

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer>
    with SingleTickerProviderStateMixin {
  void changeIndex(int index) {
    widget.tabController.animateTo(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
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
            isActive: widget.tabController.index == 0,
            icon: Icons.dashboard,
            title: 'Dashboard',
            ontap: () {
              widget.tabController.animateTo(0);
            },
          ),
          Buildnavitem(
            isActive: widget.tabController.index == 1,
            icon: Icons.people,
            title: 'User Management',
            ontap: () {
              widget.tabController.animateTo(1);
            },
          ),
          Buildnavitem(
            isActive: widget.tabController.index == 2,
            icon: Icons.lightbulb_outline,
            title: 'Content Moderation',
            ontap: () {
              widget.tabController.animateTo(2);
            },
          ),
          Buildnavitem(
            isActive: widget.tabController.index == 3,
            icon: Icons.analytics,
            title: 'Analytics',
            ontap: () {
              widget.tabController.animateTo(3);
            },
          ),
          Buildnavitem(
            isActive: widget.tabController.index == 4,
            icon: Icons.category,
            title: 'Categories',
            ontap: () {
              widget.tabController.animateTo(4);
            },
          ),
        ],
      ),
    );
  }
}

class Buildnavitem extends StatelessWidget {
  final Function() ontap;
  final IconData icon;
  final String title;
  final bool isActive;

  const Buildnavitem({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isActive
          ? const Color.fromARGB(255, 149, 63, 247)
          : Colors.deepPurple,
      child: ListTile(
        leading: Icon(icon, color: Colors.white),
        title: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        onTap: ontap,
      ),
    );
  }
}
