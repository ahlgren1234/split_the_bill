import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Split The Bill"),
      ),
      backgroundColor: Colors.blue[100],
      body: Container(
        child: const Center(
          child: Text("Hej"),
        ),
      ),
    );
  }
}
