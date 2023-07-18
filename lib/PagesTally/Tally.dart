import 'package:flutter/material.dart';

class Tally extends StatefulWidget {
  const Tally({super.key});

  @override
  State<Tally> createState() => _TallyState();
}

class _TallyState extends State<Tally> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Tally"),)
    );
  }
}
