import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('ProfileScreen')),
      body: Center(
        child: const Text('Here is ProfileScreen'),
      ),
    );
  }
}