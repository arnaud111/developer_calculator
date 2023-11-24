import 'package:developer_calculator/widget/drawer_history.dart';
import 'package:developer_calculator/widget/keyboard.dart';
import 'package:developer_calculator/widget/operation_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/operation_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocBuilder<OperationBloc, OperationState>(
        builder: (context, state) {
          return Scaffold(
            drawer: const DrawerHistory(),
            body: Column(
              children: [
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<OperationBloc>().add(
                            Move(
                              index: state.operation.length,
                            ),
                          );
                    },
                    child: const OperationText(),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width * 1.26,
                  child: Keyboard(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
