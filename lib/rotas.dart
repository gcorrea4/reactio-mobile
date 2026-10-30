import 'package:flutter/material.dart';

import 'telas/tela_inicial.dart';
import 'telas/tela_sugestao.dart';
import 'telas/tela_trilha.dart';

/// Rotas nomeadas do app.
abstract final class Rotas {
  static const inicial = '/';
  static const trilha = '/trilha';
  static const sugestao = '/sugestao';

  static Route<void> gerar(RouteSettings settings) {
    final Widget tela = switch (settings.name) {
      trilha => const TelaTrilha(),
      sugestao => const TelaSugestao(),
      _ => const TelaInicial(),
    };

    return MaterialPageRoute<void>(settings: settings, builder: (_) => tela);
  }
}
