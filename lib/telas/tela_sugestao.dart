import 'package:flutter/material.dart';

class TelaSugestao extends StatelessWidget {
  const TelaSugestao({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sugerir uma afirmação')),
      body: const SizedBox.shrink(),
    );
  }
}
