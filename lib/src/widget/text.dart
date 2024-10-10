import 'package:flutter/material.dart';

class TextWidget extends StatefulWidget {
  const TextWidget(this.data, {super.key});

  final String data;

  @override
  State<TextWidget> createState() => _State();
}

class _State extends State<TextWidget> {
  @override
  void initState() {
    print("MyLog: flutter: TextWidget.initState(${widget.data})");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("MyLog: flutter: TextWidget.build(${widget.data})");
    return Text(widget.data);
  }
}
