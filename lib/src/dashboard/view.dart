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
            onPressed: () => controller.signOut(),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome, ${controller.currentUserEmail}!',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 16),
            const Text('You are now logged in.'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.navigateToGeotagging,
              child: const Text('Geotagging'),
            ),
          ],
        ),
      ),
    );
  }
}
