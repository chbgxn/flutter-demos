import 'dart:io';
import 'package:avatar_replacement/providers/avatar_provider.dart';
import 'package:avatar_replacement/screens/avater_edit_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final avatarPath = ref.watch(avatarProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('首页')),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(
                context, 
                MaterialPageRoute(builder: (_) => AvaterEditScreen())
              ),
              child: SizedBox(
                height: 300,
                child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Hero(
                      tag: 'avatar', 
                      child: avatarPath == 'assets/images/default_avatar.png'
                        ? Image.asset('assets/images/default_avatar.png',height: 150)
                        : Image.file(File(avatarPath), height: 150)
                    ),
                    const Text('Hello')
                  ],
                ),
              )
            ),
          ],
        ),
      ),
      body: Center(
        child: const Text(
          '滚滚长江东逝水',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold
          ),
        )
      ),
    );
  }
}