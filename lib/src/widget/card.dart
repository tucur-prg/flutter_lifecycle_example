import 'package:flutter/material.dart';

import 'text.dart';

class CardWidget extends StatefulWidget {
  const CardWidget({super.key});

  @override
  State<CardWidget> createState() => _State();
}

class _State extends State<CardWidget> {
  late Future<String> _task;

  @override
  void initState() {
    super.initState();
    print("MyLog: flutter: CardWidget.initState()");

    _task = Future.delayed(const Duration(seconds: 3), () => 'done');
  }

  @override
  Widget build(BuildContext context) {
    print("MyLog: flutter: CardWidget.build()");
    return FutureBuilder<String>(
      future: _task,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        print("MyLog: flutter: CardWidget.FutureBuilder(${snapshot.connectionState})");
        if (snapshot.connectionState == ConnectionState.done) {
          return SizedBox(
            height: 150,
            width: 150,
            child: Card(
              color: Colors.lightGreen,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TextWidget("const"),

                    TextWidget(snapshot.data!),

                    ElevatedButton(
                      child: const Text("card rebuild"),
                      onPressed: () {
                        setState(() {
                          // rebuild
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 150,
            width: 150,
            child: Card(
              color: Colors.lightBlue,
              child: CircularProgressIndicator(strokeWidth: 8.0),
            ),
          );
        }
      },
    );
  }
}
