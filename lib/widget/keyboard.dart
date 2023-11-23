import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/operation_bloc.dart';
import 'button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

  void add(BuildContext context, String append) {
    final postManagementBloc = BlocProvider.of<OperationBloc>(context);
    postManagementBloc.add(Add(
      append: append,
    ));
  }

  void remove(BuildContext context) {
    final postManagementBloc = BlocProvider.of<OperationBloc>(context);
    postManagementBloc.add(Remove());
  }

  void reset(BuildContext context) {
    final postManagementBloc = BlocProvider.of<OperationBloc>(context);
    postManagementBloc.add(Init());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF21262B),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(32),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "("),
                child: const Text(
                  "(",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, ")"),
                child: const Text(
                  ")",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                child: const Text(
                  " ",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                child: const Text(
                  " ",
                  style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "/"),
                child: const Text(
                  "/",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "~/"),
                child: const Text(
                  "~/",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "*"),
                child: const Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 32,
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => remove(context),
                onLongPress: () => reset(context),
                child: const Icon(
                  Icons.backspace_outlined,
                  color: Colors.blue,
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "7"),
                child: const Text(
                  "7",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "8"),
                child: const Text(
                  "8",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "9"),
                child: const Text(
                  "9",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "-"),
                child: const Text(
                  "-",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "4"),
                child: const Text(
                  "4",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "5"),
                child: const Text(
                  "5",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "6"),
                child: const Text(
                  "6",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "+"),
                child: const Text(
                  "+",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "1"),
                child: const Text(
                  "1",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "2"),
                child: const Text(
                  "2",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "3"),
                child: const Text(
                  "3",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "%"),
                child: const Text(
                  "%",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => reset(context),
                child: const Text(
                  "C",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "0"),
                child: const Text(
                  "0",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              Button(
                onTap: () => add(context, "."),
                child: const Text(
                  ".",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                color: Colors.blue,
                child: Text(
                  "=",
                  style: TextStyle(
                    fontSize: 32,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
            ],
          ),
          Expanded(
            child: Container(),
          ),
        ],
      ),
    );
  }
}
