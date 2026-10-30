import 'package:flutter/material.dart';

import 'modelos/afirmacao.dart';
import 'telas/tela_desafio.dart';
import 'telas/tela_explicacao.dart';
import 'telas/tela_inicial.dart';
import 'telas/tela_sugestao.dart';
import 'telas/tela_tema.dart';
import 'telas/tela_trilha.dart';

/// Parâmetros que a tela de desafio envia para a tela de explicação.
class ArgumentosExplicacao {
  const ArgumentosExplicacao({required this.afirmacao, required this.resposta});

  final Afirmacao afirmacao;
  final Classificacao resposta;
}

/// Rotas nomeadas do app.
abstract final class Rotas {
  static const inicial = '/';
  static const trilha = '/trilha';
  static const tema = '/tema';
  static const desafio = '/desafio';
  static const explicacao = '/explicacao';
  static const sugestao = '/sugestao';

  static Route<void> gerar(RouteSettings settings) {
    final Widget tela = switch (settings.name) {
      trilha => const TelaTrilha(),
      tema => TelaTema(tema: settings.arguments! as Tema),
      desafio => TelaDesafio(afirmacao: settings.arguments! as Afirmacao),
      explicacao => TelaExplicacao(
        argumentos: settings.arguments! as ArgumentosExplicacao,
      ),
      sugestao => const TelaSugestao(),
      _ => const TelaInicial(),
    };

    return MaterialPageRoute<void>(settings: settings, builder: (_) => tela);
  }
}
