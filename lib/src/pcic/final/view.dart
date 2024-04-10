import 'dart:io';

import 'package:flutter/material.dart';

class PCICFinalView extends StatelessWidget {
  final String screenshotPath;
  // Add other necessary data as parameters

  const PCICFinalView({super.key, required this.screenshotPath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PCIC Final View'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.file(File(screenshotPath)),
            // Add other widgets to display the necessary data
          ],
        ),
      ),
    );
  }
}
