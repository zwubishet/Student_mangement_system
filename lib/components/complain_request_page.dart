import 'package:flutter/material.dart';

class FloatingAskButton extends StatelessWidget {
  const FloatingAskButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      child: CircleAvatar(child: Text("ASK")),
    ); // Replace with your actual widget implementation
  }
}
