import 'package:developer_calculator/bloc/operation_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OperationText extends StatelessWidget {
  const OperationText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OperationBloc, OperationState>(
      builder: (context, state) {

        double? result = state.result?.getValue();

        return Container(
          padding: const EdgeInsets.all(16),
          alignment: Alignment.centerRight,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                state.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (result != null)
                Text(
                  "= ${result}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
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
