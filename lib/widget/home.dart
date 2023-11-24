import 'package:developer_calculator/widget/drawer_history.dart';
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
    return SafeArea(
      child: Scaffold(
        drawer: const DrawerHistory(),
        body: Column(
          children: [
            const SizedBox(
              height: 16,
            ),
            const Expanded(
              child: OperationText(),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width * 1.26,
              child: const Keyboard(),
            ),
          ],
        ),
      ),
    );
  }
}
