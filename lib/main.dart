import 'package:flutter/material.dart';

import 'estilo/estilo_app.dart';

void main() {
  runApp(const ReactioApp());
}

class ReactioApp extends StatelessWidget {
  const ReactioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'REACTIO',
      debugShowCheckedModeBanner: false,
      theme: EstiloApp.tema,
      home: const Scaffold(body: Center(child: Text('REACTIO'))),
    );
  }
}
