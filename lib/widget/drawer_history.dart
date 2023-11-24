import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/operation_bloc.dart';

class DrawerHistory extends StatelessWidget {
  const DrawerHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        return Drawer(
          child: Column(
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Color(0xFF31364B),
                ),
                child: Center(
                  child: Text(
                    "History",
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    for (int i = state.history.length - 1; i >= 0; i--)
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                        ),
                        child: ListTile(
                          title: Text(
                            state.history[i].operation,
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            state.history[i].resultValue.toString(),
                          ),
                          onTap: () {
                            context.read<OperationBloc>().add(
                                  LoadOperation(
                                    operation: state.history[i].operation,
                                  ),
                                );
                            Navigator.pop(context);
                          },
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
