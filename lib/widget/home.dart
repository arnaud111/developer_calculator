import 'package:developer_calculator/widget/keyboard.dart';
import 'package:developer_calculator/widget/operation_text.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(),
      ),
      body: const Column(
        children: [
          Expanded(
            flex: 1,
            child: OperationText(),
          ),
          Expanded(
            flex: 3,
            child: Keyboard(),
          ),
        ],
      ),
    );
  }
}
