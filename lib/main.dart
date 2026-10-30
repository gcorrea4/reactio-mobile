import 'package:flutter/material.dart';

import 'estado/progresso_trilha.dart';
import 'estilo/estilo_app.dart';
import 'rotas.dart';

void main() {
  runApp(const ReactioApp());
}

class ReactioApp extends StatelessWidget {
  const ReactioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProgressoTrilha(
      child: MaterialApp(
        title: 'REACTIO',
        debugShowCheckedModeBanner: false,
        theme: EstiloApp.tema,
        initialRoute: Rotas.inicial,
        onGenerateRoute: Rotas.gerar,
      ),
    );
  }
}
