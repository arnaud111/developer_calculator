import 'package:developer_calculator/bloc/operation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationText extends StatelessWidget {
  const OperationText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {
        double? result = state.result?.compute();

        return Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
                },
                child: const Icon(
                  Icons.history,
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              SizedBox(
                height: 32,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                          state.operation.length + 1, (index) => index)
                      .map((index) {
                    if (index == state.cursor) {
                      return Container(
                        height: 32,
                        width: 2,
                        color: Colors.blue,
                      );
                    }

                    return GestureDetector(
                      onTapUp: (TapUpDetails details) {
                        context.read<OperationBloc>().add(
                              Move(
                                index:
                                    (index > state.cursor ? index - 1 : index) +
                                        (details.localPosition.dx > 10 ? 1 : 0),
                              ),
                            );
                      },
                      child: SizedBox(
                        width: 20,
                        child: Center(
                          child: Text(
                            state.operation[
                                (index > state.cursor ? index - 1 : index)],
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
              if (result != null)
                Text(
                  "= ${result % 1 > 0 ? result : result.toInt()}",
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
