import 'package:flutter/material.dart';

import 'dados/trilha_mock.dart';
import 'modelos/afirmacao.dart';
import 'telas/tela_desafio.dart';
import 'telas/tela_explicacao.dart';
import 'telas/tela_inicial.dart';
import 'telas/tela_sugestao.dart';
import 'telas/tela_tema.dart';
import 'telas/tela_trilha.dart';

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
        afirmacao: temas.first.afirmacoes.first,
        resposta: temas.first.afirmacoes.first.classificacao,
      ),
      sugestao => const TelaSugestao(),
      _ => const TelaInicial(),
    };

    return MaterialPageRoute<void>(settings: settings, builder: (_) => tela);
  }
}
