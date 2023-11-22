import 'package:flutter/material.dart';

import 'button.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({super.key});

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
              const Button(
                child: Text(
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
              const Button(
                child: Text(
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
              const Button(
                child: Text(
                  "//",
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
              const Button(
                child: Icon(
                  Icons.close,
                  color: Colors.blue,
                  size: 32,
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
              const Button(
                child: Text(
                  "7",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "8",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "9",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
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
              const Button(
                child: Text(
                  "4",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "5",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "6",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
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
              const Button(
                child: Text(
                  "1",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "2",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "3",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
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
              const Button(
                child: Text(
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
                child: Text(
                  "0",
                  style: TextStyle(
                    fontSize: 24,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Button(
                  child: Icon(
                    Icons.backspace_outlined,
                    color: Colors.blue,
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              ),
              const Button(
                child: Text(
                  "=",
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
        ],
      ),
    );
  }
}
