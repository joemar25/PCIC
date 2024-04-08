// file: dashboard/view.dart
import 'package:flutter/material.dart';

import 'controller.dart';

class DashboardView extends StatelessWidget {
  final DashboardController controller;

  const DashboardView({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => controller.signout(context),
          ),
        ],
      ),
      body: const Center(
        child: Text('Welcome to the Dashboard!'),
      ),
    );
  }
}
